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
            if let matchingIndex = indexOneAndOnlyFaceUp, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUp = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUp = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
}
