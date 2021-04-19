//
//  Card.swift
//  Concentration
//
//  Created by datmcl on 2/23/21.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
