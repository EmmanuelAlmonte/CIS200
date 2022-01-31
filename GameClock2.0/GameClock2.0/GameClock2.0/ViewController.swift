//
//  ViewController.swift
//  GameClock2.0
//
//  Created by Emmanuel Almonte on 6/25/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Reference to the stepper button
    @IBOutlet var stepperOutlet: UIStepper!
    
    
    // Creates a timer object for the topLabel at the global level.
    var timer: Timer = Timer()
    
    // Reference to top clock label.
    @IBOutlet var topClockLabel: UILabel!
    
    // Reference to bottom clock label.
    @IBOutlet var bottomClockLabel: UILabel!
    
    // Reference to bottomButton property.
    @IBOutlet var bottomButton: UIButton!
    
    // Reference to top Button property.
    @IBOutlet var topButton: UIButton!
    
    // Reference to reset button property.
    @IBOutlet var resetButton: UIButton!
    
    // Creates an integer for the amount of time left for the top clock.
    var topTimeLeft = secsToMins(time: 60)
    
    // Creates an integer for the amount of time left for the bottom clock
    var bottomTimeLeft = secsToMins(time: 60)
    
    // Creates an integer that determines which button is clicked 1 = topButton, 2 = bottomButton.
    var clickedButton = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepperOutlet.value = 60
        topClockLabel.text = ("\(topTimeLeft.mins):\(topTimeLeft.secs)")
        bottomClockLabel.text = ("\(bottomTimeLeft.mins):\(bottomTimeLeft.secs)")
        bottomButton.layer.cornerRadius = 10
        topButton.layer.cornerRadius = 10
        bottomButton.backgroundColor = .gray
        topButton.backgroundColor = .gray
    }
    
    /* this will update the bottom and top clocks as well as change the visual components of both buttons depending on whether their clicked or how much much time is left. */
    @objc func updateTimer(){
        if clickedButton == 1{
            stepperOutlet.isEnabled = false
            topButton.isEnabled = false
            bottomButton.isEnabled = true
            bottomTimeLeft.time -= 1
            bottomClockLabel.text = ("\(bottomTimeLeft.mins):\(bottomTimeLeft.secs)")
            topButton.backgroundColor = .darkGray
            bottomButton.backgroundColor = .gray
            if bottomTimeLeft.time == 0{
                timer.invalidate()
                bottomButton.setTitle("Out of Time", for: .normal)
                bottomButton.backgroundColor = .red
                topButton.isEnabled = false
                bottomButton.isEnabled = false
                
            }
        }
        else if clickedButton == 2{
            stepperOutlet.isEnabled = false
            bottomButton.isEnabled = false
            topButton.isEnabled = true
            topTimeLeft.time -= 1
            topClockLabel.text = ("\(topTimeLeft.mins):\(topTimeLeft.secs)")
            topButton.backgroundColor = .gray
            bottomButton.backgroundColor = .darkGray
            if topTimeLeft.time == 0 {
                topButton.setTitle("Out of Time", for: .normal)
                topButton.backgroundColor = .red
                timer.invalidate()
                topButton.isEnabled = false
                bottomButton.isEnabled = false
            }
            
        }


        
    }
    
    // Actions that will occur once reset button is clicked.
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        topTimeLeft.time = 60
        topClockLabel.text = ("\(topTimeLeft.mins):\(topTimeLeft.secs)")
        bottomTimeLeft.time = 60
        bottomClockLabel.text = ("\(bottomTimeLeft.mins):\(bottomTimeLeft.secs)")
        bottomButton.setTitle("", for: .normal)
        topButton.setTitle("", for: .normal)
        bottomButton.backgroundColor = .gray
        topButton.backgroundColor = .gray
        topButton.isEnabled = true
        bottomButton.isEnabled = true
        timer.invalidate()
        stepperOutlet.isEnabled = true
        stepperOutlet.value = 60
        
    }
    
    // Actions that will occur once top button is clicked.
    // Deletes a timer and creates one.
    @IBAction func topButtonClicked(_ sender: UIButton) {
        clickedButton = 1
        timer.invalidate()
        startTimer()
    }
    
    // Actions that will occur once bottom Button is clicked.
    // Timer is deleted and created each time.
    @IBAction func bottomButtonClicked(_ sender: UIButton) {
        clickedButton = 2
        timer.invalidate()
        startTimer()
        
    }
    
    
    // Actions that will occur if stepper is clicked.
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        bottomTimeLeft.time = Int(sender.value)
        topTimeLeft.time = Int(sender.value)
        topClockLabel.text = ("\(topTimeLeft.time)")
        bottomClockLabel.text = ("\(bottomTimeLeft.time)")
        
    }
    
    // Creates a timer
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }

}

