//
//  main.swift
//  L10OO
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

//定义一个Hi对象
class Hi {
    //在Hi对象中定义一个sayHi函数
    func sayHi(){
        print("Hi Swift")
    }
}
//初始化一个Hi对象hi
var hi = Hi()
//调用该hi对象中的sayHi函数
hi.sayHi()


//对象的继承
class Hello:Hi{
    
    var _name:String
    
    init(name:String) {
        print("init hello")
        self._name = name
    }
    
    func sayHello(){
        print("Hello Swift")
    }
    
    override func sayHi() {
        print("override \(self._name)")
    }
}

var hello = Hello(name: "zhangsan")
hello.sayHi()
hello.sayHello()

