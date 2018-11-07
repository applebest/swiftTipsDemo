//
//  main.swift
//  enumerate
//
//  Created by clt on 2018/9/25.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

let arr: NSArray = [1,2,3,4,5]
var result = 0

arr.enumerateObjects { (num, idx, stop) in
    result += num as! Int
    if idx == 2{
        stop.pointee = true
    }
}
print(result)


result = 0
for (idx,item) in arr.enumerated() {
    
    result += item as! Int
    if idx == 2{
        break
    }
}

print(result)


func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

for _ in 0...100 {
    let range = Range<Int>(1...6)
    print(random(in: range))
}
