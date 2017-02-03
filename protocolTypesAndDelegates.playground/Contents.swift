//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol FavoriteThings {
    var favColor: String { get }
    var favIceCream: String { get }
    var favSong: String { get }
}

struct Person: FavoriteThings {
    var favColor: String
    var favIceCream: String
    var favSong: String
}

// Example of a Person object following the protocol FavoriteThings
let jeff = Person(favColor: "Red", favIceCream: "Vanilla", favSong: "Foldgers In Your Cup")

//===========================================================================================

struct Cat: FavoriteThings {
    var favColor: String
    var favIceCream: String
    var favSong: String
}

// Example of a Cat object following the protocol FavoriteThings
let frisky = Cat(favColor: "Blue", favIceCream: "Chocolate", favSong: "Meow-Mix")

//==========================================================================================

func sayHelloTo(_ person: String) {
    print("Hello \(person)")
}
// function
sayHelloTo("George\n")

// protocol as a type
// The scope of this function allows only access to the properties and functions available to FavoriteThings
func printYourFavThings(_ entity: FavoriteThings) {
    print("My favorite color is \(entity.favColor)")
    print("Ice Cream is great! My favorite is \(entity.favIceCream)")
    print("My favorite song is \(entity.favSong)\n")
}
// calling on the function with frisky, the object following the protocol
printYourFavThings(frisky)

let favorites: [FavoriteThings] = [frisky, jeff]
print(favorites)
print("")

// this doesnt work, doesnt understand entity, it's element. The example made it confusing
for eachEntity in favorites {
    printYourFavThings(eachEntity)
}

//========================================================================================
//========================================================================================
// Delegation Delegation Delegation Delegation Delegation Delegation Delegation Delegation
//========================================================================================
//========================================================================================

protocol ParentDelegate {
    func feedBaby()
}


class Mom: ParentDelegate {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func feedBaby() {
        // feed baby
        print("Baby is now fed")
    }
}

class Baby {
    var name: String
    var delegate: ParentDelegate?
    
    init(name: String) {
        self.name = name
    }
    
    func wantsFood() {
        delegate?.feedBaby()
    }
}

let maryann = Mom(name: "Maryann")
let jim = Baby(name: "Jim")

// calling on the function to feed the baby, Jim
//jim.wantsFoodFrom(mom: maryann)

// Jim's delegate was nil, because it wasn't assigned, but because it's an optional, it's ok and initialized
// Maryann, because she follows protocol and has inherited/became the type, is able to be assigned to Jim's delegate
jim.delegate = maryann

// Jim can access due to protocol extension matching and the method being available from Maryann as she conforms to the protocol.
jim.wantsFood()


class Aunt: ParentDelegate {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func feedBaby() {
        print("They baby was fed, because I gave baby \(jim.name) Pizaaaaaaa~~~!!!!")
    }
}

let patty = Aunt(name: "Patty")

jim.delegate = patty
jim.wantsFood()




