//: [⇐ Previous: 02 - Functions](@previous)
//: ## Episode 03: Challenge - Functions

/*:
 ## Challenge 1
 - Create a closure version of the function below.
 - Try out the function & closure!
*/

// --------------------------------------
func calculateFullName(firstName: String, lastName: String?) -> String {
  firstName + " " + (lastName ?? "")
}
// --------------------------------------

// TODO: Write solution here

var calculateFullName = { (firstN: String, lastN: String?) -> String in
    firstN + " " + (lastN ?? "")
}

let ozmaName = calculateFullName(firstName: "ozma", lastName: "catterwaul")
let princeName = calculateFullName("prince", nil)

/*:
 ## Challenge 2
 - Call the `printResult` function below
 - Use an inline closure as an argument
*/

// --------------------------------------
typealias Operate = (Double, Double) -> Double

func printResult(_ operate: Operate, _ a: Double, _ b: Double) {
  let result = operate(a, b)
  print(result)
}

let printResult = { ( _ operate: Operate, _ a: Double, _ b: Double ) in
    print(operate(a,b))
}

// --------------------------------------

// TODO: Write solution here
printResult({ (a, b) -> Double in
    ((a * a) + (b * b)).squareRoot()
},
 4, 2
)

//: [⇒ Next: 04 - Closure Syntax](@next)

let longClosure =  { (a: Double, b: Double) -> Double in
    a + b
}

let noParameterClosure: Operate =  { (a, b) -> Double in
    a + b
}

let noReturnTypeClosure: Operate =  { (a, b) in
    a + b
}

let shortClosure: Operate =  { $0 + $1 }

longClosure(4,2)
noParameterClosure(4,2)
noReturnTypeClosure(4,2)
shortClosure(4,2)


let voidClosure: () -> Void = {
    print("Yay, swift")
}

voidClosure()

//-------------------------------------------------------------
typealias Operate1 = (Int, Int) -> Int
func printResult(_ a1: Int, _ b1: Int, _ operate: Operate1) {
    print(operate(a1, b1))
}
//-------------------------------------------------------------

printResult(2, 3, { $0 + $1 }) //inline closure
printResult(2, 3) { $0 + $1 } //trailing closure

