print("15 Lesson - Methods")

/* В качестве домашнего задания сделать игру, где управляешь мужиком и толкаешь сердце к заданной точке (сердце с бантиком). Массивом задаю последовательность движений.
 1. Создать тип комната (высота и ширина)
 2. Позиция персонажа (координата х, у)
 3. Функция, которая распечатывает комнату и персонажа в ней
 4. Добавить персонажу метод идти (передать значение enum - направление)
 5. Реализовать правило, что персонаж не может выйти за пределы комнаты (x  не может быть меньше нуля)
 6. Создать ящик с координатами x, y (ящик тоже не должен выходить за пределы)
 7. Добавить цель, куда ящик нужно принести
 */


enum Symbols : String{
    case empty = " ⬜️"
    case wall  = " 🟥"
    case person = " 😊"
    case finishPoint = " 🟩"
    case box = " 📦"
}

enum Direction : String {
    case right, left, up, down
}

class Room {
    let height : Int
    let width : Int
    var roomArray = [[Symbols]]()
    
    init(heght: Int, width: Int) {
        self.height = heght
        self.width = width
        
        for _ in 0..<height {
            var line = [Symbols]()
            for _ in 0..<width{
                line.append(.empty)
            }
            self.roomArray.append(line)
        }
    }
    
    func show() {
        let wallSymbol = Symbols.wall.rawValue
        let topLine = String.init(repeating: wallSymbol, count: width + 2)
        print(topLine)
        for line in roomArray {
            var stringLine = wallSymbol

            for value in line {
                stringLine += value.rawValue
            }
            stringLine += wallSymbol
            print(stringLine)
        }
        print(topLine)
    }
}

class Box {
    var x : Int
    var y : Int
    let xFinish : Int
    let yFinish : Int
    let room : Room
    
    init(x: Int, y: Int, xFinish: Int, yFinish: Int, room: Room) {
        self.x = x
        self.y = y
        self.xFinish = xFinish
        self.yFinish = yFinish
        self.room = room
        
        room.roomArray[y][x] = .box
        room.roomArray[yFinish][xFinish] = .finishPoint
    }
    
    func isFinish() -> Bool {
        if x == xFinish && y == yFinish {
            print("You win!")
            return true
        }
        return false
    }
    
    func move(direction: Direction) -> Bool {
        if isFinish() {
            return false
        }
        var newX = x
        var newY = y
        print("Box moved ", direction.rawValue)
        
        switch(direction) {
        case .up:
            if y <= 0{
                return false
            }
            newY -= 1
        case .down:
            if y >= room.height - 1 {
                return false
            }
            newY += 1
        case .right:
            if x >= room.width - 1{
                return false
            }
            newX += 1
        case .left:
            if x <= 0 {
                return false
            }
            newX -= 1
        }
        
        if newX != x || newY != y {
            room.roomArray[y][x] = .empty
            room.roomArray[newY][newX] = .box
            x = newX
            y = newY
        }
        
        isFinish()
        return true
        
    }
}

class Person {
    var x : Int
    var y : Int
    let room : Room
    let box : Box
    
    init(x: Int, y: Int, room: Room, box: Box) {
        self.x = x
        self.y = y
        self.room = room
        self.box = box
        room.roomArray[y][x] = .person
    }
    func move(direction: Direction) -> Bool {
        
        print("Player Move:", direction.rawValue)
        var newX = x
        var newY = y
        switch(direction) {
        case .up:
            if y <= 0{
                return false
            }
            newY -= 1
        case .down:
            if y >= room.height - 1 {
                return false
            }
            newY += 1
        case .right:
            if x >= room.width - 1{
                return false
            }
            newX += 1
        case .left:
            if x <= 0 {
                return false
            }
            newX -= 1
        }
        if room.roomArray[newY][newX] == Symbols.empty {
            room.roomArray[y][x] = .empty
            room.roomArray[newY][newX] = .person
            x = newX
            y = newY
            return true
        } else if room.roomArray[newY][newX] == Symbols.box {
            box.move(direction: direction)
            room.roomArray[y][x] = .empty
            room.roomArray[newY][newX] = .person
            x = newX
            y = newY
            return true
        }
        return false
    }
}

let room = Room(heght: 5, width: 5)
let box = Box(x: 3, y: 1, xFinish: 3, yFinish: 4, room: room)
let person = Person(x: 1, y: 1, room: room, box: box)
var moveArray = [Direction]()
moveArray = [.up, .right, .right, .down, .down, .down]
room.show()
for value in moveArray {
    person.move(direction: value)
    room.show()
}
