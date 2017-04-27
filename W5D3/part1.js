function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase}`);
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(arr) {
  let res_arr = [];
  for (var i = 0; i < arr.length; i++) {
    if (i%3 === 0 || i%5 === 0 && i%15 !== 0) {
      res_arr.push(i);
    }
  }
  return res_arr;
}

function isPrime(number) {
  let prime_arr = [];
  for (let i = 2; i < number; i++){
    if ( number%i === 0 ){
      return false;
    }
  }
}

function sumOfNPrimes (n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
}
