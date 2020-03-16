import UIKit

// optional binding
let myFavoriteSong: String? = "November rain"  //nil

if let song = myFavoriteSong {
    print(song)
} else {
    print("I do not have favorite song")
}


func printNickName(_ nickName: String?) {
    guard let nickName = nickName else {
        print("no nickname")
        return
    }
    print("your nickname is :\(nickName)")
}

printNickName(nil)
