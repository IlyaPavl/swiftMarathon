print("14 Lesson - Свойства типов")

/*
 1. Самостоятельно повторить проделанное в уроке
 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет - возвращать 0)
 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
 */

print("\n#1\n")

import Foundation

struct Student {
    var firstName: String {                     //stored properties
        willSet {
            print("will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    var lastName : String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {                      //computed properties
        get {
            return firstName + " " + lastName
        }
        set(newValue) {
            print("fullName wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var birthdate: Birthdate
    
    var yearsOld: Int? {
        if let date = birthdate.date {
            let calendar = Calendar.current
            let currentComponent = calendar.dateComponents([.year], from: date, to: Date())
            return currentComponent.year
        }
        return nil
    }
    
    var yearsAtStudy: Int {
        if yearsOld! > 6 || yearsOld != nil {
            return yearsOld! - 6
        }
        return 0
    }
    
}
print("\n#2\n")

struct Birthdate {
    var day: Int
    var month: Int
    var year: Int
    
    var date: Date? {
        let calendar = Calendar.current
        return calendar.date(from: DateComponents(year: year, month: month, day: day))
    }
}



var student = Student(firstName: "Alex", lastName: "Skutarenko", birthdate: Birthdate(day: 12, month: 09, year: 1997))

student.firstName
student.lastName
student.fullName
student.firstName = "Bob"
student.firstName
student.lastName
student.fullName

student.yearsOld
student.fullName = "Ivan Ivanov"



// пимеры для stored properties
student.firstName
student.firstName = "Bob"
student.firstName = "SAM"
student.firstName

/*
3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
*/

print("\n#3\n")

struct Line {
    var a : Point
    var b : Point
    
    var middle : Point {
        set {
            let offsetA = newValue.x - middle.x
            let offsetB = newValue.y - middle.y
            
            a.x = a.x + offsetA
            a.y = a.y + offsetB
            
            b.x = b.x + offsetA
            b.y = b.y + offsetB

        }
        get {
            return Point(x: ((a.x + b.x))/2, y: ((a.y + b.y))/2)
        }
    }
    
    var length : Double {
        set {
            let newX = (a.x + newValue * (b.x - a.x) / length)
            let newY = (a.y + newValue * (b.y - a.y) / length)
            b = Point(x: newX, y: newY)
        }
        get {
            return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2))
        }
    }
}

struct Point {
    var x : Double
    var y : Double
}

var line = Line(a: Point(x: 3, y: 1), b: Point(x: 8, y: 11))

print(line.middle)
print(line.length)

line.a = Point(x: 7, y: 13)
print(line.middle)
print(line.length)
