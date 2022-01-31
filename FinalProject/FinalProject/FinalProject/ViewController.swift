//
//  ViewController.swift
//  FinalProject
//
//  Created by Emmanuel Almonte on 6/22/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // creates an instance of the timer class
    var timer: Timer = Timer()
    
    // Determines whether users entered a custom pattern length.
    var customPattern: Bool = false
    
    // Creates an instance of the Second Screen view controller in this project.
    let vc = ShowScoreViewController()
    
    // This is the outlet for the collection of buttons that will be used to display a random pattern.
    @IBOutlet var randomPatternButtons: [UIButton]!
    
    //This is an outlet for the button that starts the game.
    @IBOutlet var startButton: UIButton!
    
    // This is the only label on the main screen and will display to the user when to enter pattern and if they got it wrong.
    @IBOutlet var onlylabel: UILabel!
    // This will variable will determine whether the user was shown the pattern or not.
    var patternShown = false
    
    // This will determine if user got the pattern correct or not.
    var patternIsCorrect = false
    
    // This variable will contain the Pattern in which the buttons will light up and the pattern in which they have to be clicked again.
    var patternSequence: [Int] = []
    
    // This variable holds the value of what the user enters after pattern is shown.
    var userPattern: [Int] = []
    
    // This will hold the value of the maximum length of the current pattern round.
    var maxPatternLength: Int = 1
    
    // This will count in what part or section of the sequence the current round is in the pattern Sequence.
    var counter = -1
    
    // This will hold the value of the custom pattern entered on the second screen text field.
    var customPatternValue: Int = 0
        
        // creates a random pattern for the buttons
    func randomPattern(num: Int) -> [Int]{
        // holds the length of the pattern
        
        var patternRange =  1...num
        
        // adds numbers 0-3 in a list the length of the patternRange at random.
        for num in patternRange{
            patternSequence.append(Int.random(in: 0...3))
        }
        return patternSequence
    }
    
    // This will reset most of the values that are changed in each round.
    func resetGame(){
        timer.invalidate()
        maxPatternLength = 1
        startButton.isEnabled = true
        patternSequence = []
        patternShown = false
        patternIsCorrect = false
        patternSequence = []
        userPattern = []
        counter = -1
        userPattern = []
        patternSequence = []
    }
    
    // This function will create a new round if the user enters the pattern correctly.
    func newRound(){
            patternShown = false
            patternIsCorrect = false
            patternSequence = []
            userPattern = []
            counter = -1
            userPattern = []
            patternSequence = []
            randomPattern(num: maxPatternLength)
            updateScreen()
        }
    // This function is the selector in the timer and will show the pattern and if the user enters it correctly.
    @objc func updateScreen(){
        // creates an instance of the PatternButtons class at a local level.
        var mainButtons = PatternButtons(buttons: randomPatternButtons)
        
        // if the pattern was shown the following will occur.
        if patternShown == true {
            onlylabel.text = "Wait Three secs then enter pattern"
            mainButtons.enableButtons()
            startButton.isEnabled = false
            isUserPatternCorrect()
            
        }
            // if the pattern has not been completely been shown then the following will occur.
        else{
            onlylabel.text = "Pattern is Being shown"
            mainButtons.disableButtons()
            showPattern()
            startButton.isEnabled = true
            
        }
    }
    // this will check if the array of user clicked buttons and the patternSequence are the same.
    func isUserPatternCorrect(){
        // This allows for the function to check until the user clicked buttons list reaches the amount of items in the patternSequence.
        if userPattern.count < patternSequence.count{
            
        }
        else{// Then it checks if it is the same or not.
            if userPattern == patternSequence{
                patternIsCorrect = true
                maxPatternLength += 1
                newRound()
                
            }
            else{
                onlylabel.text = "Wrong Pattern"
                startButton.titleLabel?.text = "Go To Settings"
                timer.invalidate()
            }
        }
    }
    
    // When user goes back from the settings they will decide whether to play a normal game or a custom game.
    override func viewWillAppear(_ animated: Bool) {
        var mainButtons = PatternButtons(buttons: randomPatternButtons)
        mainButtons.disableButtons()
        if customPattern == true{
            resetGame()
            maxPatternLength = customPatternValue
            randomPattern(num: customPatternValue)
        }
        else{
            resetGame()
            randomPattern(num: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 7
    }
    
    // starts the pattern once the user presses the start Button.
    @IBAction func startButtonClicked(_ sender: UIButton) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: (#selector(ViewController.updateScreen)), userInfo: nil, repeats: true  )
    }
    
    // This function will show which button the user clicked and also adds the buttons clicked to the userPatterns array.
    @IBAction func PatternButtonsPressed(_ sender: UIButton) {
        // adds the pattern the user entered into the array userPattern.
        userPattern.append(Int(sender.currentTitle!)!)
        
        // creates an instance of the Pattern Buttons class
        var mainButtons = PatternButtons(buttons: randomPatternButtons)
        mainButtons.disableButtons()
        
        //Lets the user know when they click a button.
        switch sender.currentTitle {
        case "0":
            mainButtons.ButtonsBorder()
            sender.layer.borderWidth = 1
            sender.layer.borderWidth = 1
        case "1":
            mainButtons.ButtonsBorder()
            sender.layer.borderWidth = 1
        case "2":
            mainButtons.ButtonsBorder()
            sender.layer.borderWidth = 1
        case "3":
            mainButtons.ButtonsBorder()
            sender.layer.borderWidth = 1
        default:
            mainButtons.ButtonsBorder()
            sender.layer.borderWidth = 0
        }
    }
    // this shows the pattern of buttons users have to click on
    func showPattern(){
        var mainButtons = PatternButtons(buttons: randomPatternButtons)
        mainButtons.disableButtons()
        counter += 1
        startButton.isEnabled = false
        if counter >= patternSequence.count{
            mainButtons.ButtonsBorder()
            patternShown = true
        }
        else{
            if randomPatternButtons[patternSequence[counter]].layer.borderWidth == 10{
                randomPatternButtons[patternSequence[counter]].layer.borderWidth = 5
            }
            else{
                mainButtons.ButtonsBorder()
                randomPatternButtons[patternSequence[counter]].layer.borderWidth = 10
            }
        }
    }
    
    // This will pass the score and round data to the second page through the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreScreen = segue.destination as? ShowScoreViewController
        scoreScreen?.scoreText = ("\((maxPatternLength - 1) * 100)")
        scoreScreen?.roundText = ("\(maxPatternLength - 1)")
    }
    // Unwinds to the main Screen
    @IBAction func unwindToHomeScreen(unwindSegue: UIStoryboardSegue){
    }
}
