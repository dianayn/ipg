import UIKit

func syncA() -> String {

    return "hello world"
}
//print("start")
//let b = syncA()
//print(b)
//print("end")


func asyncA(completion: @escaping (String) -> Void) -> String {
    completion("hello world") // 8
//    let v: Void = DispatchQueue.main.async { // 4
//        completion("hello world") // 8
//    }
    return "Foobar" // 5
}

print("start") // 1
var b: String? // 2
let d = asyncA { (c) in // 3
    b = c // 6
    print(b) // 7
}
print(d) // 4
print("end") // 5
