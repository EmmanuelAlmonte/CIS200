//
//  ScoreViewController.swift
//  FinalProject
//
//  Created by Emmanuel Almonte on 6/29/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
     @IBOutlet var scoreLabel: UILabel!
     
     
     @IBOutlet var roundLabel: UILabel!
     
     
     
     @IBOutlet var normalGamePatternButton: UIButton!
     
     @IBOutlet var customPatternButton: UIButton!
     
     @IBOutlet var customPatternTextField: UITextField!
     
     
     @IBOutlet var resetStatButton: UIButton!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         resetStatButton.layer.cornerRadius = 10
         normalGamePatternButton.layer.cornerRadius = 10
         customPatternButton.layer.cornerRadius = 10

         // Do any additional setup after loading the view.
     }
     
     @IBAction func normalGameButtonClicked(_ sender: UIButton) {
     }
     

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
