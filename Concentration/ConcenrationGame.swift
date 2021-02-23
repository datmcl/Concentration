//
//  ConcenrationGame.swift
//  Concentration
//
//  Created by datmcl on 2/23/21.
//

import Foundation

class ConcentrationGame {
    var cards = [Card]()
    
    var indexOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            
        }
    }
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
}
