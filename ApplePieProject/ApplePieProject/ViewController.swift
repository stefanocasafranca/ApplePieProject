//
//  ViewController.swift
//  ApplePieProject
//
//  Created by Stefano Casafranca Laos on 9/24/24.
//

import UIKit

var listOfWords = ["canserbero", "lilsupa", "apache", "maup", "vintageculture"]

let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0



class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    
    var currentGame : Game!
    //Page 420
    
    func newRound(){
        
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }

    
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")
    }
}

