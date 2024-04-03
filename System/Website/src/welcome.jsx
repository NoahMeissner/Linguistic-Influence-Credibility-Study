import React, { useState, useEffect } from 'react';
import useApiRequest from './ApiRequest';

function Welcome({ nextPage}) {
    const [avaData, setAvaData] = useState(null);  // State für die API-Antwort

    const { data: ava, error: idError } = useApiRequest('https://online-sudy-system.vercel.app/available', true, "");

    useEffect(() => {
        if (ava) {
            setAvaData(ava);
        }
        if (idError) {
            console.error('Es gab einen Fehler:', idError);
        }
    }, [ava, idError]);

    const handleClick = () => {
        if (avaData != null) {
            nextPage(avaData);  // nextPage-Funktion mit API-Antwort aufrufen
        }
    };

    return (
        <>
            <div className="content">
                <h1>Welcome to our Study</h1>
                <div className="center">
                    <p> You are invited to take part in an online study investigating linguistic behavior in blog articles. The study will be conducted by Noah Meissner, Simon Manzenberger, Samuel Bullard und Camilla Duetsch and supervised by Dr David Elsweiler from the University of Regensburg. The duration of the study is 20 minutes. Students at the University of Regensburg will receive 0.5 credit hours. The study can only be started once and should be completed in one go.
                    </p>
                </div>
                <button onClick={handleClick} className="mt-3" disabled={!avaData}>
                    Continue
                </button>
            </div>
        </>
    );
}

export default Welcome;
