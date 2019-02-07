let match = "A string. \ With some \ backslashes."

//will not flag
let regex = /test\.file/;

// the replacement expression should be flagged
var matchA = new RegExp(match.replace(/\./g, "\\.")+"$", "i");

//correct solution: match.replace(/\./g, "\\.").replace(/\\/g, "\\\\")
var matchB = new RegExp(match.replace(/\\/g, "\\\\".replace(/\./g, "\\."))+"$", "i");