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
    }
    
    
    

    
    @IBAction func userMakesAGuess(sender: AnyObject) {
        if userGuess.text == hiddenWord {
            print("You Win!")
        }
        
        
    }

}

