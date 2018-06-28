//
//  Deck.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/23/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

class Deck<Front: Card<String>,Back: Card<String>> {
    var theDeck: Dictionary<Front, Back>
    var name: String
    var theSchedule: Dictionary<Front, Int>
    var todaysCards: Queue<Front>
    var unseenCards: Queue<Front>
    var missedCards: Queue<Front>
    var dateCreated: Date
    var schedule: [Queue<Front>]
    
    init() {
        theDeck = Dictionary<Front, Back>()
        name = ""
        theSchedule = Dictionary<Front, Int>()
        dateCreated = Date()
        todaysCards = Queue<Front>()
        missedCards = Queue<Front>()
        unseenCards = Queue<Front>()
        schedule = [Queue<Front>]()
    }
    
    func add(front key: Front,back value: Back) {
        theDeck[key] = value
        print("added a card")
        print(theDeck.count)
    }
    
    func get(front key: Front) -> Back? {
        return theDeck[key]
    }
    
    func size() -> Int {
        return theDeck.count
    }
    
    func loadUnseenCards() {
        print("loading...")
        for (key, _) in theDeck {
            unseenCards.enqueue(key)
            print("unseenCardsSize: " + String(unseenCards.size()) + " for " + key.theContent)
        }
    }
    
    func getTodaysCards() -> Queue<Front>? {
        return todaysCards
    }
    
    func getUnseenCards() -> Queue<Front>? {
        return unseenCards
    }
    
    func getMissedCards() -> Queue<Front>? {
        return missedCards
    }
    
}
