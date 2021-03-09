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
    
    lazy var game = ConcentrationGame(numberOfPairs:(btnCollection.count + 1) / 2)

//  Add number of taps on change:
    var taps = 0 {
        didSet{
            tapsLabel.text = "Taps: \(taps)"
        }
    }

    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
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
    
    var emojiDictionary = [Int: String]()
    
    var emojiCollection = ["😺", "👾", "👻", "🦔", "🐝", "🐱", "🦊", "🦁", "🐭", "🐨", "🦉", "🐺"]
    
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet var btnCollection: [UIButton]!
    
    @IBAction func btnAction(_ sender: UIButton) {
        taps += 1
//      If value exist:
        if let btnIndex = btnCollection.firstIndex(of: sender) {
            game.chooseCard(at: btnIndex)
            updateViewFromModel()
        }
    }
    
}
