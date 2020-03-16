import UIKit

typealias Inches = Int
struct Pizza {
    enum Topping {
        case cheese
        case mushrooms
        case peppers
    }

    enum Crust {
        case think
        case thin
    }

    let toppings: [Topping]
    let size: Inches
    let crust: Crust
}

let pizzaTopping: Pizza.Topping = .mushrooms
let pizza = Pizza(toppings: [.cheese,.mushrooms], size: 9, crust: .thin)
