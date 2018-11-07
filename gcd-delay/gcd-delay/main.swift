//
//  main.swift
//  gcd-delay
//
//  Created by clt on 2018/9/23.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation


let workingQueue = DispatchQueue(label: "moy_queue")
print(workingQueue)
workingQueue.async {
    print("工作")
    Thread.sleep(forTimeInterval: 2)
    DispatchQueue.main.async {
        print("结束 ，更新UI")
    }
}

let time:TimeInterval = 2.0
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
    print("2秒后输出")
}


typealias Task = (_ cancel:Bool) -> Void

func delay(_ time:TimeInterval,task:@escaping ()->()) -> Task? {
    
    func dispatch_later(block:@escaping ()->()){
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure:(()->Void)? = task
    var result:Task?
    let delayedClosure:Task = { cancel in
        if let internalClosure = closure {
            if cancel == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

func cancel(_ task:Task?){
    task?(true)
}

let task =   delay(2) {print("2 秒后输出")}

cancel(task)

let data = NSData()


let name = type(of: data)
print(name);

