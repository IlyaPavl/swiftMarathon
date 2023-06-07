print("02 Lesson - Работа с базовыми типами\n")
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
