//
//  main.swift
//  L08Flow
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation


let vegetable = "red pepper"
var vegetableComment:String? = nil
print(vegetableComment)
switch vegetable{
case "celery" :
    vegetableComment = "Add some raisins and make ants on a log."
    print(vegetableComment)
case "cucumber","watercress":
    vegetableComment = "That would make a good tea sandwich."
    print(vegetableComment)
case let x where x.hasSuffix("pepper"):
    vegetableComment = "Is it a spicy \(x)?"
    print(x);
default:
    vegetableComment = "Everything tastes good in soup."
    print(vegetableComment)
}