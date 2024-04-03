/*
This site will handle the Yes No Component to show that as a react component
 */

function YesNoComponent({ topic, likertChange, right, left }) {
    const handleRadioChange = (e) => {
        const selectedValue = parseInt(e.target.value, 2);
        likertChange(selectedValue); // Weitergabe nur des ausgewählten Wertes
    };

    return (
        <div className="d-flex justify-content-center likert-scale-element">
            <p style={{ paddingRight: "5px" }}>{left}</p>
            <ul className="likert-scale-answers-display" id={topic}>
                {[...Array(2).keys()].map((index) => (
                    <li key={index} className="likert-scale-list">
                        <input
                            id={`${topic}-answer-${index + 1}-li`}
                            type="radio"
                            name={topic}
                            value={index}
                            onChange={handleRadioChange}
                            style={{cursor: "pointer"}}
                        />
                    </li>
                ))}
            </ul>
            <p>{right}</p>
        </div>
    );
}

export default YesNoComponent;

