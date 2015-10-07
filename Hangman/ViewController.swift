//
//  ViewController.swift
//  Hangman
//
//  Created by Student on 10/7/15.
//  Copyright © 2015 Charles Findlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var wordToGuessLabel: UILabel!
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var pastGuesses: UILabel!
    
    @IBOutlet weak var makeAGuessButton: UIButton!
    @IBOutlet weak var gameOutcome: UILabel!
    @IBOutlet weak var playerCountdown: UILabel!
    
    let wordList = ["computer", "winsome", "felicity", "hack", "caffeine", "marvelous", "successful", "vampire", "kraken"]
    
    
    var hiddenWord = ""
    var hiddenWordLetter: [Character] = []
    var guessedLetters: [Character] = []
    
    var count = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGame()
    }
    
    
    func setupGame() {
        gameOutcome.hidden = true
        let unsignedRandomNumber = arc4random_uniform(UInt32(wordList.count))
        hiddenWord = wordList[Int(unsignedRandomNumber)]
        pastGuesses.text = "Past Guesses"
        
        playerCountdown.text = String(count)
        hiddenWordLetter = Array(hiddenWord.characters)
        //print(hiddenWordLetter)
        wordToGuessLabel.text = ""
        pastGuesses.text = ""
        for _ in hiddenWordLetter {
            wordToGuessLabel.text = "___  \(wordToGuessLabel.text!)"
        }
        
    }
    
    
    func displayWord(userGuess: Character) {
        wordToGuessLabel.text = ""
        for letter in hiddenWordLetter {
            if guessedLetters.contains(letter) {
                wordToGuessLabel.text = "\(wordToGuessLabel.text!)  \(letter)"
                // if letter belongs in that spot, print letter!
            } else {
                wordToGuessLabel.text = "\(wordToGuessLabel.text!)  ___"
                // else run through loop until letter is in correct spot!
            }
        }
    }

    
    @IBAction func userMakesAGuess(sender: AnyObject) {
        pastGuesses.text = "\(userGuess.text!)  \(pastGuesses.text!)"
        if userGuess.text?.characters.count > 1 {
            if userGuess.text == hiddenWord {
                gameOutcome.text = "You Win!"
                gameOutcome.hidden = false
            } else {
                gameOutcome.text = "You choose ...poorly. You're dead. So sad."
                gameOutcome.hidden = false
                count = 0
                playerCountdown.text = String(count)
                makeAGuessButton.enabled = false
                
            }
        }
        else if hiddenWordLetter.contains(Character(userGuess.text!)) {
            //print("Good guess, champ!")
            guessedLetters.append(Character(userGuess.text!))
            displayWord(Character(userGuess.text!))
            userGuess.text = ""
        } else {
            guessedLetters.append(Character(userGuess.text!))
            guessCountdown()
            userGuess.text = ""
        }
    }
    
    func guessCountdown() {
        count--
        if count == 0 {
            gameOutcome.text = "The man is dead, Jim!"
            gameOutcome.hidden = false
            makeAGuessButton.enabled = false
        } else {
            playerCountdown.text = String(count)
        }
    }

}

