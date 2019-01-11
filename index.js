const factorialize = number => {
  let product = 1;
  for (let i = 2; i <= number; i = i + 1) {
    product *= i;
  }
  return product;
};

const factorial = number => {
  return number < 2 ? 1 : number * factorial(number - 1);
};

stateModifier = function(state) {
  state = state + 'Text'
  return state
}

const reverse = string => {
    let result = "";
    for (let character of string) result = result + character;
    return result;
};

const _reverse = string =>
    string.split("").reduce((result, character) => result + character);

    const isPalindrome = string => {
    const validCharacters = "abcdefghijklmnopqrstuvwxyz".split("");
    const stringCharacters = string
        .toLowerCase()
        .split("")
        .reduce(
            (characters, character) =>
                validCharacters.indexOf(character) > -1
                    ? characters.concat(character)
                    : characters,
            []
        );
    return stringCharacters.join("") === stringCharacters.reverse().join("");
};

const fizzBuzz = number => {
    let output = [];
    for (let i = 1; i <= number; i++) {
        if (i % 6 === 0) output.push("Fizz Buzz");
        else if (i % 2 === 0) output.push("Fizz");
        else if (i % 3 === 0) output.push("Buzz");
        else output.push(i);
    }
    return output;
};

const max = string => {
    const characters = {};

    for (let character of string)
        characters[character] = characters[character] + 1 || 1;

    let maxCount = 0;
    let maxCharacter = null;

    for (let character in characters) {
        if (characters[character] > maxCount) {
            maxCount = characters[character];
            maxCharacter = character;
        }
    }

    return maxCharacter;
};
