

const factorial = number => {
  return number < 2 ? 1 : number * factorial(number - 1);
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
