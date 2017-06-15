//
//  main.swift
//  L04Strings
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

var i:Int = 200

var str = "hello "
str += "world"

str = "\(str) \(i)"

print(str)



var optionalString: String? = "hello"
print(optionalString == nil)


var optionalName: String? = "John"
print(optionalName)
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello,\(optionalName)"
}
print("greeting = \(greeting)")


//------------字符串---------------
//拼接字符串一
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

//拼接字符串二
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(fruitSummary)


//experiment
let age:Float = 26.5
let name = "Mr Meng"
let info = "\(name)'s age is \(age)"
print(info)


