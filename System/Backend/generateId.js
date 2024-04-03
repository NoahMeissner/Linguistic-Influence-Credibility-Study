// Defines an asynchronous function to generate a unique identifier.
async function generateUniqueID() {
    // Returns a new Promise object to handle asynchronous operations.
    return new Promise((resolve, reject) => {
        // Generate a random string as the unique identifier.
        let newID = Math.random().toString(36).substr(2, 20);
        resolve(createJSONFile(newID)); // Return the generated ID  
    });
}

  module.exports = generateUniqueID;
