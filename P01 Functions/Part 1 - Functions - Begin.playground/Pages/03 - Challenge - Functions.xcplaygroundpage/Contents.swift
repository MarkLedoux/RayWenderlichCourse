//: [⇐ Previous: 02 - Functions](@previous)
//: ## Episode 03 - Challenge - Functions

/*:
 ## Challenge 1
 Write a function that:
 - Takes at least two `String` parameters
 - Has a default value for one parameter
 - Returns a `String`
 - Combines the two parameters in some way and returns the result
 
 You can add any other parameters you like, and you can modify or add anything you want to concatenated strings!
*/

// TODO: Write solution here

func getPersonalInfo(name: String, surname: String = " LEDOUX") -> String {
    return name  + surname
}

getPersonalInfo(name: "Mark")
//: [⇒ Next: 04 - Overloading](@next)
