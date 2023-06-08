//
//  Pets.swift
//  OptionalChaining&ValueCasting
//
//  Created by Ilya Pavlov on 18.04.2023.
//

import Foundation

class Pet {
    static var countPets = 0
    var name : String
    
    init(name: String) {
        self.name = name
        Pet.countPets += 1
    }
    
    func makeSound() {}
    
    deinit {
        Pet.countPets -= 1
        print("\(name) deinit, \(Pet.countPets) pets left")
    }
}

class Sparrow: Pet {
    override func makeSound() { print("\(name) says: Chirik-Chirik") }
}
class Cat: Pet {
    override func makeSound() { print("\(name) says: Meow") }
}
class Dog: Pet {
    override func makeSound() { print("\(name) says: Wow") }
}
class Fish: Pet {
    override func makeSound() { print("\(name) says nothing") }
}
