//
//  main.swift
//  mutating
//
//  Created by clt on 2018/8/28.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation
import PhotosUI

protocol Vehicle {
    
    var numberOfWheels: Int {get}
    
    var color:ColorTable {get set}
    
    mutating func changeColor()
    
}

struct MyCar:Vehicle {
    let numberOfWheels = 2
    
    var color = ColorTable.init()
    
    mutating func changeColor() {
        
    }
    
}


