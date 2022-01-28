//
//  ViewController.swift
//  Game Clock
//
//  Created by Emmanuel Almonte on 6/10/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Timer for the top clock
    @objc var topTimer: Timer = Timer()
    //Timer for the top clock
    @objc var bottomTimer: Timer = Timer()
    
    //variable for the amount of time left for the top cock
    var bottomTimeLeft = 30
    //variable for the amount of time left for the bottom clock
    var topTimeLeft = 30
    
    //The top game clock will display the top time
    @IBOutlet var topClock: UILabel!
    //The bottom game clock label will display the bottom time
    @IBOutlet var bottomClock: UILabel!
    
    // This is the top button label and will let users know if they ran out of time
    @IBOutlet var topButtonLabel: UILabel!
    //This is the bottom button label and will let user know if they ran out of time
    @IBOutlet var bottomButtonLabel: UILabel!
    // this will determine which button is clicked
    // this will determine which button is touched during the game. 1 is button one and 2 is button 2
    var gameStarted1 = 0
    var gameStarted2 = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topClock.text = String(topTimeLeft)
        bottomClock.text = String(bottomTimeLeft)

        
    }
    // this will determine what changes depending on which button is clicked
    @objc func updatedTimer(){
        if gameStarted1 == 1 && gameStarted2 == 0{
            bottomTimeLeft -= 1
            bottomClock.text = String(bottomTimeLeft)
            bottomButtonLabel.text = ""
            topButtonLabel.text = "Clicked"
            if bottomTimeLeft == 0{
                bottomButtonLabel.text = ""
                bottomButtonLabel.text = "You ran out of time"
                bottomTimer.invalidate()
                topTimer.invalidate()
            }
            
        }
        else if gameStarted1 == 0 && gameStarted2 == 1{
            topTimeLeft -= 1
            topClock.text = String(topTimeLeft)
            topButtonLabel.text = ""
            bottomButtonLabel.text = "Clicked"
            if topTimeLeft == 0{
                topButtonLabel.text = "You ran out of time"
                topTimer.invalidate()
                bottomTimer.invalidate()
            }
        }
    }

    // this determines what will occur when resetButton is pressed
    @IBAction func resetButton(_ sender: UIButton) {
        // this sets the amount of time that the clock starts with.
        topTimeLeft = 30
        bottomTimeLeft = 30
        // this will update the text on the label for bottom and top clock.
        topClock.text = "\(topTimeLeft)"
        bottomClock.text = "\(bottomTimeLeft)"
        // this will reset the old clock
        topTimer.invalidate()
        bottomTimer.invalidate()
        topButtonLabel.text = ""
        bottomButtonLabel.text = ""
        gameStarted1 = 0
        gameStarted2 = 0
        

    }
    // topButton will make the bottom clock start reset the previous timer
    @IBAction func topButton(_ sender: UIButton) {
        bottomTimer.invalidate()
        topTimer.invalidate()
        gameStarted1 = 1
        gameStarted2 = 0
        startTimer1()
}
    // bottomButton will make the bottom clock start reset the previous timer
    @IBAction func bottomButton(_ sender: UIButton) {
        topTimer.invalidate()
        bottomTimer.invalidate()
        gameStarted2 = 1
        gameStarted1 = 0
        startTimer2()

    }
    
    //this function will create a timer for when the top button is clicked
    func startTimer1(){
        if gameStarted1 == 1{
            topTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updatedTimer)), userInfo: nil, repeats: true)
        }
    }
    // this will create a timer for when the bottom button is clicked.
    func startTimer2(){
                if gameStarted2 == 1{
                bottomTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
                    (#selector(ViewController.updatedTimer)), userInfo: nil, repeats: true)
        }
    }
}
