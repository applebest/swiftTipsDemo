//
//  main.swift
//  func-params
//
//  Created by clt on 2018/9/4.
//  Copyright © 2018年 clt. All rights reserved.
//  函数修饰

import Foundation


// 默认为 func incrementor1(variable: let Int) -> Int
func incrementor1( variable: Int) -> Int {
    return variable + 1
}



let a = incrementor1(variable: 4)

func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

var luckyNumber = 7
let newLuckyNumber = incrementor2(variable: luckyNumber)

print("old lucky is \(luckyNumber), new lucky is \(newLuckyNumber)")


func incrementor3(variable: inout Int) {
    variable += 1
}

incrementor3(variable: &luckyNumber)
print(luckyNumber)


func makeIncrementor(addNumber:Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable + addNumber
    }
    return incrementor
}

var input = 10
let incrementor = makeIncrementor(addNumber: 2)
incrementor(&input)
print(input)
