// Import necessary modules
const express = require('express');
const app = express();
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser'); 
const dotenv = require('dotenv');
const envPath = path.join(__dirname,'/api/process.env');
dotenv.config({ path: envPath });
const generateUniqueID = require('./api/generateId.js')
const { Pool } = require('pg');

// Configure environment variables
const pool = new Pool({
  connectionString: process.env.POSTGRES_URL + "?sslmode=require",
})

pool.connect((error)=>{
  if (error) throw error
  console.log("Connect to PostgresSQL succesfully")
})

app.use(express.json());
app.use(cors());
app.use(bodyParser.json());

// Define level and topic objects for categorization purposes
const level = {
  "1":["englisch_leicht","deutsch_leicht","englisch_schwer","deutsch_schwer"],
  "2":["deutsch_leicht","englisch_schwer","deutsch_schwer","englisch_leicht"],
  "3":["englisch_schwer","deutsch_schwer","englisch_leicht","deutsch_leicht"],
  "4":["deutsch_schwer","englisch_leicht","deutsch_leicht","englisch_schwer"]
}

const topic = {
  "1":["A","B","C","D"],
  "2":["B","C","D","A"],
  "3":["C","D","A","B"],
  "4":["D","A","B","C"]
}

// Utility function to find a key in an object based on the values in an array
function findKeyByArray(object, arrayToFind) {
  for (const key of Object.keys(object)) {
    let a = object[key]
    let num = true
    for (let i = 0; i < object[key].length; i++){
      if (a[i] != arrayToFind[i]){
        num = false
      }
    }
    if(num){
      return parseInt(key)
    }
  }
  return null; 
}


app.get("/available", function(req, res){
  data = {'success':true}
  res.json(data)
})

// Provide API information on the root path
app.get("/", function(req, res)
{
    data = {
      "available":"/available  | API availability",
      "getID":"/getID   | returns JSON",
      "finish":"/finish   | completes JSON",
      "condition":"/condition  | returns a condition",
    }
    res.json(data);
  });

// Generate and return a unique ID
app.get("/getID", function(req, res) {
  generateUniqueID()
      .then(uniqueID => {
          res.send(uniqueID);
      })
      .catch(error => {
          console.error(`Mistake by creating error: ${error}`);
          res.status(500).send('Mistake by creating error:');
      });
});

// Insert university details into the database
app.post("/uniDetail", async function(req, res){
  try{
    const data = req.body;
    const insertQueryMRTK = `
            INSERT INTO hours (id, forename, surename)
            VALUES ($1, $2, $3);
          `;
    const valuesMRTK = [data.Matrikelnummer, data.Forename, data.Surename]
    try {
      await pool.query(insertQueryMRTK, valuesMRTK);
    } catch (err) {
      await pool.query('ROLLBACK');
      throw err;
    }
    res.status(200).send('Success');
  }
  catch(error){
    console.error(error)
  }
})

// Process the completion of an action and insert into the database
app.post("/finish", async function(req, res) {
  try {
    const data = req.body;
    const raw_condition = data.condition;
    const condition = raw_condition.condition;
    const topic_value = raw_condition.topic;
    const topic_key = findKeyByArray(topic, topic_value);
    const condition_key = findKeyByArray(level, condition);
    console.log(condition_key+topic_key)
    const query = `
      INSERT INTO outcome(id, age, gender, levelOfEducation, occupation, pre_one, pre_two, pre_three, pre_four, post_one, post_two, post_three, post_four, condition, topicNumber, conditionNumber, time_stamp, general, general_end)
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19)
    `;
    const values = [
      data.id, data.age, data.gender, data.levelOfEducation, data.occupation, data.pre_one, data.pre_two, data.pre_three, data.pre_four,
      data.post_one, data.post_two, data.post_three, data.post_four, data.condition, topic_key, condition_key, data.time, data.general, data.generalEnd
    ];
    try {
      await pool.query(query, values);
    } catch (err) {
      await pool.query('ROLLBACK'); 
      throw err; 
    }
    res.status(200).send('Success');
  } catch (error) {
    console.error('Error', error);
    res.status(500).send('Internal Error');
  }
});

// Determine the condition and topic based on database entries and send to client
app.get("/condition", async function(req, res){
  try {
    const outcome = await pool.query('SELECT id, topicNumber, conditionNumber FROM outcome;');
    const current = await pool.query(
        `SELECT id, topicNumber, conditionNumber
        FROM current
        WHERE zeit > CURRENT_TIMESTAMP - INTERVAL '0.5 hour';`);

    const currentIds = new Set(current.rows.map(row => row.id));
    const uniqueOutcome = outcome.rows.filter(row => !currentIds.has(row.id));
    const combinedList = [...uniqueOutcome, ...current.rows].map(row => `${row.topicnumber}-${row.conditionnumber}`);

    const frequencyMap = new Map();
    list.forEach(item => frequencyMap.set(item, 0)); // Initialisiere alle mit 0
    combinedList.forEach(item => frequencyMap.set(item, (frequencyMap.get(item) || 0) + 1));

    const minFrequency = Math.min(...Array.from(frequencyMap.values()));
    let missingList = [];

    if (minFrequency < 10) { 
      missingList = Array.from(frequencyMap).filter(([key, value]) => value === minFrequency).map(([key, value]) => key);
    }

    let randomElement; 
    if (missingList.length > 1){
      randomElement = missingList[Math.floor(Math.random() * missingList.length)];
    }
    else if (missingList.length === 1){
      randomElement = missingList[0];
    }

    if (randomElement) {
      let parts = randomElement.split('-'); 
      let topic_id = parts[0];
      let condition_id = parts[1];

      const insertQuery = `
            INSERT INTO current (id, topicNumber, conditionNumber)
            VALUES ($1, $2, $3);
          `;

      generateUniqueID()
      .then(uniqueID => {
        pool.query(insertQuery, [uniqueID, topic_id, condition_id])
          res.json({
            topic: topic[topic_id],
            condition: level[condition_id],
            id: uniqueID
          });
        })
      .catch(error => {
          console.error(`Mistake : ${error}`);
          res.status(500).send('Mistake no unique id');
      });
    } else {
      res.status(404).send("Error no condition");
    }
  } catch (err) {
    console.error('No data', err);
    res.status(500).send('Server Error');
  }
});
// Get the number of entries in the outcome table and send it as JSON
app.get('/numbers', async function(req, res) {
  const query = await pool.query('SELECT COUNT(*) FROM outcome;');
  res.send(JSON.stringify({"Informationsverhalten verstehen":parseInt(query.rows[0].count)}))
});
// Start the server on a specified port or default to 8080
const port = process.env.PORT || 8080;
const server = app.listen(port, ()=>console.log("Up and running *4000"));

module.exports = app;

