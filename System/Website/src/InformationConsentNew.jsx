import React, {useEffect, useState} from 'react';
import PDFViewer from './PDFViewer';

function InformationConsentNew({ nextPage }) {
    const [agreed, setAgreed] = useState(false);
    const endOfPageRef = React.useRef(null);

    const handleAgreement = () => {
        setAgreed(true);
        console.log('User agreed to the terms and conditions');
    };

    useEffect(() => {
        if (agreed) {
            endOfPageRef.current.scrollIntoView({ behavior: 'smooth' });
        }
    }, [agreed]);

    return (
        <div className="content">
            <h1>Informed Consent</h1>
            <PDFViewer url="https://online-credibility-study-platform-storage.fra1.digitaloceanspaces.com/informed_consent.pdf" />

            <div className="consent-agree-button">
                {!agreed && (
                    <button onClick={handleAgreement}><b>Agree to Terms and Conditions</b></button>
                )}
            </div>

            {agreed && (
                <>
                    <p style={{textAlign: 'center'}}>User has agreed to the terms and conditions.</p>
                    <div ref={endOfPageRef} className="next-page-button">
                        <button onClick={nextPage} className="mt-3"><b>Next Page</b></button>
                    </div>
                </>
            )}
        </div>
    );
}

export default InformationConsentNew;