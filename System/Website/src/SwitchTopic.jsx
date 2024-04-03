
/**
 * Scenario Component
 *
 * This component displays a scenario or task to the user as part of the online study.
 * Users are presented with a task description and can click "Continue" to proceed
 * to the next page of the study.
 *
 * @param {function} nextPage - A callback function to navigate to the next page of the study.
 * @param {string} Scenario - The task or scenario description to be displayed to the user.
 */


function SwitchTopic({ nextPage, Scenario }) {


    const handleClick = () => {
        nextPage();
    };

    return (
        <>
            <h1>{Scenario}</h1>
            <button onClick={handleClick} className="mt-3">
                Continue
            </button>
        </>
    );
}

export default SwitchTopic;
