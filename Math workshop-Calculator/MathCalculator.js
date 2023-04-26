
// // Need to listen for all keypresses + determine type of key pressed

// const calculator = document.querySelector('.calculator');
// console.log(calculator)
// const keys = document.querySelector('.calculator_keys');
// console.log(keys)
// const display = document.querySelector('.calculator_display');

// keys.addEventListener('click', e => {
//     if (e.target.matches ('button')) {
//         const key = e.target;
//         const action = key.dataset.action;
//         const keyContent = key.textContent;
//         const displayedNum = display.textContent;
//         Array.from(key.parentNode.children)
//             .forEach(k => k.classList.remove('is-depressed'))
    
//     if (action === 'decimal') {
//         console.log ('decimal key!')
//         if(!displayedNum.includes('.')) {
//             display.textContent = displayedNum + '.'
//         } else if (previousKeyType === 'operator') {
//             display.textContent = '0.'
//         }
//         calculator.dataset.previousKey = 'decimal'
//     }

//     if (action === 'clear') {
//         console.log ('clear key!')
//         display.textContent = '0'
//         const firstValue = undefined
//         const operator = undefined
//         const secondValue = undefined
//         const calcValue = undefined
//         calculator.dataset.previousKeyType = 'clear'
//     }

//     const previousKeyType = calculator.dataset.previousKeyType
    
//     if (action === 'calculate') {
//         console.log('equal key!')
//         const firstValue = calculator.dataset.firstValue
//         const operator = calculator.dataset.operator
//         const secondValue = displayedNum
//         const calculate = (n1, operator, n2) => {
//             let result = ''
//             if (operator === 'add') {
//                 result = parseFloat(n1) + parseFloat(n2)
//             } else if ( operator === 'subtract') {
//                 result = parseFloat(n1) - parseFloat(n2)
//             } else if (operator === ' multiply') {
//                 result = parseFloat(n1) * parseFloat(n2) 
//             } else if ( operator === 'divide') {
//                 result = parseFloat(n1) / parseFloat(n2)
//             }
//             return result
//         }
//         display.textContent = calculate(firstValue, operator, secondValue)
//         calculator.dataset.previousKeyType = 'calculate'
//     }

//     if (!action) {
//         console.log('number key!')
//         if(displayedNum === '0' || previousKeyType === 'operator') {
//             display.textContent = keyContent
//             calculator.dataset.previousKey = 'number'
//         } else {
//             display.textContent = displayedNum + keyContent
//         }
//     }

//     if (action === 'add'||
//         action === 'subtract'||
//         action ==='multiply'||
//         action ==='divide'
//     ) {
//         console.log('operator key!')
//         const firstValue = calculator.dataset.firstValue
//         const operator = calculator.dataset.operator
//         const secondValue = displayedNum
//         const calculate = (n1, operator, n2) => {
//             let result = ''
//             if (operator === 'add') {
//                 result = parseFloat(n1) + parseFloat(n2)
//             } else if ( operator === 'subtract') {
//                 result = parseFloat(n1) - parseFloat(n2)
//             } else if (operator === ' multiply') {
//                 result = parseFloat(n1) * parseFloat(n2) 
//             } else if ( operator === 'divide') {
//                 result = parseFloat(n1) / parseFloat(n2)
//             }
//             return result
//         }

//         if (firstValue && operator && previousKeyType !== 'operator') {

//             display.textContent - calculate(firstValue, operator, secondValue)
//             const calcValue = calculate(firstValue, operator, secondValue)
//             display.textContent = calcValue
//             calculator.dataset.firstValue = calcValue
//             } else {
//                 calculator.dataset.firstValue = displayedNum
//             }
//             key.classList.add('is-depressed')
//             calculator.dataset.previousKeyType = 'operator'
//             calculator.dataset.operator = action
//         }


// }});
function handler(event) {
    const value = event.target.innerText;
    const display = document.getElementById("display2");
    const history = document.getElementById("history");
    // const history2 = document.getElementById("history2");

    switch(value) {
        case "AC":
            display.innerText = "";
            break;

        case "del":
            display.innerText = display.innerText.slice(0, -1);
            break;

        case "=": 
            history.innerText += display.innerText + " = " + (eval(display.innerText)) + "  .... ";
            display.innerText = eval(display.innerText) ;
            break;

        default:
            display.innerText += value;
    }
    
}

Array.from(document.getElementsByTagName("td")).forEach((td) => {
        td.addEventListener("click", handler);
    }
)

