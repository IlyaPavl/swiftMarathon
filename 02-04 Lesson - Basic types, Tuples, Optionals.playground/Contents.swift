//Homework for lessons 2-4.

print("SWIFT - 02. Работа с базовыми типами\n")
/*
 1. Выведите в консоль минимальные и максимальные значения базовых типов.
 2. Создайте 3 константы с типами Int, Float и Double. Создайте другие 3 константы, тех же типов: Int, Float и Double, при чем каждая из них это сумма первых трех, но со своим типом
 3. Сравните Int результат суммы с Double и выведите отчет в консоль
*/
print("#1\n")

print("\(Int8.min) \(Int8.max)")
print("\(UInt8.min) \(UInt8.max)")
print("\(Int16.min) \(Int16.max)")
print("\(UInt16.min) \(UInt16.max)")
print("\(Int32.min) \(Int32.max)")
print("\(UInt32.min) \(UInt32.max)")
print("\(Int64.min) \(Int64.max)")
print("\(UInt64.min) \(UInt64.max)")
print("\(Int.min) \(Int.max)")

print("\n#2\n")

let intConst = 50
let floatConst : Float = 45.89
let doubleConst = 33.21

print(Int(Double(intConst) + Double(floatConst) + doubleConst))
print(Float(Double(intConst) + Double(floatConst) + doubleConst))
print(Double(intConst) + Double(floatConst) + doubleConst)

print("\n#3\n")

if Double(intConst) == doubleConst {
    print("they are equal")
} else if Double(intConst) > doubleConst{
    print("Int is bigger than Double")
} else if Double(intConst) < doubleConst {
    print("Double is bigger than Int")
}

print("\nSWIFT - 03. Тюплы\n")


/*
 1. Создать тюпл с тремя параметрами:
 - максимальное количество отжиманий
 - максимальное количество подтягиваний
 - максимальное количество приседаний
 Заполните его своими достижениями :)
 Распечатайте его через println()
 2. Также сделайте три отдельных вывода в консоль для каждого параметра. При том одни значения доставайте по индексу, а другие по параметру
 3. Создайте такой же тюпл для другого человека (супруги или друга) с такими же параметрами, но с другими значениями. Используйте промежуточную переменную чтобы поменять соответствующие значения первого тюпла на значения второго
 4. Создайте третий тюпл с теми же параметрами, но значения это разница между соответствующими значениями первого и второго тюплов. Результат выведите в консоль
 */

print("#1\n")

var mySportTuple = (maxPushUps: 40, maxPullUps: 10, maxPress: 50)

print(mySportTuple.maxPress)


print("\n#2\n")

print(mySportTuple.0)
print(mySportTuple.maxPullUps)
print(mySportTuple.maxPushUps)

print("\n#3\n")
var friendSportTuple = (maxPushUps: 15, maxPullUps: 5, maxPress: 25)
var middleVar = friendSportTuple
friendSportTuple = mySportTuple
mySportTuple = middleVar

print(mySportTuple)
print(friendSportTuple)

print("\n#4\n")
var thirdTuple = (friendSportTuple.maxPushUps - mySportTuple.maxPushUps, friendSportTuple.maxPullUps - mySportTuple.maxPullUps, friendSportTuple.maxPress - mySportTuple.maxPushUps)

print(thirdTuple)


print("\n\nSWIFT - 04. Опциональные типы\n")
/*
1. Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы. Найти сумму всех этих констант приведя их к Int. (Используйте и optional binding и forced unwrapping)
2. С сервера к нам приходит тюпл с тремя параметрами: statusCode, message, errorMessage (число, строка и строка). в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле, если statusCode от 200 до 300 исключительно, то выводите message, в противном случает выводите errorMessage. После этого проделайте тоже самое только без участия statusCode
3. Создайте 5 тюплов с тремя параметрами:
 имя, номер машины, оценка за контрольную. при создании этих тюплов не должно быть никаких данных. после создания каждому студенту установите имя, некоторым установите номер машины, некоторым установите результат контрольной
 выведите в консоль:
- имена студента
- есть ли у него машина
- если да, то какой номер
- был ли на контрольной
- если да, то какая оценка
*/

print("\n#1\n")
let opt1 = "141"
let opt2 = "h1b5"
let opt3 = "981q"
let opt4 = "74"
let opt5 = "mf12"

var sum = 0

if Int(opt1) != nil {
    sum += Int(opt1)!
}
if let number = Int(opt2) {
    sum += number
}
if let number = Int(opt3) {
    sum += number
}
if let number = Int(opt4) {
    sum += number
}
if let number = Int(opt5) {
    sum += number
}
print("sum = \(sum)")

print("\n#2\n")

var serverTuple: (statusCode: Int, message: String?, errorMessage: String?) = (200, "", "")
serverTuple.statusCode = 301
if serverTuple.statusCode >= 200 && serverTuple.statusCode <= 300 {
    serverTuple.message = "Success"
} else {
    serverTuple.errorMessage = "There is an error \(serverTuple.statusCode)"
}

print("\n#3\n")

var studentOne: (name: String?, carNumber: String?, mark: Int?)
var studentTwo: (name: String?, carNumber: String?, mark: Int?)
var studentThree: (name: String?, carNumber: String?, mark: Int?)
var studentFour: (name: String?, carNumber: String?, mark: Int?)
var studentFive: (name: String?, carNumber: String?, mark: Int?)

studentOne.name = "John"
studentOne.carNumber = "A987HP"
studentOne.mark = nil

studentTwo.name = "Bob"
studentTwo.mark = 4

studentThree.name = "Jane"
studentThree.carNumber = "E321XC"

studentFour.name = "Kate"
studentFour.mark = 5

studentFive.name = "Alex"
studentFive.mark = 4

//if studentOne.carNumber != nil {
//    print("\(studentOne.name!) has car with \(studentOne.carNumber!)")
//} else {
//    print("\(studentOne.name!) has no car")
//}
//
//if studentOne.mark != nil {
//    print("\(studentOne.name!) was at the exam and gained \(studentOne.mark!)")
//} else {
//    print("\(studentOne.name!) was not at the exam")
//}


let arrayStudent = [studentOne, studentTwo, studentThree, studentFour, studentFive]

for (name, carNumber, mark) in arrayStudent {
    if let stName = name {
        print("Student name is \(stName)")
    }
    if let stCarNumber = carNumber {
        print("Student \(name!) has car with number \(stCarNumber)")
    } else {
        print("Student \(name!) has no car")
    }
    if let stMark = mark {
        print("Student gained \(stMark)")
    } else {
        print("Student wasn't at exam")
    }
}
