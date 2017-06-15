//
//  main.swift
//  L05Array
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

//初始化一个空的数组
let emptyArray = [Sting]()
//or
let empArr = []






var shopList = ["catfish","water","tulips","blue paint"]
print("1 、\(shopList)");

shopList[1] = "bottle of water"
print("2 、\(shopList)");





var word:String = "word";

var arr = ["string",100,word,2.3]

print(arr)



//声明一个空的数组
var arr2 = []

//声明一个只可以存放特定类型的数组
var arr3 = [String]()//arr3只能存放字符串

//arr3 = ["String","Hello","World"]//正确
//arr3 = ["string",100] //报错