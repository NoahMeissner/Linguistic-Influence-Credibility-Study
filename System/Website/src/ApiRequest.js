import { useState, useEffect } from 'react';

/**
 * A custom React hook function that allows you to make API requests using both GET and POST methods and manage
 * the results and errors in a React component context.
 *
 * @param {string} url - The URL of the API to be requested.
 * @param {boolean} trigger - A trigger that specifies when the API request should be triggered.
 * @param {function} setTrigger - A function to update the trigger to control the re-execution of the request.
 * @param {object} json - An optional JSON data object to be sent to the API request (POST requests only).
 *
 * @returns {object} - An object with the following properties:
 * - data: The received data from the API request (can be null until the request is completed).
 */

function useApiRequest(url, trigger,settrigger, json) {
    const [data, setData] = useState(null);
    const [error, setError] = useState(null);

    useEffect(() => {
        if (!trigger) return;

        async function fetchData() {
            try {
                const response = await fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(json)
                });
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data = await response.json();
                setData(data);
                settrigger(false)
            } catch (error) {
                setError(error);
            }
        }

        if (json === "" || json === undefined) {
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(json => {
                    setData(json);
                })
                .catch(error => {
                    setError(error);
                });
        } else {
            fetchData();
        }
    }, [url, trigger, json]);

    return { data, error };
}

export default useApiRequest;
