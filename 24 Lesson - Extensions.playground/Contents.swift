print("24 Lesson - Расширения\n")

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

enum CheckList : UInt8 {
    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
}
let checkList : UInt8 = 0b00001001
extension CheckList {
    //1 метод
    func setMask(num: UInt8) -> String {
        var mask = self.rawValue | num
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


var sin : UInt8 = 0b00000001
var shift = 1
for _ in 1...100 {
    sin <<= shift
    print(sin.binary())
    
    if sin == 128 { shift = -1}
    if sin == 1 { shift = 1}
}

/*
 + 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 + 2. Добавьте проперти, которое возвращает количество символов в числе
 + 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 
 let a = 8245
 a[1] // 4
 a[3] // 8
 
 Профи могут определить и сеттер :)
 + 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] (то есть Range), используя getter и мог также устанавливать значения используя setter
 + 5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
 let s = "Hi hi hi"
 s.truncate(4) // Hi h...
 s.truncate(10) // Hi hi hi
 */


extension Int {
    var isNegative : Bool {
        return self < 0
    }
    
    var isPositive : Bool {
        return !isNegative
    }
    
    var length : Int {
        let temp = String(self)
        return temp.count
    }
    
    subscript(number: Int) -> String {
        var array = Array(String(self))
        var index = array.count - 1 - number
        if index >= 0 && index < array.count {
            return String(array[index])
        } else {
            return "Error"
        }
        
    }
}

extension String {
//    subscript(start: Int, length: Int) -> String {
//        let start = self.index(self.startIndex, offsetBy: start)
//        let end   = self.index(start, offsetBy: length)
//        return String(self[start..<end])
//    }
    
    subscript(range: CountableRange<Int>) -> String {
        let start = self.index(startIndex, offsetBy: range.lowerBound)
        let end = self.index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
    
    func trunc(length: Int) -> String {
        return (self.count > length) ? self.prefix(length) + "..." : self
    }
}

var a = -1
var b = 32428371
var c = "This is subscript"

a.isNegative
a.isPositive

b.length

b[4]

c[4..<7]

c.trunc(length: 17)
