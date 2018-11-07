//
//  main.swift
//  Sequence
//
//  Created by clt on 2018/8/28.
//  Copyright © 2018年 clt. All rights reserved.
//

import Foundation


class ReverseIterator<T>: IteratorProtocol {
    
    typealias Element = T
    
    var array:[Element]
    
    var currentIndex = 0
    
    init(array:[Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> T? {
        if currentIndex < 0 {
            return nil
        }else{
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}


struct ReverseSequence<T>:Sequence {
    
    var array:[T]
    
    init(array:[T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}


let arr = [0,1,2,3,4]

for i in ReverseSequence(array: arr){
   print("Index \(i) is \(arr[i])")
}

let names = ["Paula", "Elena", "Zoe"]

let match = names.last(where: {$0.hasSuffix("a")})



extension Sequence {
    func last(where predicate:(Iterator.Element)-> Bool) -> Iterator.Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}





