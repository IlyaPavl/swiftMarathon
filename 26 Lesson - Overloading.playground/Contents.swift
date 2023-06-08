print("26 Lesson - Overloading")

import Foundation
struct Point {
    var x : Int
    var y : Int
}


var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)

// переопределение сложения
func + (a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}
p1 + p2

// переопределение умножения
func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}
p1 * p2

// переопределение сокращенного сложения
func += ( a: inout Point, b: Point) {
    a = a + b
}
p1 += p2

// переопределение провекрки равенства
func == (a: Point, b: Point) -> Bool {
    return a.x == b.x && a.y == b.y
}

p1 == p2

//создаем свои операторы
infix operator %%%
func %%% ( a: inout Point, b: Point) -> Point {
    a.x += b.y
    a.y -= b.x
    return a
}

p1
p2
p1 %%% p2

/* в новой версии Swift
 precedencegroup myPrecedenceGroupName {
     //higherThan: LogicalConjunctionPrecedence // смотреть можно в документации
     lowerThan: AdditionPrecedence // тут можно или higherThan или lowerThan
     //higherThan: AdditionPrecedence
     associativity: left // right or none
     assignment: false// or true - поведение как у группы assignment операторов присвоения относительно optional chaining (опциональной цепочки) или как у всех остальных
 }

 infix operator ** : myPrecedenceGroupName

 func ** (a: Point, b: Point) -> Point {
     return Point (x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
 }
 */
infix operator ** : MultiplicationPrecedence
func ** (a: Point, b: Point) -> Point {
    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1 ** p2 ** p1


var s = "Hello, World!"

func -= (s1: inout String, s2: String) {
    let set = CharacterSet(charactersIn: s2) // создаем сет из тех букв, которые хотим удалить
    let components = s1.components(separatedBy: set) // разбиваем строку с помощью set
    s1 = components.joined(separator: "") // соединяем получившийся сет символов с помощью разделителя
    // данная функция зависит от регистра
}


s -= "lo"


/*
 1. Для нашей структуры Point перегрузить операторы: -, -=, /, /=, *=
 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
 3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
*/

//1

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func -= ( a: inout Point, b: Point) {
    a = a - b
}

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func /= ( a: inout Point, b: Point) {
    a = a / b
}

func *= ( a: inout Point, b: Point) {
    a = a * b
}

//2
struct Size{
    var widht:Int
    var hight:Int
}

struct Rect {
    var point: Point
    var size: Size
    init(x:Int, y:Int, w:Int, h:Int) {
        self.point = Point(x: x, y: y)
        self.size = Size(widht: w, hight: h)
    }
}


var rect1 = Rect(x: 3, y: 2, w: 4, h: 4)
var rect2 = Rect(x: 2, y: 1, w: 2, h: 3)

func + (a: Rect, b: Rect) -> Rect {
//    let sumA =  a.point
//    let sumB = b.size
//    let sum = (sumA.y - sumB.hight) - (sumA.x - sumB.widht)
//    return sum
    
    return Rect(x: a.point.x + b.point.x, y: a.point.y + b.point.y, w: a.size.widht + b.size.widht, h: a.size.hight + b.size.hight)
}
var rect3 = rect1 + rect2


//3
func + (a: String, b: Int) -> String {
    let result = a + String(b)
    return result
}

let stroka1 = "I'm "
let stroka2 = 25

stroka1 + stroka2

// 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы


var stroka3 = "I'm a twenty five years old junior Swift"
let stroka4 = "ato"

infix operator ^^

func ^^ (inputString: inout String, matchString: String) -> String {
    var result = ""
    
    for c in inputString {
        if matchString.contains(c) {
            result += String(c).uppercased()
        } else {
            result += String(c)
        }
    }
    return result
}

stroka3 ^^ stroka4

