import React, { useState, useEffect } from 'react';
import useApiRequest from './ApiRequest';
import PDFViewer from "./PDFViewer";

function Text({ nextPage, Path_toText, Number, setTime, timeField }) {

    const [timestamp, setTimestamp] = useState({ time: '' });

    useEffect(() => {
        const timestamp_act = Date.now();
        setTimestamp({ time: timestamp_act });
    }, []);

    const handleClick = () => {
        setTime(prevState => ({
            ...prevState,
            [timeField]: Date.now() - timestamp.time
        }));
        nextPage();
    };

    return (
        <div className="content">
            <h1>Task Text {Number}</h1>

            <PDFViewer url={Path_toText}/>
            <button onClick={handleClick} className="mt-3">
                Continue
            </button>
        </div>
    );
}

export default Text;
