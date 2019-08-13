import Foundation

var hoge: String = "hoge"
let fuga: String = "fuga"

hoge = "hogehoge"

let piyo = "piyo"

let any:Any = "hinumasan \(hoge)"
print(any)

func getHoge(from fuga: String) -> String {
    return "hoge"
}
print(getHoge(from: "somewhere"))

func getFuga(_ fuga: String) -> String {
    return "fuga"
}
print(getFuga("somewhere"))


// class

class Dog {
    let name :String
    
    init(name: String) {
        self.name = name
    }
    
    func bark() {
        print("wan wan \(name) da wan")
    }
}

let pochi = Dog(name: "pochi")
pochi.bark()

// struct

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

let coordinate = Coordinate(latitude: 35, longitude: 1)

// array

let array = ["a", "b"]
print(array[1])

// dictionary = 連想配列

let dictionay = ["name": "hiro", "age": 20] as [String : Any]
print(dictionay["age"])

// Protocol = interface

protocol Animal {
    var name: String { get }
    
    func walk()
}

class Cat : Animal {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    func walk() {
        print("sorori")
    }
}

let cat = Cat(name: "tama")

// enum
enum MyColor {
    case red
    case blue
    case green
}
let mycolor: MyColor = MyColor.green

switch mycolor {
case .red:
    print("red")
case .blue:
    print("blue")
case .green:
    print("green")
}


// 3

// if


var nilable: String? = ""
if 1 > 0 || 3 >= 1 {
    
} else if 1 < 2 && 2 < 1 {
    
} else {

}

var state = true
print(state ? "t" : "f")

// guard

let count = 10
func printCountIfNeeded(count: Int){
    guard count > 10 else {
        return // return, continue, break, throw を入れないといけない
    }
    print(count);
}

// for

let fruits = ["apple", "orange"]
for fruit in fruits {
    print(fruit)
}

for i in 1...5 {
    if i < 3 {
        print(9-i)
    }
}

var i: Int = 0
while i < 1 {
    
}

fruits.forEach { (fruit) in
    print(fruit)
}

fruits.map { (fruit) -> String in
    "a delicious " + fruit
}

// optional

var nilable2: String? = nil

// unwrtap

// if let

let optionalStr: String? = "hoge"
if let str = optionalStr {
    print(str)
}

let optionalStr2: String? = "hoge"
if let str = optionalStr,
    let str2 = optionalStr2 {
    print(str, str2)
}

guard let string1 = nilable else { fatalError() }

// ?? evaluator

print(optionalStr ?? "txt printed when nil")

// ! force unwrap
print(optionalStr!)

print(optionalStr?.hashValue)

// implicit unwrap

let a: Int! = 1
print(a + 1)

// let a: Int? = 1
// print(a! + 1) と同じ


// do catch

//func hoge1() throws {
//    throw Error;
//}

//do {
//    try hoge1()
//} catch {
//
//}
//
//try! hoge1()
//try? hoge1()

// property

//var hundread: Int {
//    10 * 10
//}

//var farenheight = {
//    get {
//
//    }
//    set {
//
//    }
//    willSet {
//
//    }
//    didSet {
//
//    }
//}


let myarray: [String] = []


struct Repository {
    let name: String
}
    


import UIKit

struct Repositry {
    let name: String
}

protocol GitHubAPIDelegate: AnyObject {
    func githubAPI(_ api:GitHubAPI, didFetchRepositories repositories: [Repositry])
}

class GitHubAPI {
    
    weak var delegate: GitHubAPIDelegate?
    
    func search(keyword: String) {
        // 2
        // APIたたく
        delegate?.githubAPI(self, didFetchRepositories: [])  // 3
    }
}

class RepositoryViewController: UIViewController, GitHubAPIDelegate {
    
    let api = GitHubAPI()
    var repositories: [Repositry] = [] {
        didSet {
            // 再描画
            //            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.delegate = self
        api.search(keyword: "Swift") // 1
    }
    
    func githubAPI(_ api: GitHubAPI, didFetchRepositories repositories: [Repositry]) {
        // 4
        self.repositories = repositories
    }
}
