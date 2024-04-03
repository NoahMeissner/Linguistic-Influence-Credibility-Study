import React, { useEffect, useState } from 'react';
import * as pdfjs from 'pdfjs-dist/build/pdf.min.mjs';
import './css/own-css.css'; // Assuming your spinner and responsive design CSS is here

// Set the worker source
pdfjs.GlobalWorkerOptions.workerSrc = await import('pdfjs-dist/build/pdf.worker.mjs');

const PDFViewer = ({ url }) => {
  const [pdfDocument, setPdfDocument] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let isCancelled = false;

    const loadPdfDocument = async () => {
      try {
        const loadingTask = pdfjs.getDocument(url);
        const pdf = await loadingTask.promise;
        if (!isCancelled) {
          setPdfDocument(pdf);
          setLoading(false);
        }
      } catch (error) {
        console.error('Error loading PDF: ', error);
        if (!isCancelled) {
          setLoading(false); // Ensure loading state is updated even on error
        }
      }
    };

    loadPdfDocument();

    return () => {
      isCancelled = true;
    };
  }, [url]);

  useEffect(() => {
    const resizeListener = () => {
      if (pdfDocument) {
        displayPdf();
      }
    };

    window.addEventListener('resize', resizeListener);

    return () => {
      window.removeEventListener('resize', resizeListener);
    };
  }, [pdfDocument]);

  useEffect(() => {
    if (pdfDocument) {
      displayPdf();
    }
  }, [pdfDocument]);

  const displayPdf = async () => {
    try {
      const numPages = pdfDocument.numPages;
      const container = document.querySelector('.pdf-container');

      container.innerHTML = '';

      for (let pageNum = 1; pageNum <= numPages; pageNum++) {
        const page = await pdfDocument.getPage(pageNum);
        const scale = Math.min(1.5, window.innerWidth / 800) * window.devicePixelRatio;
        const viewport = page.getViewport({ scale: scale / window.devicePixelRatio });
        const canvas = document.createElement('canvas');

        // Set canvas size to the viewport size multiplied by the devicePixelRatio to increase resolution
        canvas.width = viewport.width * window.devicePixelRatio;
        canvas.height = viewport.height * window.devicePixelRatio;

        // Ensure the displayed size is not affected by the increased canvas size
        canvas.style.width = `${viewport.width}px`;
        canvas.style.height = `${viewport.height}px`;

        canvas.style.display = 'block';
        canvas.style.maxWidth = '100%';
        canvas.style.margin = 'auto';
        canvas.style.marginBottom = '10px';
        canvas.style.border = '1px solid black';

        const context = canvas.getContext('2d');
        // Scale the canvas context to account for the increased canvas size
        context.scale(window.devicePixelRatio, window.devicePixelRatio);

        const renderContext = { canvasContext: context, viewport: viewport };
        await page.render(renderContext).promise;

        container.appendChild(canvas);
      }
    } catch (error) {
      console.error('Error displaying PDF: ', error);
    }
  };

  return (
      <div>
        {loading ? (
            <div className="spinner"></div>
        ) : (
            <div className="pdf-container"></div>
        )}
      </div>
  );
};

export default PDFViewer;