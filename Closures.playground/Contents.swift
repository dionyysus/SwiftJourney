import UIKit

let array = [6,2,3,9,4,1]



//long way
let newArray = array.map { (n1) in
    return  n1 + 1
}

//short way
let newArray2 = array.map {$0 + 1}

let newArray3 = array.map{"\($0)"}

print(newArray)
print(newArray2)
print(newArray3)
