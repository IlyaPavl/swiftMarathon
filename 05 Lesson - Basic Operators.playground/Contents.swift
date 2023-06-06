print("SWIFT - 05. Базовые операторы\n")

/*
1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)
2. Посчитайте в каком квартале вы родились
3. Создайте пять переменных типа Инт и добавьте их в выражения со сложением, вычитанием, умножением и делением. В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. Переменные могут повторяться. Убедитесь что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций
4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h
*/


print("\n#1\n")

let secToMyBday = ((5*31) + (2*30) + 28 + 12) * 24 * 60 * 60
print(secToMyBday)

print("\n#2\n")

let monthOfBday = 9

if monthOfBday >= 1 && monthOfBday <= 3 {
    print("Я родился в 1 квартале")
} else if monthOfBday >= 4 && monthOfBday <= 6 {
    print("Я родился в 2 квартале")
} else if monthOfBday >= 7 && monthOfBday <= 9 {
    print("Я родился в 3 квартале")
} else if monthOfBday >= 10 && monthOfBday <= 12 {
    print("Я родился в 4 квартале")
}

print("\n#2\n")

let chessCoordinate = [1, 2, 3, 4, 5, 6, 7, 8]
let chessPos = (8, 8)

if chessCoordinate.firstIndex(of: chessPos.0) != nil {
    let sum = chessPos.0 + chessPos.1
    if (sum) % 2 == 0 {
        print("White")
    } else {
        print("Black")
    }
}

let x = [1, 2, 3, 4, 5, 6, 7, 8]
let y = ["a", "b", "c", "d", "e", "f", "g", "h"]

let chessPoint = ("a", 1)

if let index = y.firstIndex(of: chessPoint.0) {
    let sum = index + chessPoint.1 + 1
    if (sum) % 2 == 0 {
        print("Black")
    } else {
        print("White")
    }
}