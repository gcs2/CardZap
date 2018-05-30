//
//  Stack.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/28/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

struct Stack<E> {
    var array: [E] = []
    
    mutating func push(_ newElement: E) {
        array.append(newElement)
    }
    
    mutating func pop() -> E? {
        if !array.isEmpty {
            return array.popLast()
        } else {
            return nil
        }
    }
    
    func peek() -> E? {
        if !array.isEmpty {
            return array.last
        } else {
            return nil
        }
    }
}
