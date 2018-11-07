//
//  main.swift
//  where
//
//  Created by clt on 2018/9/23.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

let name = ["王小二","张三","李四","王二小"]
name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x)是笔者本家")

    default:
        print("\($0) 不h包含 <王>")
    }
}

let num : [Int?] = [49,99,nil]
// 过滤nil 值
let n = num.compactMap{$0}
print(n)
// 循环方式1 筛选大于60分的
for score in n where score > 60 {
    print("\(score) 大于 60")
}

// 循环方式2 获取下标和内容
for (index,item) in n.enumerated() where item > 60 {
    print("\(item) 大于 60 , index为\(index)")
}

// num？
num.forEach{
    // 解包 并 筛选
    if let score = $0, score > 60 {
        print("筛选true")
    }else{
        print("筛选false")
    }
}


let sortableArray: [Int] = [3,1,2,4,5]


print(sortableArray.sorted())

