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
    var guessedLetters: [Character]//Storing the CORRECT guessed letters in an array
    mutating func playerGuessed(letter:Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
        //Function that decrease the apples in tree if letter wrong
}
