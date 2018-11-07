//
//  main.swift
//  kvo
//
//  Created by clt on 2018/9/25.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

class MyClass: NSObject {
    @objc dynamic var date = Date()
}

class MyClass1: NSObject {
    var date = Date()
}

class MyChildClass: MyClass1 {
    @objc dynamic override var date: Date {
        get { return super.date }
        set { super.date = newValue }
    }
}

private var myContext = 0

class AnotherClass: NSObject {
    var myObject: MyClass!
    var observation: NSKeyValueObservation?
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 AnotherClass，当前日期: \(myObject.date)")
        observation = myObject.observe(\MyClass.date, options: [.new]) { (_, change) in
            if let newDate = change.newValue {
                print("AnotherClass 日期发生变化 \(newDate)")
            }
        }
        
    }
}


