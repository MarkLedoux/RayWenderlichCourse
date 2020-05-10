//: [⇐ Previous: 09 - filter, reduce, and sort](@previous)
//: ## Episode 10: Challenge - filter, reduce, and sort

/*:
 ## Challenge Time 😎
 
 Create a constant array called `names` which contains some names as strings (any names will do — make sure there’s more than three though!). Now use `reduce` to create a string which is the concatenation of each name in the array.
*/
let names = ["mark", "josh", "prudence", "luka", "ozma"]
let allNames = names.reduce("") { (result, name) in
    result + " " + name
}
allNames

/*:
 Using the same `names` array, first filter the array to contain only names which have more than four characters in them, and then create the same concatenation of names as in the above exercise. (Hint: you can chain these operations together.)
*/

let nameWithLessThanFourLetters = names.filter {
    $0.count > 4
}.reduce("") { (result, name) in
    result + " " + name
}

/*:
 Create a constant dictionary called `namesAndAges` which contains some names as strings mapped to ages as integers. Now use `filter` to create a dictionary containing only people under the age of 18.
*/

let namesAndAges = ["Mark": 29, "josh": 25, "Prudence": 25, "Luka": 23, "Kevin": 17]
let lessThanEighteen = namesAndAges.filter {
    $0.value < 18
}
lessThanEighteen

/*:
 Using the same `namesAndAges` dictionary, filter out the adults (those 18 or older) and then use `map` to convert to an array containing just the names (i.e. drop the ages).
*/

let moreThanEighteen = namesAndAges.filter {
    $0.value >= 18
}.map { nameAndAge in
    nameAndAge.key
}

//: [⇒ Next: 11 - Conclusion](@next)
