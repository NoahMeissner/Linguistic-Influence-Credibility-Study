

function TextInput({ topic, textChange }) {
    const handleTextChange = (e) => {
        const enteredText = e.target.value;
        textChange(enteredText); // Weitergabe des eingegebenen Textes
    };

    return (
        <div className="d-flex justify-content-center likert-scale-element">
            <textarea
                id={`${topic}-text-input`}
                onChange={handleTextChange}
                style={{
                    cursor: "text",
                    width: "100%", // Setzt die Breite auf 100% des Elternelements
                    height: "150px", // Setzt eine feste Höhe
                    resize: "none" // Verhindert, dass der Benutzer die Größe ändern kann
                }}
            ></textarea>
        </div>
    );
}


export default TextInput;
