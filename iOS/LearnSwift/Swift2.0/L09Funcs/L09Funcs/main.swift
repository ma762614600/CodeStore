//
//  main.swift
//  L09Funcs
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

//1、声明一个函数并使用
func sayHello(name:String){
    print("Hello \(name)")
}
sayHello("mengai")


//2、函数返回多个值,但必须用->指明返回参数类型列表(元组)
func getNums()->(Int,Int){
    return(2,3)
}

let (a,b) = getNums()
print(a,b)


//3、把函数当成变量使用
func sayHaHa(name:String){
    print("HaHa \(name)")
}
var fun = sayHaHa
fun("3、张三")


//4、函数的参数是可变的,用一个数组来获取它们:
func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}

print("4、\(sumOf(1,2,3,4,5))")

//5、函数的嵌套
func returnFifteen() -> Int{
    var y = 10
    func add(){
        y += 5;
    }
    add()
    return y
}

print("5、\(returnFifteen())")


//6、函数可以作为另一个函数的返回值(OC中也有类似的用法)
func makeIncrementer() -> Int -> Int{
    func addOne(number:Int) -> Int{
        return number + 1
    }
    
    return addOne
}
var increment = makeIncrementer()
print("7、\(increment(7))")

//7、函数也可以当做参数传入另一个函数
func hasAnyMatches (list: [Int],condition: Int -> Bool) -> Bool{
    print("list:\(list) , condition:\(condition)")
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen (number:Int) -> Bool{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)

//8、函数是一种特殊的闭包，可以使用{}来创建一个特使的闭包，用in来分割参数并返回类型
numbers.map({(number:Int) -> Int in
    let result = 3 * number
    return result
})


