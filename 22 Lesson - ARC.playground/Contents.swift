import Foundation

print("22 Lesson - ARC\n")

/*
 Notes:
 1. объект живет до тех пор, пока на него есть хоть одна сильная ссылка
 2. не делать стронг ссылки объектов друг на друга. Для этого необходимо определить какой из объектов главный и поставить у второго объекта ключевое слово weak
 */

var playground = true

class Student {
    // теперь свяжем два класса между собой
    weak var teacher : Teacher? // слабая ссылка всегда var, всегда опциональный тип
//    unowned var teacher : Teacher // слабая ссылка можно неопционально, ключевое слово unowned и его надо инициализировать

    deinit {
        print("goodbye student")
    }
}

class Teacher {
    
    var student : Student?

    
    deinit {
        print("goodbye teacher")
    }
}


if playground {
    
//    var t : Teacher?
    //зона видимости двух переменных до фигурной скобки условия
    var teacher = Teacher()
    
    if playground {
        var student = Student() // в данном случае студент раньше удаляется из памяти
        teacher.student = student // установив проперти теперь студент удалится позже, так как у него была вторая ссылка на класс
        
        // но что, если мы хотим, чтобы и студент указывал на учителя?
        student.teacher = teacher // теперь ни один из объектов не уничтожен, так как два объекта указывают сильной ссылкой друг на друга. Это ведет к падению приложений
    }
//    t = teacher // это вторая ссылка и поэтому при запуске teacher не будет удален из памяти
    
    
    print("exit playground")
}

print("end")

var x = 10
var y = 20

class Human {
    var name = "a"
}

var h = Human()

var closure : () -> () = {
    // чтобы зафиксировать значения х и у внутри клоужера, можно использовать capture released следующим образом
    [x, y] in // capture released
    print("\(x) \(y)")
}

var closure2 : (Int) -> Int = {[x, y] (a: Int) -> Int in // чтобы зафиксировать значения х и у можно использовать capture released [x, y]
    print("\(x) \(y) \(h.name)")
    return a
}

closure()

x = 30
y = 40
h = Human()
h.name = "b"

closure()

// MARK: - ARC в действии
print("")
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print(" \(name) initialization...")
    }
    deinit {
        print(" \(name) deinitialization...")
    }
}

var reference1 : Person?
var reference2 : Person?
var reference3 : Person?

reference1 = Person(name: "Tom") // у reference1 1 сильная ссылка
reference2 = reference1 // у reference1 2 сильных ссылки
reference3 = reference1 // у reference1 3 сильных ссылки
reference1 = nil // у reference1 2 сильных ссылки
reference2 = nil // у reference1 1 сильная ссылка
reference3 = nil // у reference1 0 сильных ссылок, только теперь память освобождается
