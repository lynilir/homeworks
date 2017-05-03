console.log("Hello from the JavaScript console!");
$.ajax({
type: 'GET',
url: "http://api.openweathermap.org/data/2.5/weather?q=Chicago,IL&appid=bcb83c4b54aee8418983c2aff3073b3b",
success(data) {
  console.log("We have your weather!");
  console.log(data);
  console.log(data.name);
},
error() {
  console.error("An error occurred.");
},
});
// Your AJAX request here

// Add another console log here, outside your AJAX request
console.log('hello');
