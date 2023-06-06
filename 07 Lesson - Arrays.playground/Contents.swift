/*
1. создать массив "дни в месяцах", 12 элементов содержащих количество дней в соответствующем месяце, используя цикл for и этот массив

- выведите количество дней в каждом месяце (без имен месяцев)
- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
- сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
- для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года

2. Сделайте первое задание к уроку номер 4 используя массивы: (создайте массив опшинал интов и посчитайте сумму)

- в одном случае используйте optional binding
- в другом forced unwrapping
- а в третьем оператор ??

3. создайте строку алфавит и пустой массив строк, в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед
*/
print("07 - Массивы")

print("\n#1\n")

let monthArray = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let namesOfMonth = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
print("\n#1.1\n")
for day in monthArray {
    print(day)
}
print("\n#1.2\n")

for day in 0..<monthArray.count - 1 {
    print("\(namesOfMonth[day]): \(monthArray[day])")
}
print("")

for (index, quantity) in monthArray.enumerated() {
    print("\(namesOfMonth[index]): \(quantity)")
}
print("\n#1.3\n")

var tuplesArray = [(month: String, days: Int)]()

for (name, days) in monthArray.enumerated() {
    tuplesArray.append((namesOfMonth[name], days))
}

for array in tuplesArray {
    print(array)
}

print("\n#1.4\n")
for array in tuplesArray.reversed() {
    print(array)
}

print("\n#1.5\n")

let dob = (month: 5, day: 31)
var days = 0

for i in 0..<(dob.month - 1) {
    days += monthArray[i]
}

days += dob.day

print(days)

print("\n#2\n")
let array2 = ["541", "43v", "7O", "249", "q21"]

var optArray = [Int?]()

for value in array2 {
    optArray.append(Int(value))
}

print("\n#2.1 Force unwrap\n")

var sum = 0

for value in optArray {
    if value != nil{
        sum += value!
    }
}
print(sum)

print("\n#2.2 Optional banding\n")

sum = 0

for value in optArray {
    if let intValue = value {
        sum += intValue
    }
}
print(sum)

print("\n#2.3 Оператор ??\n")

sum = 0
for value in optArray {
    sum += value ?? 0
}

print(sum)

print("\n#2\n")

let alphabetLes6 = "abcdefghijklmnopqrstuvwxyz"
var reverseA = [String]()

for c in alphabetLes6 {
    reverseA.insert(String(c), at: 0)
}

print(reverseA)

reverseA = []

for c in alphabetLes6.reversed() {
    reverseA.append(String(c))
}

print(reverseA)
