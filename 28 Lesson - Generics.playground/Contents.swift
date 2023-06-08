print("28 Lesson - Generics")
//1
var sringArray = ["Hi", "Hello", "Good By"]
var intArray = [1,2,3,4,5,3]
var doubleArray = [1.2,1.5,4.5]

func prinElementFromArray<T>(a: [T]) {
    for elements in a {
        print (elements)
    }
}
prinElementFromArray (a: sringArray)
prinElementFromArray (a: intArray)
prinElementFromArray (a: doubleArray)

//2
func doNothing<T>(x: T) -> T {
    return x
}

doNothing(x: "mama")
doNothing(x: 1234)
doNothing(x: false)

//3
var emptyArray = [String]()
struct GenericArray<T> {
    var items = [T]()
    mutating func push (item: T) {
        items.append (item)
    }
}

var myFriendsList = ["'Vova", "Bob", "Klim"]
var arrays = GenericArray (items: myFriendsList)
arrays.push(item: "Nick" )


/* Домашнее задание
 Создать любой generic для класса.
*/

class Generic<T>{
    
    func printArray<T>(a:[T]){
        var array:[Any] = []
        array.append(a)
    }
}

var array:[Any] = ["Hi", 111, 1.3,"Bye"]

func printArray1<T>(a:[T]){
    array.removeAll()
    for i in a{
        array.insert(i, at: 0)
    }
}

printArray1(a: array)
print(array)
