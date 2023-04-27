///////////////////////////////////////////////////////////////////
// This sets the date for a random date in the future. Actual
// date doesnt really matter, as it just a proof of concept for 
// the Lyre Festival site.
let countDownDate = new Date("Jan 7, 2025 12:00:00").getTime();

// This code updates the countdown timer, at set intervals. Currently
// set for seconds, making the countdown tick down every second.
let x = setInterval(function() {
    // This line fetches todays date and sets it in a variable
    let today = new Date().getTime();
    // This line sets a variable for distance, by taking the countDownDate
    //  (date of festival) and calculating the difference between the two dates
    let distance = countDownDate - today;
    //These next lines of code, calculate the days, hours, mins and seconds
    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((distance % ( 1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60)) / 1000);
    //This line outputs the result into the countdownTimer element.
    document.getElementById("countdownTimer").innerHTML = days + "D " + hours + "H " + minutes + "M " + seconds + "S ";
    //When the countdown hits zero. Distance between the two dates hits zero, which clears the 
    // countdownTimer and instead changes the text to read LIVE NOW
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("countdownTimer").innerHTML = "LIVE NOW";
    }
}, 1000);
///////////////////////////////////////////////////////////////////