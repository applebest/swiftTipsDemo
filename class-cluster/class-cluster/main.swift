//
//  main.swift
//  class-cluster
//
//  Created by clt on 2018/9/25.
//  Copyright © 2018年 clt. All rights reserved.
//

import PhotosUI

// 抽象类
class Drinking {
    typealias LiquidColor = ColorSpec
    var color:LiquidColor {
        return LiquidColor(value: 1, rgb: RGBColor.init(red: 2, green: 4, blue: 1))
    }
    
    class func drinking(name:String) -> Drinking {
        var drinking:Drinking = Drinking()
        switch name {
        case "Coke":
            drinking = Coke()
            
        case "Beer":
            drinking = Beer()
            
        default: break
            
        }
        return drinking
    }

}


// 具体类coke
class Coke: Drinking {
    
    override var color: Drinking.LiquidColor{
        return LiquidColor(value: 3, rgb: RGBColor(red: 23, green: 13, blue: 44))
    }
    
}

// 具体类Beer
class Beer: Drinking {
    
    override var color: Drinking.LiquidColor{
        return LiquidColor(value: 4, rgb: RGBColor(red: 23, green: 13, blue: 44))
    }
}


// 类簇生成
let coke = Drinking.drinking(name: "Coke")
print (coke.color)

let beer = Drinking.drinking(name: "Beer")
print (beer.color)


let cokeClassName = type(of: coke)
print(cokeClassName)

let beerClassName = type(of: beer)
print(beerClassName)





