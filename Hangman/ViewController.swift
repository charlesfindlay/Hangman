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
    
    
    
    let wordList = "computer"
    
    
    var hiddenWord = ""
    var hiddenWordLetter: [Character] = []
    var guessedLetters: [Character] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGame()
    }
    
    
    func setupGame() {
        hiddenWord = wordList
        pastGuesses.text = "Past Guesses"
        hiddenWordLetter = Array(hiddenWord.characters)
        print(hiddenWordLetter)
        wordToGuessLabel.text = ""
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
        if userGuess.text == hiddenWord {
            print("You Win!")
        }
        
        if hiddenWordLetter.contains(Character(userGuess.text!)) {
            print("Good guess, champ!")
            guessedLetters.append(Character(userGuess.text!))
            displayWord(Character(userGuess.text!))
        }
        
        
    }

}

