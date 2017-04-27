const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  reader.question('Would you like some tea?', (firstResp) => {
    console.log(`You replied ${firstResp}.`);
    reader.question('Would you like some biscuits?', (secondResp) => {
      console.log(`You replied ${secondResp}.`);
      first = firstResp;
      second = secondResp;
      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });

}


teaAndBiscuits();
