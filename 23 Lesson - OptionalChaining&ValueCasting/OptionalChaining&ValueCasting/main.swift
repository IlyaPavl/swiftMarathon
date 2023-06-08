//
//  main.swift
//  OptionalChaining&ValueCasting
//
//  Created by Ilya Pavlov on 18.04.2023.
//

/*
Сегодня будем строить свою небольшую социальную сеть.
+ 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд

+ 2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.

+ 3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
Раздать некоторым людям домашних животных.
 Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных.
 Посчитать сколько каких животных в этом массиве.
Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
Обязательно используем в заданиях Optional chaining и Type casting
*/

import Foundation

var playground = true

if playground {
    let tanya = Woman(name: "Tanya")
    let larisa = Woman(name: "Larisa")
    let sergey = Man(name: "Sergey")
    let svetlana = Woman(name: "Svetlana")
    let svetlana2 = Woman(name: "Svetlana2")
    let svetlana3 = Woman(name: "Svetlana3")
    let alexander = Man(name: "Alexander")
    let kate = Woman(name: "Kate")
    let olga = Woman(name: "Olga")
    let nadya = Woman(name: "Nadya")
    let motherPasha = Man(name: "Pasha")
    let grandKate = Woman(name: "Ekaterina")
    let fatherPasha = Man(name: "Pavel")
    let valentina = Woman(name: "Valentina")
    let irina = Woman(name: "Irina")
    let natalya = Woman(name: "Natalya")
    
    let leya = Dog(name: "Leya")
    let dan = Dog(name: "Dan")
    let murka = Cat(name: "Murka")
    let risya = Cat(name: "Risya")
    let jack = Sparrow(name: "Jack")
    let ilya = Dog(name: "Ilya")
    let guppi = Fish(name: "Guppi")
    
    tanya.mother = larisa
    tanya.father = sergey
    
    larisa.mother = nadya
    larisa.father = motherPasha
    larisa.sisters = [svetlana, svetlana2]
    
    sergey.mother = grandKate
    sergey.father = fatherPasha
    sergey.brothers = [alexander]
    sergey.sisters = [svetlana3]
    
    kate.mother = svetlana
    olga.father = alexander
    
    grandKate.sisters = [valentina]
    irina.mother = valentina
    natalya.mother = irina
    
    natalya.pets = [leya]
    nadya.pets = [dan, murka]
    kate.pets = [risya]
    tanya.pets = [jack, ilya, guppi]
    
    
    print(tanya.countAuntUncle().0)
    print(sergey.countAuntUncle())
    print(larisa.countAuntUncle())
    
    let family = [tanya, larisa, sergey, svetlana, svetlana2, svetlana3, alexander, kate, olga, nadya, motherPasha, grandKate, fatherPasha, valentina, irina, natalya]
    
    var countMan = 0
    var countWoman = 0
    
    for value in family {
        if let woman = value as? Woman {
            countWoman += 1
            woman.tellMoveSofa()
        } else if let man = value as? Man {
            countMan += 1
            man.moveSofa()
            
        }
    }
    print("There are \(countMan) men and \(countWoman) women in the family\n")
    
    var animalArray = [Pet]()
    for person in family {
        if person.pets != nil {
            for pet in person.pets! {
                animalArray.append(pet)
            }
        }
    }
    
    var countCat = 0
    var countDog = 0
    var countSparrow = 0
    var countFish = 0
    
    for animal in animalArray {
        if let cat = animal as? Cat {
           countCat += 1
            cat.makeSound()
        }
        
        if let dog = animal as? Dog {
           countDog += 1
            dog.makeSound()
        }
        
        if let sparrow = animal as? Sparrow {
           countSparrow += 1
            sparrow.makeSound()
        }
        
        if let fish = animal as? Fish {
           countFish += 1
            fish.makeSound()
        }
    }
    print("")

    print("Cats = \(countCat); Dogs = \(countDog); Sparrows = \(countSparrow); Fish = \(countFish). total number of animals = \(animalArray.count)")
    
    print("")
}
