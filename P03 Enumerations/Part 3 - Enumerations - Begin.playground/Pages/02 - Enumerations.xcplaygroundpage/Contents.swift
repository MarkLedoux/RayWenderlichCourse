//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Enumerations

enum Month: Int {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

let month: Month = .october

func monthsUntilJingleBells(from month: Month) -> Int {
    Month.december.rawValue - month.rawValue
}

monthsUntilJingleBells(from: .march)


//: [⇒ Next: 03 - Challenge - Enumerations](@next)
