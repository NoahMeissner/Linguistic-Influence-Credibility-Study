import useApiRequest from "./ApiRequest";
import {useState, useEffect} from "react";

/**
 * PostStudy Component
 *
 * This component represents the final page of the online study system, where participants provide
 * demographic information and submit their responses. It includes form fields for age, gender,
 * level of education, and occupation. Upon submission, the participant's responses are collected
 * into a JSON object and sent to the parent component for finalization.
 *
 * @param {function} nextpage - A callback function to navigate to the next page of the study.
 * @param {object} pre_one - Pre-condition questionnaire data for condition one.
 * @param {object} post_one - Post-condition questionnaire data for condition one.
 * @param {object} pre_two - Pre-condition questionnaire data for condition two.
 * @param {object} post_two - Post-condition questionnaire data for condition two.
 * @param {object} pre_three - Pre-condition questionnaire data for condition three.
 * @param {object} post_three - Post-condition questionnaire data for condition three.
 * @param {object} pre_four - Pre-condition questionnaire data for condition four.
 * @param {object} post_four - Post-condition questionnaire data for condition four.
 * @param {object} condition - Information about the study condition.
 * @param {function} final - A callback function to finalize and send the collected data.
 * @param {function} settrigger - A function to set a trigger to control API requests.
 *
 * Note: Input validation is required for user-entered data, such as age and gender.
 */

function PostStudy({nextpage,general, pre_one, post_one, pre_two, post_two, pre_three, post_three, pre_four, post_four,generalEnd, condition,final, settrigger, time}) {
    // Theoretically a user can also give chars as input that are not numeric, we should include a check and tell the user what needs to be changed. We should do this for all input stuff in general
    // Also we need level of education input



    return(
        <>
            <p className="mb-3">Thank you for your work so far. For the last step all you have to do is answer some
                question pretaining to your personal demographics.</p>
            <div className="mb-3">
                <p>How old are you?</p>
                <input type="number" className="generall-input" placeholder="e.g.18" id="age"></input>
            </div>
            <div className="mb-3">
                <p>What gender do you identify with?</p>
                <select id="gender" className="generall-input">
                    <option value="" disabled selected>Select an option</option>
                    <option id="female">Female</option>
                    <option id="male">Male</option>
                    <option id="divers">Divers</option>
                    <option id="none">Don't want to specify</option>
                </select>
            </div>
            <div className="mb-3">
                <p>What's your highest level of education'</p>
                <select id="highest-level-of-education" className="generall-input">
                    <option disabled selected>Select an option</option>
                    <option id="less than highschool">less than highschool</option>
                    <option id="highschool">highschool</option>
                    <option id="bachelor">bachelor</option>
                    <option id="master">Master</option>
                    <option id="doctorate">Doktorand</option>
                    <option id="Don't want to specify">Don't want to specify</option>
                </select>
            </div>
            <div className="mb-3">
            <p>What's your current occupation? (e.g.: if you are currently studying at a university insert
                    'Student')</p>
                <input id="occupation" className="generall-input" type="text" placeholder="e.g Student"></input>
            </div>
            <button
                onClick={() => handleClick(condition.id,general, pre_one, post_one, pre_two, post_two, pre_three, post_three, pre_four, post_four,generalEnd, condition, final, settrigger, nextpage, time)}>Submit
            </button>
        </>
    )

    function handleClick(id,general, pre_one, post_one, pre_two, post_two, pre_three, post_three, pre_four, post_four,generalEnd, condition, final, settrigger, nextpage, time) {
        let submitJson = {
            'id': id,
            'age': parseInt(document.getElementById('age').value),
            'gender': document.getElementById('gender').value,
            'levelOfEducation': document.getElementById('highest-level-of-education').value,
            'occupation': document.getElementById('occupation').value,
            'pre_one':pre_one,
            'pre_two':pre_two,
            'pre_three':pre_three,
            'pre_four':pre_four,
            'post_one':post_one,
            'post_two':post_two,
            'post_three':post_three,
            'post_four':post_four,
            'condition':condition,
            'general':general,
            'generalEnd':generalEnd,
            'time':time
        };
        console.log(submitJson)
        final(submitJson)
        settrigger(true)
        nextpage();
    }
}




export default PostStudy