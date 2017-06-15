//
//  main.swift
//  HelloSwift3
//
//  Created by mengai on 16/7/30.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

print("Hello, World!")

//================================================================
//数据类型
//================================================================
//MARK: - 类型别名
/*重新定义类型名 类型别名*/
typealias Str = String
let ss : Str = "1"

//MARK: - 布尔型 Bool型
let typeTrue:Bool = true
//或
let typeFalse:Bool = false

//MARK: - 元组(tuples)   作为函数返回值，非常有用
// 把多个值组合成一个复合值,元组内的值可以为任意类型
let http404Error1 = (404,true,3.1415926,"Sorry! Not Found")
print("元组404error:" ,http404Error1)
//或
let http404Error2 : (Int,String) = (404,"Not Found")
/*可以将元组分解成单独的变量*/
let (errCode,errMessage) = http404Error2
/*对于不想分解的元素，可以用“_”代替*/
let (_,errCode1) = http404Error2
print("errCode1:" ,errCode1)


//MARK: - 可选变量
/*
    注意:Swift中的nil和Objective-C中的nil不一样。Swift中nil不是指针，而是一个缺省值，Objective-C中nil表示不存在的空指针。
    可选变量：如果一个变量可以有值，也可以者无值，就要把这个变量声明为可选类型
 */
var numberStr = "123"
numberStr = "HELLO,WORLD"
var numberValue : String? = numberStr;
print("可选变量:",numberValue)
//输出结果：Optional("hello,world")


//MARK: - 断言
//assert(condition,message)  如果condition为true，继续执行，false，则会触发断言，抛出异常
let personAge = 5
assert(personAge > 0, "A person's age cannot be less than zero!")


//================================================================
//MARK:字符串
//================================================================

//空字符串
var str = ""
var str1 = String();
//isEmpty
if (str.isEmpty)
{
    print("字符串:","The str is empty!","\u{72}")
}
//是否相等
if (str == str1)
{
    print("字符串:","str == str1","length \(str.characters.count)")
}

//MARK:数组
var shoppingList = ["catfish","water","bread","wine",]
print(shoppingList,shoppingList.count)



//MARK:函数
// 从第一个参数就必须指定参数名，除非使用"_"明确指出省略参数
//可以用@discardableResult告诉编译器,这个函数不需要返回值
//也可以用"_"接收函数返回值,并忽略返回值
@discardableResult
func sum(_ num1:Int , num2:Int) -> Int {
    return num1 + num2
}
//print(sum(num1: 1, num2: 2))
_ = sum(1, num2: 2)

//取消var参数
func increase ( _ a : Int) {
    var a = a
    a += 1
}


