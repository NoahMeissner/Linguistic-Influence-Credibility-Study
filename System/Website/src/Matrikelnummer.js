
function Matrikelnummer({nextpage, set, trigger})
{
    return(
        <>
            <p className="mb-3">If you need some VP Hours (only for students of the University of Regensburg), please give us your information.</p>

            <div className="mb-3">
                <p>For VP - Hours (University Regensburg)</p>
                <div>
                    <input id="Matrikelnummer" className="generall-input" type="text"
                           placeholder="e.g 12345667"></input>
                </div>
                <p></p>
                <div>
                    <input id="Forename" className="generall-input" type="text" placeholder="e.g Max"></input>
                </div>
                <p></p>
                <div>
                    <input id="Surename" className="generall-input" type="text"
                           placeholder="e.g Mustermann"></input>
                </div>
            </div>
            <button
                onClick={() => handleClick(nextpage, set, trigger)}>Submit
            </button>
        </>
    )

    function handleClick(nextpage, set, trigger)
    {
        let submitJson={
            'Matrikelnummer':document.getElementById('Matrikelnummer').value,
            'Forename':document.getElementById('Forename').value,
            'Surename':document.getElementById('Surename').value
        }
        set(submitJson)
        trigger(true)
        nextpage();
    }
}
export default Matrikelnummer