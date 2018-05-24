//
//  Deck.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/23/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import Foundation

class Deck<Front: Hashable,Back> {
    var theDeck = Dictionary<Front, Back>()
    var name: String = ""
    
    func add(front key: Front,back value: Back) {
        theDeck[key] = value
    }
}
