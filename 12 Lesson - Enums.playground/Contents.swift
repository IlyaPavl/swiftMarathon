print("12 Lesson - Enums")

/*
 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
*/

print("\n#1\n")

enum figures: String {
        case king = "King"
        case queen = "Queen"
        case rook = "Rook"
        case knight = "Knight"
        case bishop = "Bishop"
        case pawn = "Pawn"}

enum color {
    case black, white
}

enum letters {
    case A, B, C, D, E, F, G, H
}

enum digits {
    case one, two, three, four, five, six, seven, eight
}

typealias ChessFigures = (figures, color, letters, digits)

var blackKing: ChessFigures = (figures.king, color.black, letters.H, digits.eight)
var whiteKnightOne: ChessFigures = (figures.knight, color.white, letters.F, digits.seven)
var whiteKnightTwo: ChessFigures = (figures.knight, color.white, letters.F, digits.six)
var whiteKing: ChessFigures = (figures.king, color.white, letters.G, digits.seven)

let chessMate = [blackKing, whiteKing, whiteKnightOne, whiteKnightTwo]

print("\n#2\n")

func descriptionFigures(figureArray array: [ChessFigures]) {
    for figure in array {
        print(figure.0.rawValue, figure.1, figure.2, figure.3)
    }
}

descriptionFigures(figureArray: chessMate)
