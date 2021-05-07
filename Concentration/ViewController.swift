//
//  ViewController.swift
//  Concentration
//
//  Created by datmcl on 2/22/21.
//

import UIKit

// I will use this later
extension String{
    static func randomEmoji() -> String{
        let range = [UInt32](0x1F601...0x1F64F)
        let ascii = range[Int(drand48() * (Double(range.count)))]
        let emoji = UnicodeScalar(ascii)?.description
        return emoji!
    }
}

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairs: numberOfPairs)
    
// Using getter
    var numberOfPairs: Int {
        return (btnCollection.count + 1) / 2
    }

//  Add number of taps on change:
    private(set) var taps = 0 {
        didSet{
            tapsLabel.text = "Taps: \(taps)"
        }
    }

    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            let randomStringIndex = emojiCollection.index(emojiCollection.startIndex, offsetBy: emojiCollection.count.arc4randomExtension)
            emojiDictionary[card] = String(emojiCollection.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in btnCollection.indices {
            let btn = btnCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                btn.setTitle(emojiIdentifier(for: card), for: .normal)
                btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                btn.setTitle(nil, for: .normal)
                btn.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.6879627705, green: 0.3182561696, blue: 0.8859367967, alpha: 1)
            }
        }
    }
    
    private var emojiDictionary = [Card: String]()
    
//    private var emojiCollection = ["😺", "👾", "👻", "🦔", "🐝", "🐱", "🦊", "🦁", "🐭", "🐨", "🦉", "🐺"]
    private var emojiCollection = "😺👾👻🦔🐝🐱🦊🦁🐭🐨🦉🐺"
    
    @IBOutlet private weak var tapsLabel: UILabel!
    @IBOutlet private var btnCollection: [UIButton]!
    
    @IBAction private func btnAction(_ sender: UIButton) {
        taps += 1
//      If value exist:
        if let btnIndex = btnCollection.firstIndex(of: sender) {
            game.chooseCard(at: btnIndex)
            updateViewFromModel()
        }
    }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
