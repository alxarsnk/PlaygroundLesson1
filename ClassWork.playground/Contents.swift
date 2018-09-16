//: Playground - noun: a place where people can play


// CLASSWORK ALEXANDR ARSENYUK

import UIKit

var str = "Hello, playground"

func sortVstav(_ array1:[Int]) -> [Int] {
    var j: Int
    if array1.count == 0 || array1.count == 1{
        return array1
    }
    var muttubleArray=array1
    for i in 0 ..< array1.count{
        
        j = i
        while j > 0 && muttubleArray[j-1] > array1[i] {
            muttubleArray[j] = muttubleArray[j-1]
            j=j-1
        }
        
        muttubleArray[j] = array1[i]
    }
    return muttubleArray
    
}
let list = [13,4,3,2,14,1,1,56,43]
sortVstav(list)

//---------------------------------------------------------------------------------------------------




class People {
    var firstName: String
      private var lastName: String                      //инкапсуляция
    func tellHi() {
        print("Hello")
    }
    init (firstName: String, lastName: String ){
        self.firstName=firstName
        self.lastName=lastName
    
    }
}
class Man: People{                                      // Наследование
    var age: Int
    init(firstName: String, lastName: String, age: Int) {
        self.age=age
        super.init(firstName:firstName, lastName:lastName)
    }
    override func tellHi() {
        print("Hi, I am a man")
    }
}
class Woman: Man{                                       //наследование
    override func tellHi() {
        print("Hi, i am a woman")
    }

}
var arr: [People] = [People(firstName: "Jhon", lastName: "Jhonson"), Man(firstName: "Ivan", lastName: "Ivanov", age: 19), Woman(firstName: "Galya", lastName: "Galya" , age: 20)]

for i in arr {
    print("\(i.tellHi())")
print (i.firstName)     //                                     Полиморфизм
    //  вывести lastName     не можем, так как стоит модификатор доступа  это Инкапсуляция
}



//testing for git

//--------------------------------------------------------------------------------------------------



class BinaryTree {
    var value: Int
    var rightNode: BinaryTree?
    var leftNode: BinaryTree?
    var count: Int
    init(_ v: Int, _ p: BinaryTree? = nil) {
        self.value = v
        self.count = 1
    }
    func insert(node: Int){
        if node == self.value {
            self.count = self.count + 1
            
        }
        else if node < self.value {
            if let left = self.leftNode {
                left.insert(node: node)
            } else {
                self.leftNode = BinaryTree(node, self)
            }
        }
        else if node == self.value {
            self.count = self.count + 1
            
        }
        else{
            if let right = self.rightNode{
                right.insert(node: node)
            }
            else {
                self.rightNode = BinaryTree(node, self)
            }
        }
    }
    func search (node: Int) -> Bool {
        if node == self.value {
            return self.count > 0
        }
        else if node < self.value {
            if let left = self.leftNode {
                return left.search(node: node)
            }
        }
        else {
            if let right = self.rightNode {
                return right.search(node: node)
            }
        }
        return false
    }
    func delete (node: Int)  {
        if node == self.value{
            self.count = self.count - 1
        }
        if node < self.value{
            if let left = self.leftNode{
                left.delete(node: node)
            }
            
        } else if node > self.value {
            if let right = self.rightNode {
                right.delete(node: node)
            }
        }
    }
}


var t = BinaryTree(25, nil)
t.insert(node: 24)
t.insert(node: 26)
t.insert(node: 1)
t.insert(node: 12)
t.search(node: 26)
t.delete(node: 26)
t.search(node: 26)


