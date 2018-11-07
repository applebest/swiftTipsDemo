//
//  main.swift
//  operator
//
//  Created by clt on 2018/9/4.
//  Copyright © 2018年 clt. All rights reserved.
//   重载操作符与自定义操作符

import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)

func +(left:Vector2D,right:Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x,y: left.y + right.y)
}

func -(left:Vector2D,right:Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x,y: left.y - right.y)
}

/*
 前置运算符    prefix
 中间运算符    infix
 后置运算符    postfix
 */
prefix func -(vector:Vector2D)-> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

// 后置：返回2次方
postfix operator  ^

postfix func ^ ( vector: Int) -> Int {
    return vector * vector
}

//中间：计算N的M次方，左结合，优先级为255
precedencegroup Power{
    associativity:left
    higherThan:AdditionPrecedence
}

infix operator ^^:Power
func ^^(left: Double, right: Double) -> Double {
    return pow(left, right)
}


print(2 ^^ 10 - 2 ^^ 3)  // 1024 － 8 ＝ 1016


let v4 = v1 + v2
print("+号\(v4)")
let v5 = v1 - v2
print("-号\(v5)")

let v6 = -v5
print("负号\(v6)")

print(5^)


// 定义优先级
precedencegroup DotProductPrecedence{
    // 运算先后顺序 none , left, right
    associativity:none
    // 优先级
    higherThan: MultiplicationPrecedence
}
// 定义操作类型
infix operator +*:DotProductPrecedence

func +*(left:Vector2D,right:Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

let result = v1 +* v2
print(result)



