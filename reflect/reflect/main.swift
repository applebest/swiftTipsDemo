//
//  main.swift
//  reflect
//
//  Created by clt on 2018/9/19.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

struct Person {
    let name:String
    let age:Int
}

let xiaoMing = Person(name: "xiaoMing", age: 16)

let r = Mirror(reflecting: xiaoMing)

print("小明是\(r.displayStyle ?? Mirror.DisplayStyle.optional)类型")
