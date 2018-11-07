//
//  main.swift
//  swiftTipe4
//
//  Created by clt on 2018/8/28.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation

func addOne(num:Int) -> Int{
    return num + 1
}

// adder 传参  return 闭包  { num in  num + adder  }
func addTo(_ adder:Int) -> (Int) -> Int {
    // 简写闭包
    return {$0 + adder}
}

let addTwo = addTo(2)
let result = addTwo(6)
print("结果:\(result)")


// 协议接口
protocol TargetAction {
    
    func performAction()
}

// 调用包装
struct TargetActionWrapper<T:AnyObject>:TargetAction {
    // 调用者
    weak var target:T?
    // 调用闭包
    let action:(T) -> () -> ()
    
    func performAction() {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    
    var actions = [ControlEvent:TargetAction]()


      func setTarget<T: AnyObject>(target: T,
                                       action: @escaping (T) -> () -> (),
                                       controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(
            target: target, action: action)
    }

     func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
  
     func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
        
    }
    
    func log()  {
        print("调用log")
    }
 
    
    
}


let c = Control()

// 设置target  ->  OC: addTarget:id  action:SEL Event:EventControl
c.setTarget(target: c, action: { (c) -> () -> () in

    //
    return  {
         c.log()
    }
    
}, controlEvent: .TouchUpInside)

// 调用
c.performActionForControlEvent(controlEvent: .TouchUpInside)




