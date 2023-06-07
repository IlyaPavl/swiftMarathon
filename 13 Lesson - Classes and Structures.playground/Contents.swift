print("13 - Классы и Структуры")

/*
 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
 6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
*/

print("\n#1.1\n")

struct StudentStruct {
    var name: String
    var age: Int
    var yearOfBirth: Int
    var avgMark: Double
}


var student1 = StudentStruct(name: "Ivan", age: 21, yearOfBirth: 2002, avgMark: 4.65)
var student2 = StudentStruct(name: "Pavel", age: 23, yearOfBirth: 2000, avgMark: 4.5)
var student3 = StudentStruct(name: "Petr", age: 22, yearOfBirth: 2001, avgMark: 4.8)
var student4 = StudentStruct(name: "Petr", age: 20, yearOfBirth: 2003, avgMark: 4.74)
var student5 = StudentStruct(name: "Petr", age: 25, yearOfBirth: 2005, avgMark: 4.74)


let journal = [student1, student2, student3, student4, student5]

print("\n#2.1\n")

func parceStudent (array: [StudentStruct]) {
    for (index, value) in array.enumerated() {
        print("#\(index + 1): Name - \(value.name), Age - \(value.age), Year of birth - \(value.yearOfBirth), Avarage Mark - \(value.avgMark)")
    }
}
parceStudent(array: journal)

print("\n#3.1\n")
let ascSort = journal.sorted { (s1, s2) -> Bool in
    s1.avgMark < s2.avgMark
}

let descSort = journal.sorted { (s1, s2) -> Bool in
    s1.avgMark > s2.avgMark
}

parceStudent(array: ascSort)
print("")
parceStudent(array: descSort)

print("\n#4.1\n")
let nameSort = journal.sorted { (s1, s2) -> Bool in
    if s1.name == s2.name {
        return s1.age < s2.age
    }
    return s1.name < s2.name
}
parceStudent(array: nameSort)

print("\n#5.1\n")
var newJournal = journal
newJournal[0].name = "George"
newJournal[1].name = "Paul"
newJournal[2].name = "Steve"
newJournal[3].name = "Tim"
newJournal[4].name = "Johny"

parceStudent(array: journal)
print("")
parceStudent(array: newJournal)

print("\n#1.2\n")

class StudentClass {
    var name: String
    var age: Int
    var yearOfBirth: Int
    var avgMark: Double
    
    init(name: String, age: Int, yearOfBirth: Int, avgMark: Double) {
        self.name = name
        self.age = age
        self.yearOfBirth = yearOfBirth
        self.avgMark = avgMark
    }
}

var studentClass1 = StudentClass(name: "Ann", age: 19, yearOfBirth: 2002, avgMark: 4.59)
var studentClass2 = StudentClass(name: "Phill", age: 21, yearOfBirth: 2002, avgMark: 4.67)
var studentClass3 = StudentClass(name: "Mark", age: 20, yearOfBirth: 2000, avgMark: 4.9)
var studentClass4 = StudentClass(name: "Tommy", age: 23, yearOfBirth: 2000, avgMark: 4.86)
var studentClass5 = StudentClass(name: "Tommy", age: 20, yearOfBirth: 2003, avgMark: 4.71)

let journal2 = [studentClass1, studentClass2, studentClass3, studentClass4, studentClass5]

print("\n#2.2\n")
func parceStudentClass (array: [StudentClass]) {
    for (index, value) in array.enumerated() {
        print("#\(index + 1): Name - \(value.name), Age - \(value.age), Year of birth - \(value.yearOfBirth), Avarage Mark - \(value.avgMark)")
    }
}

parceStudentClass(array: journal2)

print("\n#3.2\n")
let ascSortClass = journal2.sorted { (s1, s2) -> Bool in
    s1.avgMark < s2.avgMark
}

let descSortClass = journal2.sorted { (s1, s2) -> Bool in
    s1.avgMark > s2.avgMark
}

parceStudentClass(array: ascSortClass)
print("")
parceStudentClass(array: descSortClass)

print("\n#4.2\n")

let nameSortClass = journal2.sorted { (s1, s2) -> Bool in
    if s1.name == s2.name {
        return s1.age < s2.age
    }
    return s1.name < s2.name
}
parceStudentClass(array: nameSortClass)

print("\n#5.2\n")
var newJournal2 = journal2

newJournal2[0].name = "George"
newJournal2[1].name = "Paul"
newJournal2[2].name = "Steve"
newJournal2[3].name = "Tim"
newJournal2[4].name = "Johny"

parceStudentClass(array: journal2)
print("")
parceStudentClass(array: newJournal2)
