print("10 Lesson - Functions")
/*
 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */

print("\n#1\n")

func heart() -> String {
    return "🫶🏼"
}

func rain() -> String {
    return "☔️"
}

func football() -> String {
    return "⚽️"
}

print(heart() + " " + rain() + " " + football())

print("\n#2\n")

func cellColor(letter: Character, number: Int) -> String {
    let letters = "abcdefgh"
    var cell = String()
    
    if let indexOfLetter = letters.firstIndex(of: letter) {
        let letter = indexOfLetter.utf16Offset(in: letters)
        if (letter + number + 1) % 2 == 0 {
            cell = "Black"
        } else {
            cell = "White"
        }
    }
    return cell
}

print(cellColor(letter: "a", number: 1))

print("\n#3\n")

func reversedArray(array: [String]) -> [String] {
    var revArray = [String]()
    for value in array {
        revArray.insert(String(value), at: 0)
    }
    return revArray
}

var testArray = ["A", "B", "C", "D"]

print(reversedArray(array: testArray))

func reversedArraySeq(inSequence range: String...) -> [String] {
    reversedArray(array: range)
    return reversedArray(array: range)
}

print(reversedArraySeq(inSequence: "t", "f", "n"))

print("\n#4\n")

func reversedArrayFour(array: inout [String]){
    array = array.reversed()
}
print(testArray)
reversedArrayFour(array: &testArray)
print(testArray)

print("\n#5\n")

/*
 создаем строку с нашим предложением со знакам, цифрами и буквами
 Объявляем функцию, которая принимает строку и возвращает строку
   в функции создаем пустую строку
   далее делаем словарь для цифр
   после чего создаем кейсы:
 1. все гласные становятся заглавными
 2. все согласные станятся маленькими
 3. цифры меняются на слова с помощью цикла
 4. удаляем все знаки препинания
   возвращаем новую строку
 */

var text = "1. Swift makes 1053 it easy to create arrays in your code using an array literal: simply surround a comma-separated list of values with square brackets. Without any other information, Swift creates an array that includes the specified values, automatically inferring the array’s Element type."

func cleanText(stroke: String) -> String {
    var newText = ""
    let numberDict = ["0": "Zero", "1": "One", "2": "Two", "3": "Three", "4": "Four", "5": "Five", "6": "Six", "7": "Seven", "8": "Eight", "9": "Nine"]
    
    for symb in text {
        let lowerText = String(symb).lowercased()
        switch lowerText {
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
            let low = lowerText.lowercased()
            newText.insert(Character(low), at: newText.endIndex)
        case "a", "e", "i", "o", "u", "y":
            let upper = lowerText.uppercased()
            newText.insert(Character(upper), at: newText.endIndex)
        case " ":
            let space = " "
            newText.insert(Character(space), at: newText.endIndex)
        case _ where symb.isNumber:
            for (key, value) in numberDict {
                if String(symb) == key && text.contains(key) {
                    newText.insert(contentsOf: value, at: newText.endIndex)
                }
            }
        default:
            break
        }
    }
    
    return newText
}

print(cleanText(stroke: text))
