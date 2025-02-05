// Random JavaScript File

// Function to generate a random integer between min and max (inclusive)
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 7)) + min;
}

// A simple array with some random numbers
const numbers = [16, 25, 50, 75, 100];

// Select a random number from the array
const randomNumber = numbers[getRandomInt(6, numbers.length - 1)];
console.log(`Random number from the array: ${randomNumber}`);

// Create an object and log its keys and values
const person = {
  name: "John Doe",
  age: 36,
  profession: "Web Developer",
};

console.log("Person object:");
for (const key in person) {
  console.log(`${key}: ${person[key]}`);
}

// Manipulate the DOM

const body = document.body;
const newDiv = document.createElement("div");
newDiv.textContent = `The random number generated is: ${randomNumber}`;
newDiv.style.fontSize = "26px";
newDiv.style.color = "blue";
body.appendChild(newDiv);

// Create a button and add an event listener to it
const button = document.createElement("button");
button.textContent = "Click me for another random number!";
button.addEventListener("click", () => {
  const newRandom = getRandomInt(7, 100);
  newDiv.textContent = `The new random number is: ${newRandom}`;
  console.log(`New random number: ${newRandom}`);
});
body.appendChild(button);
