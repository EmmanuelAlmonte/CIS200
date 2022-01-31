//
//  ShowScoreViewController.swift
//  FinalProject
//
//  Created by Emmanuel Almonte on 6/29/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ShowScoreViewController: UIViewController {
    var ViewController: ViewController?
    
    
    var scoreText:String = ""
    var roundText:String = ""
    var passInfo = 0
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var roundLabel: UILabel!
    
    
    @IBOutlet var customButton: UIButton!
    
    @IBOutlet var normalButton: UIButton!
    
    @IBOutlet var customPatternTextField: UITextField!
    
    
    @IBOutlet var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = scoreText
        roundLabel.text = roundText
        // Do any additional setup after loading the view.
    }


    
    @IBAction func normalPatternButtonClicked(_ sender: UIButton) {
        passInfo = 1
    }
    
    
    @IBAction func customPatternClicked(_ sender: UIButton) {
        passInfo = 2
    }
    
    
    @IBAction func customTextFieldUpdated(_ sender: UITextField) {
    }
    
    
    @IBAction func resetStatsButtons(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainScreen = segue.destination as? ViewController
        if passInfo == 1{
            mainScreen?.customPattern = false
        }
        else{

            mainScreen?.customPatternValue = Int(customPatternTextField.text ?? "1") ?? 1
            mainScreen?.customPattern = true
        }
    }
}
