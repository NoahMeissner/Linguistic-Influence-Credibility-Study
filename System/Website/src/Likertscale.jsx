function Likertscale({ topic, likertChange, right, left }) {
    const handleRadioChange = (e) => {
        const selectedValue = parseInt(e.target.value, 10);
        likertChange(selectedValue); // Weitergabe nur des ausgewählten Wertes
    };

    // Basis-Styles, die auf beide Browser zutreffen
    let likertScaleStyles = {
        display: 'flex',
        justifyContent: 'center',
        padding: 0,
        listStyle: 'none',
        width: '100%',
    };

    let likertItemStyles = {
        display: 'flex',
        justifyContent: 'center',
        flexGrow: 1,
        flexDirection: 'column',
    };

    let labelStyle = {
        textAlign: 'center',
        margin: '5px 0',
        fontSize: '0.75rem',
    };

    // Safari Specific
    if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) {
        likertScaleStyles = { ...likertScaleStyles, alignItems: 'center' };
        likertItemStyles = { ...likertItemStyles, alignItems: 'center' };
    }

    return (
        <div className="d-flex justify-content-center likert-scale-element">
            <p style={{ paddingRight: "5px" }}>{left}</p>
            <ul style={likertScaleStyles} className="likert-scale-answers-display" id={topic}>
                {[...Array(7).keys()].map((index) => (
                    <li key={index} style={likertItemStyles} className="likert-scale-list">
                        <input
                            id={`${topic}-answer-${index + 1}-li`}
                            type="radio"
                            name={topic}
                            value={index - 3}
                            onChange={handleRadioChange}
                            style={{ cursor: "pointer" }}
                        />
                        <label htmlFor={`${topic}-answer-${index + 1}-li`} style={labelStyle}>{index - 3}</label>
                    </li>
                ))}
            </ul>
            <p>{right}</p>
        </div>
    );
}

export default Likertscale;
