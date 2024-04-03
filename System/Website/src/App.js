import {useEffect, useState} from 'react';
import PreCondition from "./PreCondition";
import PostCondition from "./PostCondition";
import Welcome from "./welcome";
import InformationConsentNew from "./InformationConsentNew";
import useApiRequest from "./ApiRequest";
import Scenario from "./Scenario";
import Condition from "./Condition";
import Text from "./Text";
import End from "./End";
import PostStudy from "./PostStudy";
import GetData from "./GetData";
import Matrikel from "./Matrikelnummer";
import SwitchTopic from "./SwitchTopic";
import Thankyou from "./Thankyou";

/**
 * Online Study System - React Application
 *
 * This React application is designed to facilitate online studies, including the presentation
 * of scenarios, text-based content, and survey questions to participants. It interacts with
 * external APIs to retrieve study conditions and finalize study data.
 *
 * Components:
 * - Welcome: Initial welcome screen.
 * - InformationConsentNew: Screen for obtaining participant consent and information.
 * - PreCondition: Pre-condition questionnaire screen.
 * - PostCondition: Post-condition questionnaire screen.
 * - Scenario: Screen for presenting study scenarios.
 * - Text: Screen for displaying text-based content.
 * - End: End of the study screen.
 * - PostStudy: Screen for finalizing and submitting study data.
 * - GetData: Function for processing study condition data.
 * - Condition: Function for processing text content for different study conditions.
 *
*/

function App () {
  /*
 Use states test
  */

  const [triggerApiRequest, setTriggerApiRequest] = useState(false);
  let data ={}
  let text ={}

  const [isLoading, setIsLoading] = useState(true); // Neuer Zustand für das Laden

  const [final, setfinal] = useState({
    fin:{}
  });

  const [matrk, setmatrk] = useState({
    mk:{}
  });

  const [triggerApi, setTriggerApi]= useState(false)
  const [triggerApiRequestfinal, setTriggerApiRequestfinal] = useState(false);
  const [loading, setloading]= useState(false)

  const [condition, setCondition] = useState({
    con:''
  })

  /*
  API REQUEST for condition
   */
  const { data: conditionData, error: conditionError } = useApiRequest('https://online-sudy-system.vercel.app/condition', triggerApiRequest,"");
  useEffect(() => {
    if (condition.con === '') {
      setTriggerApiRequest(true);
      setIsLoading(true); // Setzen des Ladezustands
    } else {
      setTriggerApiRequest(false);
    }
  }, [condition]);
  useEffect(() => {
    if (conditionData || conditionError) {
      // Nach der ersten Ausführung den Trigger auf false setzen
      setTriggerApiRequest(false);


      if (conditionData) {
        setCondition(conditionData);
        data = GetData(conditionData)
        text = Condition(conditionData)
        setTextOne(text['one'])
        setTextTwo(text['two'])
        setTextThree(text['three'])
        setTextFour(text['four'])
        setIsLoading(false);
        setPreOne(data['preOne'])
        setpreTwo(data['preTwo'])
        setPreThree(data['preThree'])
        setPreFour(data['preFour'])
        setPostOne(data['postOne'])
        setPostTwo(data['postTwo'])
        setPostThree(data['postThree'])
        setPostFour(data['postFour'])
        set_scenario_one(data['scenario_one'])
        set_scenario_two(data['scenario_two'])
        set_scenario_three(data['scenario_three'])
        set_scenario_four(data['scenario_four'])
        setgeneral(data['general'])
        setgeneralend(data['General_End'])
      }
      if (conditionError) {
        console.error('Es gab einen Fehler:', conditionError);
      }
    }
  }, [ conditionData, conditionError]);


  /*
  API Request for Upload Data to SQL Database
   */
  const { data: datafinal, error: errorfinal} = useApiRequest('https://online-sudy-system.vercel.app/finish',triggerApiRequestfinal, setTriggerApiRequestfinal, final);
  useEffect(() => {
    if (triggerApiRequestfinal) {
      setloading(true);
    }
    else{
      return
    }
  }, [final, triggerApiRequestfinal]);
  useEffect(() => {
    if (datafinal || errorfinal) {
      setTriggerApiRequestfinal(false);
      setloading(false)
    }
  }, [datafinal, errorfinal])// Depend on final data and the trigger to control the API request flow


  const { data: personalData, error: errorPersonal} = useApiRequest('https://online-sudy-system.vercel.app/uniDetail',triggerApi, setTriggerApi, matrk);
  useEffect(() => {
    if (triggerApi) {
      setloading(true);
    }
    else{
      return
    }
  }, [matrk, triggerApi]);
  useEffect(() => {
    if (personalData || errorPersonal) {
      setTriggerApi(false);
      setloading(false)
    }
  }, [personalData, errorPersonal])

  /*
  Answers of the user saved in the States
   */
  const [times, setTimes] = useState({
    one: '',
    two: '',
    three: '',
    four: ''
  });

  const [page, setPage] = useState(0);
  const [textOne, setTextOne] = useState()
  const [textTwo, setTextTwo] = useState()
  const [textThree, setTextThree] = useState()
  const [textFour, setTextFour] = useState()
  const [scenario_one, set_scenario_one] = useState()
  const [scenario_two, set_scenario_two] = useState()
  const [scenario_three, set_scenario_three] = useState()
  const [scenario_four, set_scenario_four] = useState()


  const [preOne, setPreOne] = useState()
  const [preTwo, setpreTwo] = useState()
  const [preThree, setPreThree] = useState()
  const [preFour, setPreFour] = useState()
  const [postOne, setPostOne] = useState()
  const [postTwo, setPostTwo] = useState()
  const [postThree, setPostThree] = useState()
  const [postFour, setPostFour] = useState()
  const [general, setgeneral] = useState()
  const [generalend, setgeneralend] = useState()

  function nextPage() {
    setPage(page +1);
  }

  /*
  Website Tree
   */
  switch (page){
    case 0:
      return <Thankyou/>
      //return <Welcome nextPage={nextPage}/>;
    case 1:
      return <InformationConsentNew nextPage={nextPage}/>;
    case 2:
      if (isLoading) {
        return <div>Lädt...</div>; // Anzeige eines Ladebildschirms oder -indikators
      }
      else {
        return nextPage()
      }
    case 3:
        return <PostCondition nextPage={nextPage} Questions= {general} setQues = {setgeneral}/>;
    case 4:
      return <SwitchTopic Scenario={"Part 1"} nextPage={nextPage}/>
    case 5:
      return <PreCondition nextPage={nextPage} Questions= {preOne} setQues = {setPreOne}/>;
    case 6:
      return <Scenario nextPage={nextPage} Scenario={scenario_one}/>
    case 7:
      return <Text nextPage={nextPage} Path_toText={textOne} Number={"1"} setTime={setTimes} timeField={"one"}/>
    case 8:
      return <PostCondition nextPage={nextPage} Questions={postOne} setQues={setPostOne}/>
    case 9:
      return <SwitchTopic Scenario={"Part 2"} nextPage={nextPage}/>
    case 10:
      return <PreCondition nextPage={nextPage} Questions= {preTwo} setQues = {setpreTwo}/>;
    case 11:
      return <Scenario nextPage={nextPage} Scenario={scenario_two}/>
    case 12:
      return <Text nextPage={nextPage} Path_toText={textTwo} Number={"2"} setTime={setTimes} timeField={"two"}/>
    case 13:
      return <PostCondition nextPage={nextPage} Questions={postTwo} setQues={setPostTwo}/>
    case 14:
      return <SwitchTopic Scenario={"Part 3"} nextPage={nextPage}/>
    case 15:
      return <PreCondition nextPage={nextPage} Questions= {preThree} setQues = {setPreThree}/>;
    case 16:
      return <Scenario nextPage={nextPage} Scenario={scenario_three}/>
    case 17:
      return <Text nextPage={nextPage} Path_toText={textThree} Number={"3"} setTime={setTimes} timeField={"three"}/>
    case 18:
      return <PostCondition nextPage={nextPage} Questions={postThree} setQues={setPostThree}/>
    case 19:
      return <SwitchTopic Scenario={"Part 4"} nextPage={nextPage}/>
    case 20:
      return <PreCondition nextPage={nextPage} Questions= {preFour} setQues = {setPreFour}/>;
    case 21:
      return <Scenario nextPage={nextPage} Scenario={scenario_four}/>
    case 22:
      return  <Text nextPage={nextPage} Path_toText={textFour} Number={"4"} setTime={setTimes} timeField={"four"}/>
    case 23:
      return <PostCondition nextPage={nextPage} Questions={postFour} setQues={setPostFour}/>
    case 24:
      return <PreCondition nextPage={nextPage} Questions={generalend} setQues={setgeneralend}/>
    case 25:
      return <PostStudy nextpage={nextPage} general={general} pre_one={preOne} post_one={postOne} pre_two={preTwo} post_two={postTwo} pre_three={preThree} post_three={postThree} pre_four={preFour} post_four={postFour} generalEnd={generalend} condition={condition} final={setfinal} settrigger={setTriggerApiRequestfinal} time={times}/>
    case 26:
      return <Matrikel nextpage={nextPage} set={setmatrk} trigger={setTriggerApi}/>
    case 27:
      return <End/>
  }
}

export default App;
