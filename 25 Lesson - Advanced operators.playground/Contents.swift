print("25 Lesson - Advanced operators\n")

import Foundation

// MARK: - Теория по типам UInt8, Int8
extension UInt8 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var a: UInt8 = 57

a.binary()

0b11111111
0xff
255

a = 0b00111001
a.binary()
(5 as UInt8).binary()
a = a + 0b00000101
a.binary()

(4 as UInt8).binary()

a = a - 0b00000100

a = a << 1 //закономерность - при сдвиге влево / вправо на 1 оно становится х2 / делить на 2

//   Арифметические операторы в Swift не переполняются по умолчанию. Переполнения отслеживаются и выводятся как ошибка.
//   Для того, чтобы этого избежать, вы можете использовать оператор из второго набора арифметических операторов Swift (&+). Все операторы переполнения начинаются с амперсанда (&).
a = a &* 8 // использование & означает, что мы уведомляеям Свифт, что мы готовы к переполнению, если его не поставить, то результата не будет

a = 0b11111111
a = a &+ 1
a
a = a &- 1

extension Int8 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var b : Int8 = 57
b.binary()

b = 0b1111111
b.binary()
b = b &+ 1 //если не поставить &, то все упадет
b.binary()

b = 0
b = b - 1
b.binary()

b = 0b00100001
b = b << 2 //если двигать шифтами число Int8, то нужно быть готовым, что оно может стать отрицательным

// MARK: - Битовые операции

var c: UInt8 = 0b00110011
var d: UInt8 = 0b11100001

c.binary()
d.binary()

(c | d).binary() // битовое сложение (или)

c.binary()
d.binary()
(c & d).binary() // битовое умножение (и)

c.binary()
d.binary()
(c ^ d).binary() // исключающее или

c.binary()
(~c).binary() // инверсия


// MARK: - Применение битовых операций

// если надо проверить установлен ли третий бит, то создаем маску в виде числа, в котором есть третий бит и умножаем числа. Таким образом, мы узнаем, установлен ли третий бит
d = 0b00001000
c.binary()
d.binary()
(c & d).binary()

// для бита номер 4
d = 0b00010000
c.binary()
d.binary()
(c & d).binary()

// проверяем установлены ли 2 бита - 1 и 4
d = 0b00010001
c.binary()
d.binary()
(c & d).binary()

// установка 2 бита
d = 0b0000100
c.binary()
d.binary()
(c | d).binary()

// устанавливать бит, если он сброшен и сбрасывать, если установлен
c.binary()
d.binary()
(c ^ d).binary()

// сбросить 4 бит
d = 0b00010000
c.binary()
d.binary()
(c & ~d).binary()

// MARK: - Применение битовых операций на примере списка покупок

enum CheckList : UInt8 {
    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
}

let checkList : UInt8 = 0b00001001
let bread = checkList & CheckList.Bread.rawValue
bread.binary()

let chicken = checkList & CheckList.Chicken.rawValue
chicken.binary()

let pears = checkList & CheckList.Pears.rawValue
pears.binary ()

// Домашнее задание
/*
 + 1. Расширьте енум из урока и добавьте в него метод, помогающий установить, что продукт куплен, т.е устанавливать соответствующий бит в переданную маску, а также создать метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его
 + 2. Создать цикл, который будет рисовать синусоиду, т.е. выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида сверху вниз
 3. Создайте 64х битное Int число, которое представляет клетки на шахматной доске:
 - создать цикл, который установит правильно биты шахматной доски (Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4))
 - установите биты так, что 0 - это белое поле, а 1 - черное.
 - выбирая клетки по индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита
 */

extension CheckList {
    //1 метод
    func setMask(num: UInt8) -> String {
        let mask = self.rawValue | num
        return mask.binary()
    }
    
    func checkThatBought(num: UInt8) -> String {
        if (self.rawValue & num) != 0 {
            return "Bought"
        } else {
            return "Need to buy"

        }
    }
}

CheckList.Chicken.setMask(num: checkList)
CheckList.Chicken.checkThatBought(num: checkList)

var checkList2 : UInt8 = 0b00001011
CheckList.Chicken.checkThatBought(num: checkList2)

//2
var sin : UInt8 = 0b00000001
var shift = 1
for _ in 1...100 {
    sin <<= shift
    print(sin.binary())
    
    if sin == 128 { shift = -1}
    if sin == 1 { shift = 1}
}

0b10000000


//3. Создайте 64х битное Int число, которое представляет клетки на шахматной доске.
//  - создать цикл, который установит правильно биты шахматной доски (Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4))
//  - установите биты так, что 0 - это белое поле, а 1 - черное.
//  - выбирая клетки по индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита

extension UInt64 {
    func binary() -> String {
        var result = ""
        for i in 0..<64 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}
//var chessBoard: UInt64 = 0b01010101_01010101_01010101_01010101_01010101_01010101_01010101_01010101

//var str = Array(chessBoard.binary())
//str.count

class Chess {
    
    let letters = ["A","B","C","D","E","F","G","H"]
    let numbers = 0..<8
    
    var dict = [String : UInt64]()
    
    var field : UInt64 = 0  // ...000000
    var mask : UInt64 = 1   // ...000001
    
    init() {
        for (j,value) in letters.enumerated() {
            for i in numbers {
                if (i % 2 == j % 2) { // черные
                    field = field | mask // каждый второй шаг маска будет накладываться на field (получим ..010101)
                    dict["\(value)\(i+1)"] = mask
                } else {
                    dict["\(value)\(i+1)"] = mask
                }
                mask <<= 1 // каждый шаг маска будет сдвигаться на 1 бит влево
                // 0. mask = ...001
                // 0. field = ...001
                // 1. mask = ...010
                // 1. field = ...001
                // 2. mask = ...100
                // 2. field = ...101
            }
        }
        // mask = 0 // маска обнулилась
        // field = 12273903644374837845
        // field.binary() = 10101010_01010101_10101010_01010101_10101010_01010101_10101010_01010101
    }

    // после инициализации
    // field = 0b10101010_01010101_10101010_01010101_10101010_01010101_10101010_01010101
    // mask  = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    subscript(letter: String, number: Int) -> String? {
        let cell = "\(letter)\(number)".uppercased()
        var mask : UInt64 = 0
        if dict[cell] != nil {
            mask = UInt64(dict[cell]!)
        } else {
            return nil
        }
        return mask & field == 0 ? "white" : "black"
    }
        
}
    
let chessBoard = Chess()
if let color = chessBoard["a",1] {
    print("Cell a1 is \(color)")
}
if let color = chessBoard["a",8] {
    print("Cell a8 is \(color)")
}
if let color = chessBoard["h",1] {
    print("Cell h1 is \(color)")
}
if let color = chessBoard["h",8] {
    print("Cell h8 is \(color)")
}


