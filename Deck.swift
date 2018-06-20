//
//  Deck.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/23/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

class Deck<Front: Hashable,Back> {
    var theDeck: Dictionary<Front, Back>
    var name: String
    var theSchedule: Dictionary<Front, Int>
    var todaysCards: Queue<Front>
    var dateCreated: Date
    
    init() {
        theDeck = Dictionary<Front, Back>()
        name = ""
        theSchedule = Dictionary<Front, Int>()
        todaysCards = Queue<Front>()
        dateCreated = Date()
    }
    
    func add(front key: Front,back value: Back) {
        theDeck[key] = value
        print("added a card")
        print(theDeck.count)
    }
    
    func size() -> Int {
        return theDeck.count
    }
    
    func loadTodaysCards() {
        print("loading...")
        for (key, value) in theDeck {
            todaysCards.enqueue(key)
        }
    }
    
}
