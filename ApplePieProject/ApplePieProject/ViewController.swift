//
//  ViewController.swift
//  ApplePieProject
//
//  Created by Stefano Casafranca Laos on 9/24/24.
//

import UIKit

var listOfWords = ["canserbero", "lilsupa", "apache", "anna", "charlotte"]

let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0



class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    var currentGame : Game!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    
    

    func newRound(){
        
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed,guessedLetters: [])
        updateUI()
    }

    
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        
        /*guard let letterString = sender.title(for: .normal) else {
                print("Button title is nil!")
                return
            }*/
        
       let letterString = sender.title(for: .normal)!
        
        
        let letter = Character(letterString.lowercased()) // Converter from Letter STRING to Character
        currentGame.playerGuessed(letter: letter) // Call the function puting inside the letter we pressed
        updateUI() // Call the function that changes picture and score
    }
    
}

