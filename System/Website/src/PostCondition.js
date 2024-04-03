import React, { useEffect } from 'react';
import QuestionElement from "./QuestionElement";

/**
* PostCondition Component
*
* This component is responsible for handling post-task questionnaire tasks after
* reading a text. It displays a set of questions to the user, allowing them to
* provide answers. The component ensures that all questions are answered before
* allowing the user to proceed to the next page.
*
* @param {function} nextPage - A callback function to navigate to the next page of the study.
* @param {object} Questions - An object containing the post-condition questionnaire questions.
* @param {function} setQues - A function to update the state with user answers to questions.
*/

function PostCondition({ nextPage, Questions, setQues}) {

    const ques_static = Questions

    const setQuestionAnswer = (questionKey, answer) => {
        setQues(prevQuestions => ({
            ...prevQuestions,
            [questionKey]: {
                ...prevQuestions[questionKey],
                answer: answer
            }
        }));
    };

    const allQuestionsAnswered = Object.values(Questions).every(({ answer }) => answer !== '');

    const handleClick = () => {
        if (allQuestionsAnswered) {
            nextPage();
        } else {
            alert("Not all questions have been answered yet.");
        }
    }

    return (
        <>
            <h1>Please answer the following questions:</h1>
            {
                Object.entries(ques_static).map(([key, { question, right, left, component }]) => (
                    <QuestionElement
                        key={key}
                        question={question}
                        likertChange={(answer) => setQuestionAnswer(key, answer)}
                        component={component}
                        right={right}
                        left ={left}
                    />
                ))
            }
            <button onClick={handleClick} className="mt-3" disabled={!allQuestionsAnswered}>
                Continue
            </button>
        </>
    );
}

export default PostCondition;

