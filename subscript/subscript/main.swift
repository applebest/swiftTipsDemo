//
//  main.swift
//  subscript
//
//  Created by clt on 2018/9/4.
//  Copyright © 2018年 clt. All rights reserved.
//   根据下标获取对应的值  可自己定义规则subscript

import Foundation

var arr = [1,2,3]
print(arr[2])

arr[2] = 4
print(arr[2])

var dic = ["cat":"meow", "goat":"mie"]
print(dic["cat"] ?? "")
dic["cat"] = "miao"
print(dic["cat"] ?? "")



extension Array {
    subscript(first: Int, second: Int, others: Int...) -> ArraySlice<Element> {
        get {
            
//            assert(self[first] as! Bool && self[second] as! Bool, "不存在")
            assert(first < self.count && second < self.count,"Index out of range")
            var result = ArraySlice<Element>()
            result.append(self[first])
            result.append(self[second])
            for i in others {
                assert(i < self.count,"Index out of range")
                result.append(self[i])
            }
            
            return result
        }
        set {
            var input = [Int]()
            input.append(first)
            input.append(second)
            input.append(contentsOf: others)
            for (index, i) in input.enumerated() {
                assert(i < self.count,"Index out of range")
                self[i] = newValue[index]
            }
        }
    }
    
}

arr = [1,4]
print(arr[1,1])

arr[1,1] = [0,0]
print(arr)

