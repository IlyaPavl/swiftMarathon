print("15 Lesson - Type Properties")

/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)

 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.

 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */


print("\n#1\n")

enum FileType {
    case hidden
    case visible
}
struct FileDescription {
    static var maxfileSize = 100
    var fileSize : Int {
        didSet {
            if fileSize > FileDescription.maxfileSize {
                return fileSize = oldValue
            }
        }
    }
    var fileName : String
    var folderPath : String
    var filePath : String {
        return folderPath + fileName
    }
    var fileType : FileType
    var fileContent : String
}
let file = FileDescription(fileSize: 40, fileName: "testFile", folderPath: "/Users/Documents/", fileType: FileType.visible, fileContent: "Contains test information")

print(file.filePath)



print("\n#2\n")

enum ColorScheme: Int {
    static var numberColor = 3
    static var firstColor = ColorScheme.red
    static var lastColor = ColorScheme.blue
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
    
}


print("\n#3\n")

class Man {
    
    static let minAge = 0
    static let maxAge = 100
    static let maxNameLength = 25
    static let minNameLength = 2
    static let maxSurnameLength = 25
    static let minSurnameLength = 2
    static let maxHeight = 250.0
    static let minHeight = 40.0
    static let maxWeight = 200.0
    static let minWeight = 2.0
    
    static var count = 0

    
    
    var name : String {
        didSet {
            if name.count > Man.maxNameLength || name.count < Man.minNameLength {
                name = oldValue
            }
        }
    }
    var surname : String {
        didSet {
            if surname.count > Man.maxSurnameLength || surname.count < Man.minSurnameLength {
                surname = oldValue
            }
        }
    }
    
    var age : Int {
        didSet {
            if age > Man.maxAge || age < Man.minAge {
                age = oldValue
            }
        }
    }
    var height : Double {
        didSet {
            if height > Man.maxHeight || height < Man.minHeight {
                height = oldValue
            }
        }
    }
    var weight : Double {
        didSet {
            if weight > Man.maxWeight || weight < Man.minWeight {
                weight = oldValue
            }
        }
    }
    
    init (name: String, surname: String, age: Int, height: Double, weight: Double) {
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        Man.count += 1
    }
}

var man = Man(name: "Alex", surname: "T", age: 30, height: 165, weight: 65)
var man1 = Man(name: "Alex1", surname: "T1", age: 20, height: 1700, weight: 50)
man.name = ""
man.surname = "Ivanov"
man.surname = " ;asldkjf;lksadjf;lkasfjkl;sadjf;lkasdj;lfjlsk;dajf;lsdakjf;llkasdjfl;klksd;afjl;skadflsadlkf"
man1.height = 200
man1.height = 270
man.weight = 0

print(man1.height)
print("Human count: \(Man.count)")
