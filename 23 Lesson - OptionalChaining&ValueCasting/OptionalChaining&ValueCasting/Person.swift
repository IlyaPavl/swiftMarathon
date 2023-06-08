//
//  Person.swift
//  OptionalChaining&ValueCasting
//
//  Created by Ilya Pavlov on 18.04.2023.
//
/*
Сегодня будем строить свою небольшую социальную сеть.
1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
Обязательно используем в заданиях Optional chaining и Type casting
*/
import Foundation

class Person {
    static var countPersons = 0
    var name : String
    var father : Person?
    var mother : Person?
    var sisters : [Person]?
    var brothers : [Person]?
    var pets : [Pet]?
    
    init(name: String) {
        self.name = name
        Person.countPersons += 1
    }
    
    func countAuntUncle() -> (Int, Int) {
        var (countAunt, countUncle) = (0, 0)
        
        if let motherSister = mother?.sisters?.count {
            countAunt += motherSister
        }
        if let fatherSister = father?.sisters?.count {
            countAunt += fatherSister
        }
        if let motherBrother = mother?.brothers?.count {
            countUncle += motherBrother
        }
        if let fatherBrother = father?.brothers?.count {
            countUncle += fatherBrother
        }
        return (countAunt, countUncle)
    }
    
//    func countCousine() -> (Int, Int) {
//        var (countManCousine, countWomanCousine) = (0, 0)
//        if let manCousine = father
//
//    }
    
    deinit {
        Person.countPersons -= 1
        print("\(name) deinit, \(Person.countPersons) persons left")
    }
}

class Man : Person {
    func moveSofa() { print("\(name) moves the sofa") }
}
class Woman : Person {
    func tellMoveSofa() { print("\(name) told to move sofa") }
}
