//
//  Card.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 6/25/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

class Card<Content:Hashable>: Hashable {
    var hashValue: Int
    var theContent: Content
    var history: [Int]
    
    public var description: String { return (theContent as? String)!}
    
    init(_ someContent: Content) {
        theContent = someContent
        history = [Int]()
        hashValue = theContent.hashValue
        print("card added")
    }
    
    static func == (lhs: Card<Content>, rhs: Card<Content>) -> Bool {
        return lhs.theContent == rhs.theContent
    }
    
    func editContents(_ newContent: Content) {
        theContent = newContent
    }
    
    func addRepetition(_ rating: Int) {
        history.append(rating)
    }
    
    func numRepetitions() -> Int {
        return history.count
    }
    
}
