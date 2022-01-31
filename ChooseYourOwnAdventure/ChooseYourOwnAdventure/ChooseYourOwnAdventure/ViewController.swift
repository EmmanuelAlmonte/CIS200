//
//  ViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Emmanuel Almonte on 6/24/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneLabel: UILabel!
    
    
    @IBOutlet var leftChoice: UIButton!
    
    @IBOutlet var rightChoice: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func leftChoiceClicked(_ sender: Any) {
    }
    
    
    @IBAction func rightChoiceClicked(_ sender: Any) {
    }
    
    @IBAction func unwindToMainScene(unwindSegue: UIStoryboardSegue) {
    }
    
    
    
    
}

