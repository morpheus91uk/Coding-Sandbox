// main function for handling click events.
function handler(event) {
    // set variables to interact with the two display divs
    const value = event.target.innerText;
    const display = document.getElementById("display2");
    const history = document.getElementById("history");
    
// switch value to add functionality to the none operator keys
    switch(value) {
        // AC replaces any text in the display with an empty string
        case "AC":
            display.innerText = "";
            break;
        // del case removes the latest character entered, one at a time per click.
        case "del":
            display.innerText = display.innerText.slice(0, -1);
            break;
        // the equals case first takes the value from display, evaluates the value,
        // then adds both the initial calculation and the evaluation to the history div
        // Then it adds the evaluation of the calculation, to the display, allowing the user
        // to continue inputing commands, to work with the result. 
        // each time the case is activated, the history is updated with the newest calculation
        // each update to the history, is seperated by an elipsis to help seperate the updates.
        case "=": 
            history.innerText += display.innerText + " = " + (eval(display.innerText)) + "  .... ";
            display.innerText = eval(display.innerText) ;
            break;
        //default switch case
        default:
            display.innerText += value;
    }
    
}
// This code takes all elements by tag name td - all the buttons. 
// for each button, it adds an event listener so that when a user clicks a button
// the function handler (above) takes effect and the correct value is added to the display.
Array.from(document.getElementsByTagName("td")).forEach((td) => {
        td.addEventListener("click", handler);
    }
)

