//
//  Game.swift
//  ApplePieProject
//
//  Created by Stefano Casafranca Laos on 10/9/24.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    //Storing the CORRECT guessed letters in an array
    var guessedLetters: [Character]
    
    //Function that decrease the apples in tree if letter wrong

    mutating func playerGuessed(letter:Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
    
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {            
                guessedWord += "_"
            }
        }
        return guessedWord
        
    }
}
