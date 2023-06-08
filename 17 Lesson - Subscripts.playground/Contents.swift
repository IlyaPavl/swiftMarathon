print("17 Lesson - Subscripts")
/*
 Крестики нолики (Средний уровень)

 1. Создать тип, представляющий собой поле для игры в крестики нолики. На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик. Добавьте возможность красиво распечатывать поле

 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу, причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.

 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.

 4. Если хотите, добавте алгоритм, который вычислит победителя
 */




enum Figures : String {
case empty = " ⬜️"
case cross = " ❌"
case circle = " ⭕️"
case error = "❗️"
}

class Field {
    var height : Int
    var width : Int
    var field = [[Figures]]()
    
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
        
        for _ in 0..<height {
            var line = [Figures]()
            for _ in 0..<width {
                line.append(.empty)
            }
            self.field.append(line)
        }
    }
    
    func clearField() {
        field.removeAll()
        print("New game")
        for _ in 0..<height {
            var line = [Figures]()
            for _ in 0..<width {
                line.append(.empty)
            }
            self.field.append(line)
        }
    }
    
    func show() {
        for line in field {
            var stringLine = String()
            for value in line {
                stringLine += value.rawValue
            }
            print(stringLine)
        }
    }
    
    subscript(x : Int, y : Int) -> Figures {
        get {
            if x >= 0 && y >= 0 && x < width && y < height {
                return field[x][y]
            } else {
                print(Figures.error.rawValue)
                return .error
            }
        }
        set {
            if (x >= 0 && y >= 0 && x < width && y < height) && (field[x][y] != .cross && field[x][y] != .circle) {
                print("\(newValue.rawValue) set to postion: \(x), \(y)")
                field[x][y] = newValue
                
                if field[0][0] == field[1][1] && field[1][1] == field[2][2] {
                    print("You win")
                }
            }
        }
    }
}

let field = Field(height: 3, width: 3)

field[2, 2] = .cross
field.show()
field[0, 0] = .cross
field[0, 0] = .circle
field.show()
field[1, 1] = .cross
field.show()
field.clearField()
field.show()
