//
//  ViewController.swift
//  ApplePieProject
//
//  Created by Stefano Casafranca Laos on 9/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var currentGame : Game!
    
    var listOfWords = ["anna", "lilsupa", "apache", "canserbero", "charlotte"]

    let incorrectMovesAllowed = 7

    //RESETERS
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    
    
    
    
    func newRound(){
        
        /*//Before the last part
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed,guessedLetters: [])
        updateUI()*/
    
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
       
    }
        
     
    //Last Function
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
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
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {        totalWins += 1
        } else {
            updateUI()
        }
        
       
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
        //updateUI()
        updateGameState()
        
        
        
    }
    
}
    

