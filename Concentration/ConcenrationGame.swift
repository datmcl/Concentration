//
//  ConcenrationGame.swift
//  Concentration
//
//  Created by datmcl on 2/23/21.
//

import Foundation

struct ConcentrationGame {
    private(set) var cards = [Card]()
    
    private var indexOneAndOnlyFaceUp: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOneAndOnlyFaceUp, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOneAndOnlyFaceUp = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "ConcentrationGame.init(\(numberOfPairs): must have at least one pair of cards)")
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
