stateModifier = function(state) {
  state = state + 'Text'
  return state
}

const plusMinusEqual = number => {
  number = number + 1
  number = number + 2
  number = number + 3
  number++
  number += 1
  number = number - 1
  number = number - 2
  number = number - 3
  number --
  number -= 1
  return number
}

const multiplyEqual = number => {
  number = number * 2
  number *= 2
  number = number * 1
  number *= 7
  return number
}

const divideEqual = number => {
  number = number / 2
  number /= 2
  number = number / 1
  number /= 7
  return number
}

const factorialize = number => {
  let product = 1;
  for (let i = 2; i <= number; i = i + 1) {
    product *= i;
  }
  return product;
};

const reverse = string => {
    let result = "";
    for (let character of string) result = result + character;
    return result;
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

const fizzBuzz = number => {
    let output = [];
    for (let i = 1; i <= number; i += 1) {
        if (i % 6 === 0) output.push("Fizz Buzz");
        else if (i % 2 === 0) output.push("Fizz");
        else if (i % 3 === 0) output.push("Buzz");
        else output.push(i);
    }
    return output;
};
