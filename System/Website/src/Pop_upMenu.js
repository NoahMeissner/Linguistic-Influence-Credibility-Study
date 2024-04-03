function Pop_upMenu({ topic, likertChange, right, left }) {
    const handleSelectChange = (event) => {
        likertChange(event.target.value);
    };

    return (
        <div className="d-flex justify-content-center likert-scale-element">
            <ul className="likert-scale-answers-display" id={topic}>
                        <select id="topic" className="generall-input" onChange={handleSelectChange} defaultValue="Select an option">
                            <option disabled value="Select an option">Select an option</option>
                            <option value="Never">Never</option>
                            <option value="Once a year">Once a year</option>
                            <option value="Once a month">Once a month</option>
                            <option value="Once a week">Once a week</option>
                            <option value="Daily">Daily</option>
                            <option value="Few per day">Few per day</option>
                        </select>
            </ul>
        </div>
    );
}

export default Pop_upMenu;
