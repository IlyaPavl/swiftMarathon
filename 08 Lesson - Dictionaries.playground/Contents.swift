print("08 - Словари")

/*
1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
После всех этих перетрубаций посчитайте общий бал группы и средний бал

2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение. В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.

3. Создать дикшинари, в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно. Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).
*/


print("\n#1\n")

var studentDict = ["Иван Иванов": 5,
                   "Петр Петров": 4,
                   "Антон Антонов": 5,
                   "Александр Александров": 3,
                   "Евгений Евгеньев": 4]

studentDict.updateValue(4, forKey: "Александр Александров")

studentDict ["Роман Романов"] = 5

studentDict.removeValue(forKey: "Евгений Евгеньев")

var markSum: Double = 0.0
var markAvg: Double = 0.0

for value in studentDict.values {
    markSum += Double(value)
}

markSum
markAvg = markSum / Double(studentDict.count)

print("\n#2\n")

var monthAndDay = ["Январь": 31,
                   "Февраль": 28,
                   "Март": 31,
                   "Апрель": 30,
                   "Май": 31,
                   "Июнь": 30,
                   "Июль": 31,
                   "Август": 31,
                   "Сентябрь": 30,
                   "Октябрь": 31,
                   "Ноябрь": 30,
                   "Декабрь": 31]

for (name, quantity) in monthAndDay {
    print("\(name): \(quantity)")
}

print("\n#2.1\n")
for keys in monthAndDay.keys {
    print("\(keys) : \(monthAndDay[keys]!)")
}

print("\n#3\n")
var flag = false
var chessDict = [String: Bool] ()
let xChess = ["A", "B", "C", "D", "E", "F", "G", "H"]
let yChess = [1, 2, 3, 4, 5, 6, 7, 8]

for letter in xChess.indices {
    for number in yChess {
        let key = String(xChess[letter]) + String(number)
        chessDict[key] = flag
        flag = !flag
    }
}

chessDict


for (index, x) in xChess.enumerated() {
    for y in yChess {
        if (index + y + 1) % 2 == 0 {
            chessDict["\(x)\(y)"] = false
        } else {
            chessDict["\(x)\(y)"] = true
        }
    }
}

print(chessDict)
chessDict["A1"]!
