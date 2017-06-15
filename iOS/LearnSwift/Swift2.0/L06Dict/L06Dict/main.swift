//
//  main.swift
//  L06Dict
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

//初始化一个空的字典
let emptyDict = [String: Float]();
print("1、\(emptyDict)")
//or 

let empDic = [:]
print("2、\(empDic)")

var dict = ["name":"Mr Meng","age":"16"]
print(dict)

dict["sex"] = "Female"
print(dict)

//取出字典中元素
let name:String = dict["name"]!

print(name)
