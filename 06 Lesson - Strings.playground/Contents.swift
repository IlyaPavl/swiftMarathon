/*
1. Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы. Найти сумму всех этих констант приведя их к Int, только вместо forced unwrapping и optional binding используйте оператор ??
 Когда посчитаете сумму, то представьте свое выражение в виде строки. Например: 5 + nil + 2 + 3 + nil = 10
 но в первом случае используйте интерполяцию строк, а во втором конкатенацию

2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов, можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C

3. Создайте строку английский алфавит, все буквы малые от a до z, задайте константу - один из символов этого алфавита. Используя цикл for определите под каким индексов в строке находится этот символ
*/
import Foundation
print("06 - Строки")

print("\n#1\n")

let const1 = "128"
let const2 = "19r"
let const3 = "85"
let const4 = "a27"
let const5 = "7O"

let constArray = [const1, const2, const3, const4, const5]
var sumConst = 0
var sumStr = ""
for value in constArray {
    let number = Int(value)
    sumConst += number ?? 0
    
    if !sumStr.isEmpty {
        sumStr += " + "
    }
    if number == nil {
        sumStr += "nil"
    }
    if number != nil {
        sumStr += String(sumConst)
    }
}

print("\(sumStr) = \(sumConst)")

print("\n#2\n")
let stringUnicode = "\u{1F436} \u{1F496} \u{1F425} \u{1F431} \u{1F428}"

print(stringUnicode)
print("Length Swift : \(stringUnicode.count). Length Objective-C: \((stringUnicode as NSString).length)")

print("\n#3\n")

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let char: Character = "z"

for (index, c) in alphabet.enumerated() {
    let realIndex = index + 1
    if c == char {
        print("Index of letter \(c) is \(realIndex)")
    }
}
