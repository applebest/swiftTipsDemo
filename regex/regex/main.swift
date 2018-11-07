//
//  main.swift
//  regex
//
//  Created by clt on 2018/9/12.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

// 结构体
struct RegexHelper {
    //正则匹配对象
    let regex:NSRegularExpression
    
    init(_ pattern:String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input:String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
}


let mailPattern =
"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

let matcher: RegexHelper
do {
     matcher = try RegexHelper(mailPattern)
}

let maybeMailAddress = "onev@onevcat.com"

if matcher.match(maybeMailAddress) {
    print("有效的邮箱地址")
}else{
    print("无效的邮箱地址")
}


// 操作符正则匹配
precedencegroup MatchPrecedenceP{
    associativity:none   // 无运算  取none
    higherThan:DefaultPrecedence  // 优先级  default
}

// 定义中间操作符  left centerOperator right
infix operator ~=:MatchPrecedenceP


func ~=(lhs:String,rhs:String) -> Bool {
    do{
        return try RegexHelper(lhs).match(rhs)
    }catch{
        return false
    }
}

// 操作符运算
print(mailPattern ~= maybeMailAddress ? "true":"false")



