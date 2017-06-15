//
//  main.swift
//  L07Loop
//
//  Created by mengai on 16/1/12.
//  Copyright © 2016年 Meng. All rights reserved.
//

import Foundation

//循环一
//for index in 0..10{
//    arr.append("Item\(index)")
//}

//循环二
//for value int arr
//{
//    print(value)
//}

let individualScores = [75 , 43, 103, 87, 12]
var teamScore = 0
for var sorces in individualScores{
    if sorces > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

/*************************************/
let interestingNumbers = [
    "Prime":[2, 3, 5, 7, 11, 13],
    "Fibonacci":[1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25]
]

var largest = 0

for (kind,numbers) in interestingNumbers {
    print("\(kind) :",numbers)
    for number in numbers{
        print("\(kind):\(number)")
        if number > largest{
            largest = number
        }
    }
}

print(largest)
/*************************************/









