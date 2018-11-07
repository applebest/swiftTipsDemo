//
//  main.swift
//  init
//
//  Created by clt on 2018/9/12.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation


class Cat {
    
    var name:String
    init() {
        name = "cat"
    }
    
}

class Tiger: Cat {
    
    let power:Int
   override init() {
        power = 1
        super.init()
        name = "tiger"
    }
}


class Cat1{
    var name:String
    init() {
        name = "cat1"
    }
}






class Tiger1: Cat1 {
    let power:Int
    override init() {
        power = 1
        // 如果我们不需要打改变 name 的话，
        // 虽然我们没有显式地对 super.init() 进行调用
        // 不过由于这是初始化的最后了，Swift 替我们自动完成了
    }
    
}


let cat = Cat1()
print("name:\(cat.name)")

let tiger = Tiger1()
print("name:\(tiger.name) power:\(tiger.power)")





#if swift(>=1.0)

print("1")

#else

print("11");

#endif

