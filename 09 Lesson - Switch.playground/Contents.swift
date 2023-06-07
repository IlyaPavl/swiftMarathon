print("09 Lesson - Switch")

/*
 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.

 2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа

 3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.

 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
 */

print("\n#1\n")

let switchString = "Несмотря на то, что мы можем планировать и управлять нашей жизнью, неизбежно будут моменты, когда неожиданные обстоятельства заставят нас изменить наш путь, переосмыслить наши цели для движения вперед! (2 попытка в 2023 году создать свитч)"

let soglChar: [Character] = ["б", "в", "г", "д", "ж", "з", "й", "к", "л", "м", "н", "п", "р", "с", "т", "ф", "х", "ц", "ч", "ш", "щ"]
let glChar: [Character] = ["а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я"]
let symbolsChar: [Character] = [",", "!"]
let numbersChar: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

var sogl = 0
var gl = 0
var symbols = 0
var numbers = 0

for symb in switchString {
    switch symb {
    case _ where soglChar.contains(symb):
        sogl += 1
    case _ where glChar.contains(symb):
        gl += 1
    case _ where symbolsChar.contains(symb):
        symbols += 1
    case _ where numbersChar.contains(symb):
        numbers += 1
    default:
        break
    }
}

print("В предложении \(sogl) согласных, \(gl) гласных, \(symbols) символов и \(numbers) цифр")

print("\n#2\n")

var ageOfPerson = 25

switch ageOfPerson {
case 0..<1:
    print("Период грудного возраста")
case 1..<3:
    print("Ясельный возраст")
case 3..<7:
    print("Дошкольный возраст")
case 7..<17:
    print("Подростковый возраст")
case 17..<21:
    print("Юношеский")
case 21..<35:
    print("Зрелый возраст, первый период")
case 35..<60:
    print("Зрелый возраст, второй период")
case 60..<75:
    print("Пожилой возраст")
case 75..<90:
    print("Старческий возраст")
case 90...:
    print("Долгожители")
default:
    break
}


print("\n#3\n")

var name = "Илья"
var surname = "Вовин"
var patronamic = "Владимирович"

let fullName = (surname, name, patronamic)

switch fullName {
case let (_, name, _) where name.first == "А" || name.first == "О":
    print("\(name)")
case let (_, _, patronamic) where patronamic.first == "В" || patronamic.first == "Д":
    print("\(name) \(patronamic)")
case let (surname, _, _) where surname.first == "Е" || surname.first == "З":
    print("\(surname)")
default:
    print("\(surname) \(name) \(patronamic)")
}

print("\n#4\n")

let point = (x:"J", y: 6)
switch point {
case ("B"..."J", 2...8): print("Попал")
default: print("мимо")
}
