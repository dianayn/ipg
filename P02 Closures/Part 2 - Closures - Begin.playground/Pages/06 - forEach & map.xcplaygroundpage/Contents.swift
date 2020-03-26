//: [⇐ Previous: 05 - Challenge - Closure Syntax](@previous)
//: ## Episode 06: forEach & map
import Foundation

// --------------------------------------
var prices = [1.50, 10.00, 4.99, 2.30, 8.19]
// --------------------------------------

//: `forEach` - Loops over a collection and performs an operation

for price in prices {
    print(price)
}

prices.forEach {
    print($0)
}

//: `map` - Loops over an array, executes closure code, returns a new array

var arrayForSalePrice: [Double] = []
for price in prices {
    arrayForSalePrice.append(price * 0.9)
}
arrayForSalePrice

//let salePrice_1 = prices.map { (price) -> Doulb in
//    price * 0.9
//}
let salePrice = prices.map { $0  * 0.9 }

let priceLabels = prices.map { (price) -> String in
    String(format: "%0.2f", price)
}



//: [⇒ Next: 07 - compactMap & flatMap](@next)
