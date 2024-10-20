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
        /*BEFORE SEPARATING THE "_"
        //Using the Computed property in Game
        correctWordLabel.text = currentGame.formattedWord
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        //Changing theimage synced with the number of tries
        treeImageView.image = UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")*/

        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins),         Losses: \(totalLosses)"
        treeImageView.image = UIImage(named:        "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
           //crashes cause the button returns nil //BUTTONS WHERE ON PLAIN PLAIN INSTEAD OF DEFAULT - PLAIN
        let letterString = sender.title(for: .normal)!
        
        
        // Converter from Letter STRING to Character

        let letter = Character(letterString.lowercased())
        
        // Call the function puting inside the letter we pressed
        currentGame.playerGuessed(letter: letter)
        
        //Call the function that changes picture and score
        updateUI()
    }
    
}

