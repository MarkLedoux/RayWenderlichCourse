//: [⇐ Previous: 03 - Functions and Return](@previous)
//: ## Episode 04: Challenge - Functions

/*:
## Challenge 1
 1. Write a function named `printFullName` that takes two strings called `firstName` and `lastName`.  The function should print out the full name defined as `firstName` + " " + `lastName`. Use it to print out your own full name.
 2. Change the declaration of `printFullName` to have no argument label for either parameter.
*/
func printFullName(_ firstName: String, _ lastName: String) {
    print(firstName + " " + lastName)
}

printFullName("Mark", "LEDOUX")
/*:
## Challenge 2
 Write a function named `calculateFullName` that returns the full name as a string. Use it to store your own full name in a constant.
*/
func calculatedFullName(_ firstName: String, _ lastName: String) -> String {
    return firstName + " " + lastName
 }
let fullName = calculatedFullName("Mark", "LEDOUX")


//: [⇒ Next: 05 - Operating on Arrays](@next)
