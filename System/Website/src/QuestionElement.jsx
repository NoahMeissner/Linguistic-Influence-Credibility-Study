import Likertscale from "./Likertscale";
import TextInput from "./TextInput";
import YesNoComponent from "./YesNoComponent";
import Pop_upMenu from "./Pop_upMenu";

/**
 * QuestionElement Component
 *
 * This component dynamically renders different types of question components based on the props it receives.
 * It supports rendering a TextInput, LikertScale, YesNoComponent, or a Pop_upMenu component depending on the
 * type of question and the `component` prop. It is designed to be flexible, allowing for various question formats
 * in a questionnaire or survey context. The `likertChange` function is passed down to handle changes in the user's
 * selection or input, ensuring that the parent component can track the state of answers.
 *
 * Props:
 * @param {object} props - The properties passed to the QuestionElement component.
 * @param {string} props.question - The question text to be displayed.
 * @param {function} props.likertChange - The callback function that handles changes in the selected value for the question.
 * @param {string|null|boolean} props.component - Determines the type of question component to render. It can be either
 *                                                'drop_menu' (for a Pop_upMenu), `true` (for a Likertscale), `null` (for a TextInput),
 *                                                or `false` (for a YesNoComponent).
 * @param {string} [props.right] - Optional. The text for the right label of a Likert scale or Yes/No component, if applicable.
 * @param {string} [props.left] - Optional. The text for the left label of a Likert scale or Yes/No component, if applicable.
 *
 * @returns React component - Renders a question element with the appropriate input component based on the type specified.
 */

function QuestionElement({ question, likertChange, component, right, left }) {
    let add

    if (component === null){
        add = <TextInput topic={question} textChange={((selectedValue) => likertChange(selectedValue))} />
    }
    else if (component == "drop_menu"){
        add = <Pop_upMenu topic={question} likertChange={(selectedValue) => likertChange(selectedValue)} right={right} left={left} />
    }
    else if (component == true)
    {
        add = <Likertscale topic={question} likertChange={(selectedValue) => likertChange(selectedValue)} right={right} left={left} />
    }
    else{
        add = <YesNoComponent topic={question} likertChange={(selectedValue) => likertChange(selectedValue)} right={right} left={left}/>
    }

    return (
        <div className="d-flex flex-column likert-scale mb-3">
            <div className="d-flex justify-content-center">
                <h2>{question}</h2>
            </div>
            {add}
        </div>
    );
}

export default QuestionElement;
