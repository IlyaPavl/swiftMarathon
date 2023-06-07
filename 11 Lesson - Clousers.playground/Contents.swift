print("11 Lesson - Clousers")

/*
 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает. Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте print в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную. Используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.

 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
 */


print("\n#1\n")
func lessonTen(closure: () -> Void) {
    closure()

    for i in 1...10 {
        print(i)
    }
    closure()
}

lessonTen(closure: {print("Closure")})

print("\n#2\n")
let intArray = [15, 131, 9, 453, 12, 4, 1, 3, 64, 27]

// способ с использованием функции
func sort(s1: Int, s2: Int) -> Bool {
    return s1 < s2
}
var sortedArray = intArray.sorted(by: sort)
print(sortedArray)

//более короткий способ с использованием клоужера
var closureArray = intArray.sorted(by: { s1, s2 in return s1 < s2 })
print(closureArray)

print("\n#3\n")

func taskThree(array: [Int], closure: (_ s1: Int?, _ s2: Int) -> Bool ) -> Int? {
    var optVar: Int?
    
    for value in array {
        if closure(optVar, value) {
            optVar = value
        }
    }
    return optVar
}

let maxElement = taskThree(array: intArray, closure: {s1, s2 in
    if s1 == nil {
        return true
    } else {
        return s1! < s2
    }
})

let minElement = taskThree(array: intArray, closure: { s1, s2 in
    if s1 == nil {
        return true
    } else {
        return s1! > s2
    }
})

print(maxElement ?? 0)
print(minElement ?? 0)

print("\n#4\n")
// 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

let stroke = "a Adsfkj;lewjqoir324234kl;jasdF;ffkjF ;mnvzxc,n<MNLK Jal;dsfQEWRaFSLJ:342;l,.mmn,sdfa"
let vowelsSet = ["a", "e", "i", "o", "u", "y"]
let consonantsSet = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
let digitsSet = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
let symbolsSet = [":", ";", ",", "."]

func priorityChar(char: Character) -> Int {
    let lowercase = String(char).lowercased()
    
    switch lowercase {
    case let letter where vowelsSet.contains(letter):
        return 4
    case let letter where consonantsSet.contains(letter):
        return 3
    case let letter where digitsSet.contains(letter):
        return 2
    case let letter where symbolsSet.contains(letter):
        return 1
    default: return 0
    }
}

let strokeSorted = stroke.sorted {
    switch(priorityChar(char: $0), priorityChar(char: $1)){
    case let (x, y) where x > y: return true
    case let (x, y) where x < y: return false
    default: return $0.lowercased() <= $1.lowercased()

    }
}

print(String(strokeSorted))
