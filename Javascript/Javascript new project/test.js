// Single - line comment
// Notes from 11/04/23 Lecture one on Javascript
/*
Multi-line comments
*/
// a variable is a container to hold the information in the memory
// in order to define variables we can use three keywords- var let const
// Homework for 11/04/23 -JS interpretor ==> compiler vs interpretor, and , var vs let.
// create a variable called first name that holds a value of Narayan
var firstName = "Max";
let FirstName = "George"
var lastName = "Arthur"
// Syntax is  var identifier = (assignment operator) = Narayan (value)
console.log(firstName)
console.log(FirstName)

// Rules for creating JS variables
// 1. cannot start with numbers
// 2. can start with a character, underscore or $ 
// 3. variable names are case-sensitive

var car ="Honda"; // declaration and assignment in the same line
// declaration and assignment can be done seperately
var Car;
var Car ="BMW";
var MyCar;
var my_car = "Ferrari"
var my_car = "Skoda"  // This is just a re-assignment of the value. The value of ferrarri is overwritten by skoda as it comes next in the code.
console.log(car);
console.log(Car);
console.log(MyCar); // This will show as 'undefined' since the MyCar variable has no value set.
console.log(my_car);
//1. var can be updated and redeclared.
// 2. let can be updated but not redeclared
// 3. const = constant =  values will not change. can neither be updated nor re-declared. must be initialised during the declaration unlike let

const rateOfInterest = 10; // declared and assigned a value
// rateOfInterest = 8; re-assigning a value - ERROR = assignment to constant variable is not allowed
console.log(rateOfInterest);

const age = 90; // declaration and assignment at the same line, no option of writing them seperately ( like let or var)



// Data Types
// the type of data that we are going to be storing in the variable can be split into two categories
// Primitive Types - string, numbers, boolean, undefined 
// Reference Types - arrays, object literals, functions, dates
// JS is a dynamically typed language

let myFirstName = 'Jeremy'; // a string is any sequence of characters. So in this case, the value is a string of characters Jeremy.
let myFirstName1 = 'Greg';
console.log(myFirstName)
console.log(myFirstName1)
let myMarks = 70008;
console.log(myMarks);

// Boolean values are true/false values, yes or no. 1 or 0.
let isDriver = false;
// typeof operator
console.log(typeof myFirstName1); //string
console.log(typeof myFirstName1); //string
console.log(typeof myMarks); //number
console.log(typeof isDriver) // boolean
//  if you want to store a number greater than what an int can handle/store use Bigint
let number = BigInt(8465152165418465168468);
let smallNumber = BigInt(123);
let anotherBigNumber = 12n;
console.log(smallNumber + anotherBigNumber); //123 + 12 = 135n
// when you add a bigint with an int - ERROR - cannot mix bigint and other types
console.log(smallNumber + anotherBigNumber); // 123 + 12 = 135n
 