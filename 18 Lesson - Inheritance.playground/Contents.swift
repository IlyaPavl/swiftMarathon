print("18 Lesson - Inheritance")

/*
 1. Создайте базовый класс артист с "именем", "фамилией" и методом "выступление".
 У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки).
 Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.

 */

print("\n#1\n")

class Artist {
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func kindOfArtist() -> String {
        return firstName + " " + lastName
    }
}

class Actor : Artist {
    override func kindOfArtist() -> String {
        return super.kindOfArtist() + " is an artist and plays different roles"
    }
}

class Clown : Artist {
    override func kindOfArtist() -> String {
        return super.kindOfArtist() + " is a clown and makes people laugh"
    }
}

class Painter : Artist {
    override var firstName: String {
        get {
            let name = super.firstName
            return String(name.reversed())
        }
        set {
            super.firstName = newValue
        }
    }
    
    override func kindOfArtist() -> String {
        return super.kindOfArtist() + " is a painter and draws everything you ask"
    }
}

let actor = Actor(firstName: "Pavel", lastName: "Pavlov")
let clown = Clown(firstName: "Petr", lastName: "Petrov")
let painter = Painter(firstName: "Alexey", lastName: "Alexeev")

actor.kindOfArtist()
clown.kindOfArtist()
painter.kindOfArtist()

let profArray = [actor, clown, painter]

for value in profArray {
    print(value.kindOfArtist())
}

/*
2. Базовый класс - "транспортное средство": свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В.
 
 При перевозке 100 и 1000 человек ответить на следующие вопросы:
- Как быстро мы сможем это сделать и каким транспортом?
- Стоимость всех перевозок и количество?
- Какой транспорт быстрее справится и какой более выгодный?
 */

print("\n#2\n")

class Transport {
    
    var name : String {
        return "Вид транспорта:"
    }
    var speed : Double {
        return 0
    }
    
    var capacity : Int {
        return 0
    }
    
    var price : Double {
        return 0
    }
    
    func calculateTimeAndPrice(distance: Double, passengers: Int) -> (amountOfTransport: Int, time: Double, cost: Double) {
        let amountOfTransport = (passengers % capacity) == 0 ? passengers / capacity : passengers / capacity + 1
        let timeForTrip = distance / speed
        let costForTrip = Double(passengers) * price
        return (amountOfTransport, timeForTrip, costForTrip)
    }
}

class Plane : Transport {
    override var name: String {
        return super.name + " plane"
    }
    override var speed: Double {
        return 926
    }
    
    override var capacity: Int {
        return 180
    }
    
    override var price: Double {
        return 4830
    }
}

class Ship : Transport {
    override var name: String {
        return super.name + " ship"
    }
    override var speed: Double {
        return 75
    }
    
    override var capacity: Int {
        return 948
    }
    
    override var price: Double {
        return 8359
    }
}

class Train : Transport {
    override var name: String {
        return super.name + " train"
    }
    override var speed: Double {
        return 150
    }
    
    override var capacity: Int {
        return 486
    }
    
    override var price: Double {
        return 5531
    }
}

class Car : Transport {
    override var name: String {
        return super.name + " car"
    }
    override var speed: Double {
        return 100
    }
    
    override var capacity: Int {
        return 5
    }
    
    override var price: Double {
        return 3846
    }
}

let plane = Plane()
let ship = Ship()
let train = Train()
let car = Car()

var arrayOfTransport = [train, ship, plane, car]

/*
 При перевозке 100 и 1000 человек ответить на следующие вопросы:
+ Как быстро мы сможем это сделать и каким транспортом?
- Стоимость всех перевозок и количество транспорта?
+ Какой транспорт быстрее справится и какой более выгодный?
 */

//func analyzeTransport(transport: [Transport], distance: Double, passengers: Int) {
//    print("Here are the best way to transport \(passengers) people at \(distance) km")
//
//    for value in transport {
//        print("")
//        print(value.name)
//        let (amount, time, cost) = value.calculateTimeAndPrice(distance: distance, passengers: passengers)
//        print("It will take \(amount) item to transfer \(passengers) passengers")
//        print("To transfer \(passengers) passengers it will take: \(time) hours")
//        print("It will cost \(cost) rubles to transfer \(passengers) passengers")
//    }
//}

func analyzeTransport(transport: [Transport], distance: Double, passengers: Int) {
    print("Here are the best way to transfer \(passengers) people at \(distance) km")
    
    var speedest = Double()
    var nameForSpeed = String()
    var nameForPrice = String()
    var nameForTime = String()
//    var nameForAmount = String()
    
    var cheepest = transport[0].calculateTimeAndPrice(distance: distance, passengers: passengers).cost
    var fastest = transport[0].calculateTimeAndPrice(distance: distance, passengers: passengers).time
//    var amount = transport[0].calculateTimeAndPrice(distance: distance, passengers: passengers).amountOfTransport
    
    for value in transport {
        if value.speed > speedest {
            speedest = value.speed
            nameForSpeed = value.name
        }
        if value.calculateTimeAndPrice(distance: distance, passengers: passengers).cost < cheepest {
            cheepest = value.calculateTimeAndPrice(distance: distance, passengers: passengers).cost
            nameForPrice = value.name
        }
        if value.calculateTimeAndPrice(distance: distance, passengers: passengers).time < fastest {
            fastest = value.calculateTimeAndPrice(distance: distance, passengers: passengers).time
            nameForTime = value.name
        }
//        if value.calculateTimeAndPrice(distance: distance, passengers: passengers).amountOfTransport < amount {
//            if value.calculateTimeAndPrice(distance: distance, passengers: passengers).amountOfTransport == amount {
//                cheepest = value.calculateTimeAndPrice(distance: distance, passengers: passengers).cost
//                nameForAmount = value.name
//            }
//            amount = value.calculateTimeAndPrice(distance: distance, passengers: passengers).amountOfTransport
//            nameForAmount = value.name
//        }
    }
    print("")
    print("Question 1: The speedest way is to go by \(nameForSpeed.dropFirst(16)). Speed will be \(speedest) km/h")
    print("Question 2: The cheepest way is to go by \(nameForPrice.dropFirst(16)). Price will be \(cheepest) rubles")
    print("Question 3: The fastest way is to go by \(nameForTime.dropFirst(16)). Price will be \(fastest) hours")
//    print("Question 4: The least amount of transport is to go by \(nameForAmount.dropFirst(16)). It will take \(amount) \(nameForAmount.dropFirst(16)).")

}

analyzeTransport(transport: arrayOfTransport, distance: 740, passengers: 100)
print("\n#3\n")

/*
 3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
- Создайте по пару объектов каждого класса.
- Посчитайте пресмыкающихся (создайте масив, поместите туда пресмыкающихся и скажите сколько в нем объектов)
- Сколько четвероногих?
- Сколько здесь животных?
- Сколько живых существ?
 */

class Alive { }
class Animal : Alive { }
class Quadruped : Animal { }
class Reptiles : Animal { }

class ManTwo : Alive { }
class Crocodile : Reptiles { }
class Monkey : Animal { }
class Dog : Quadruped { }
class Giraffe : Quadruped { }

let man11 = ManTwo()
let man2 = ManTwo()
let croc1 = Crocodile()
let croc2 = Crocodile()
let monkey1 = Monkey()
let monkey2 = Monkey()
let dog1 = Dog()
let dog2 = Dog()
let giraffe1 = Giraffe()
let giraffe2 = Giraffe()

let arrOfAlives : [Alive] = [man11, man2, croc1, croc2, monkey1, monkey2, dog1, dog2, giraffe1, giraffe2]


//- Пресмыкающихся:
//- Четвероногих:
//- Животных:
//- Живых существ:
print("Пресмыкающихся: \(arrOfAlives.filter{ $0 is Reptiles}.count)")
print("Четвероногих: \(arrOfAlives.filter{ $0 is Quadruped || $0 is Crocodile || $0 is Monkey }.count)")
print("Животных: \(arrOfAlives.filter{ $0 is Animal }.count)")
print("Живых существ: \(arrOfAlives.count)")
