print("27 Lesson - Protocols")

import Foundation

// MARK: - Скутаренко Часть 1

protocol Priority {
    var order: Int { get }
}

// протоколы могут наследоваться от других протоколов
protocol ShowName : Priority {
    var name : String { get } // требование протокола - реализовать геттер для свойства name
}

class Student : ShowName {
    var firstName : String
    var lastName : String
    var fullName : String {
        return firstName + " " + lastName
    }
    init(firstName: String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    // исполненеие требования протокола
    var name: String {
        return fullName
    }
    let order: Int = 1
}

class Animal {
    
}

// если класс наследуется и подписывается под протоколы, то сначала пишется суперкласс
class Cow : Animal, ShowName {
    var nickname: String?
    var name: String {
        return nickname ?? "a cow"
    }
    let order: Int = 2
}

struct Grass : ShowName {
    var type: String
    var name: String {
        return type
    }
    let order: Int = 3
}

let student1 = Student(firstName: "Alex", lastName: "Topskiy")
let student2 = Student(firstName: "Tolya", lastName: "Medvedev")
let student3 = Student(firstName: "Anton", lastName: "Kozmod")

let cow1 = Cow()
cow1.nickname = "Mumu"
let cow2 = Cow()

let grass1 = Grass(type: "Type1")
let grass2 = Grass(type: "Type2")

var array : [Any] = [student1, student2, student3, cow1, cow2, grass1, grass2]

for item in array {
    switch item {
    case let grass as Grass: print(grass.type)
    case let student as Student: print(student.fullName)
    case let cow as Cow: print(cow.nickname ?? "a cow")
    default: break
    }
}

// теперь можно объеденить элеметны массива по признаку принадлежности к протоколу

print("\n")

var array2 : [ShowName] = [student2, grass1, cow1, student3, cow2, student1, grass2]

func printFarm(array: inout [ShowName]) {
    array.sort { a, b in
        if (a.order == b.order) {
            return a.name.lowercased() < b.name.lowercased()
        } else {
            return a.order < b.order
        }
    }
    
    for item in array {
        print(item.name)
    }
}

printFarm(array: &array2)

// MARK: - Домашка
/*
 + 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями
 
 + 2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food.
 + 2.1 Вам нужно пройтись по сумке, назвать предмет и откусить кусочек.
 + 2.2 Можете отсортировать продукты по имени. Используйте для этого отдельную функцию, которая принимает массив продуктов
 
 3. Некоторые продукты могут испортиться, если их не положить в холодильник.
 + 3.1 Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired.
 + 3.2 У некоторых продуктов замените Food на Storable.
 + 3.3 Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него.
 + 3.4 Используйте функцию для вывода продуктов для вывода содержимого холодильника
 
 + 4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
 
 + 5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.
 
 */


print("\n#1")

protocol Food {
    var name : String {get}
    
    func taste() -> String
}

protocol Storable {
    var expired : Bool {get}
    var daysToExpire : Int {get}
}

print("\n#2")

class Orange : Food, Storable {
    var daysToExpire: Int = 14
    
    var expired: Bool
    
    var name: String
    
    func taste() -> String {
        return "\(name) tastes like sweet lemon"
    }
    
    init(name: String, expired: Bool) {
        self.name = name
        self.expired = expired
    }
}

class Milk : Food, Storable {
    var daysToExpire: Int = 3
    
    var expired: Bool
    
    var name: String
    
    func taste() -> String {
        return "\(name) tastes like something from the cow"
    }
    
    init(name: String, expired: Bool) {
        self.name = name
        self.expired = expired
    }
}

class Nuts : Food {
    var name: String
    
    func taste() -> String {
        return "\(name) tastes like something from the forest"
    }
    
    init(name: String) {
        self.name = name
    }
}

class Tomatoes : Food, Storable {
    var daysToExpire: Int = 5
    
    var expired: Bool
    
    var name: String
    
    func taste() -> String {
        return "\(name) is very tasty. I Like it"
    }
    
    init(name: String, expired: Bool) {
        self.name = name
        self.expired = expired
    }
}

class Chocolate : Food {
    var name: String
    
    func taste() -> String {
        return "\(name) tastes like something to eat with tea"
    }
    
    init(name: String) {
        self.name = name
    }
}

let orange = Orange(name: "Orange", expired: true)
let milk = Milk(name: "Prostokvashino", expired: false)
let nut = Nuts(name: "Forest nut")
let tomatoe = Tomatoes(name: "Cherry", expired: false)
let chocolate = Chocolate(name: "Milka")


var productArray : [Food] = [orange, chocolate, tomatoe, milk, nut]

print("\n#2.1")
func bag(array: inout [Food]) {
    for food in array {
        print("I bite \(food.name) and ")
    }
}
bag(array: &productArray)

print("\n#2.2")
func sortBag(array: inout [Food]) {
    array.sort { a, b in
        return a.name.lowercased() < b.name.lowercased()
    }
    
    for food in array {
        print(food.name)
    }
}

sortBag(array: &productArray)

print("\n#3.3 - 3.4")

func refProducts(array: [Food]) -> [Food & Storable] {
    var newArray = [Food & Storable]()
    for value in array {
        switch value {
        case let product as Food & Storable where product.expired:
            print("\(value.name) is expired. Throw it away")
        case let product as Food & Storable where !product.expired:
            newArray.append(product)
        default:
            print("\(value.name) is not storable. It's not necessary to put it in the fridge")
        }
    }
    return newArray
}

var fridge = refProducts(array: productArray)
print("\nItems in the fridge:")

for item in fridge {
    print(item.name)
}

print("\n#4")

func sortFridge(array: inout [Food & Storable]) {
    array.sort { a, b in
        if a.daysToExpire == b.daysToExpire {
            return a.name < b.name
        } else {
            return a.daysToExpire < b.daysToExpire
        }
    }
    for value in array{
        print("Item: \(value.name), days to expire: \(value.daysToExpire)")
    }
}

sortFridge(array: &fridge)
