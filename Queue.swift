//
//  Queue.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/28/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

struct Queue<E> {
    var array: [E] = []
    
    mutating func enqueue(_ newElement: E) {
        array.append(newElement)
    }
    
    mutating func dequeue() -> E? {
        if !array.isEmpty {
            return array.removeFirst()
        } else {
            return nil
        }
    }
    
    func get() -> E? {
        return array.first
    }
    
    func peek() -> E? {
        return array.first
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
