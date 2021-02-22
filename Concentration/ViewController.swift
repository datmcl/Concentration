//
//  ViewController.swift
//  Concentration
//
//  Created by datmcl on 2/22/21.
//

import UIKit

class ViewController: UIViewController {

//  Add number of taps on change:
    var taps = 0 {
        didSet{
            tapsLabel.text = "Taps: \(taps)"
        }
    }
//  Flip button
    func flipBtn(emoji: String, btn: UIButton) {
        if btn.currentTitle == emoji {
            btn.setTitle(nil, for: .normal)
            btn.backgroundColor = #colorLiteral(red: 0.6879627705, green: 0.3182561696, blue: 0.8859367967, alpha: 1)
        } else {
            btn.setTitle(emoji, for: .normal)
            btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    let emojiCollection = ["😺","👾","😺","👾"]
    
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet var btnCollection: [UIButton]!
    
    @IBAction func btnAction(_ sender: UIButton) {
        taps += 1
//      If value exist:
        if let btnIndex = btnCollection.firstIndex(of: sender) {
            flipBtn(emoji: emojiCollection[btnIndex], btn: sender)
        }
    }
    
}

