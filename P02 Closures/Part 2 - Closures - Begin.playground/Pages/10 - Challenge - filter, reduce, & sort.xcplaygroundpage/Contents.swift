//: [⇐ Previous: 09 - filter, reduce, and sort](@previous)
//: ## Episode 10: Challenge - filter, reduce, and sort

/*:
 ## Challenge Time 😎
 
 Create a constant array called `names` which contains some names as strings (any names will do — make sure there’s more than three though!). Now use `reduce` to create a string which is the concatenation of each name in the array.
*/

let names = ["Tom", "Jolia", "Karl", "Peter", "Diana"]
let nameArray = names.reduce(String()) { (result, name) in
    result + " " + name
}
print(nameArray)


/*:
 Using the same `names` array, first filter the array to contain only names which have more than four characters in them, and then create the same concatenation of names as in the above exercise. (Hint: you can chain these operations together.)
*/
let magic = names.filter { (name) -> Bool in
    name.count > 4
}.reduce("") { (result, name) in
    result + " " + name
}
print(magic)



/*:
 Create a constant dictionary called `namesAndAges` which contains some names as strings mapped to ages as integers. Now use `filter` to create a dictionary containing only people under the age of 18.
*/

let namesAndAges = ["Tom" : 10, "Jolia" : 15, "Karl" : 30, "Peter" : 40, "Diana" : 50]

let under18 = namesAndAges.filter { $0.value < 18 }
print(under18)


/*:
 Using the same `namesAndAges` dictionary, filter out the adults (those 18 or older) and then use `map` to convert to an array containing just the names (i.e. drop the ages).
*/

let agesArray = namesAndAges.filter {
    $0.value > 18
}
.map { namesAndAges in
    namesAndAges.key
}

print(agesArray)

//: [⇒ Next: 11 - Conclusion](@next)
