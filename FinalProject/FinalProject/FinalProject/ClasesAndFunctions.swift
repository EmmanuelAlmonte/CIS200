//
//  ClasesAndFunctions.swift
//  FinalProject
//
//  Created by Emmanuel Almonte on 6/30/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation
import UIKit

// this is a class of UIButtons.
class PatternButtons{
    var buttons: [UIButton]

    
    init(buttons:[UIButton]) {
        self.buttons = buttons

    }
    
    // This will disable all the buttons.

    func disableButtons(){
        buttons[0].isEnabled = false
        buttons[1].isEnabled = false
        buttons[2].isEnabled = false
        buttons[3].isEnabled = false
    }
    
    // this will disable all the buttons.
    func enableButtons(){
        buttons[0].isEnabled = true
        buttons[1].isEnabled = true
        buttons[2].isEnabled = true
        buttons[3].isEnabled = true
    }
    // this will make the buttons border zero. 
    func ButtonsBorder(){
        buttons[0].layer.borderWidth = 0
        buttons[1].layer.borderWidth = 0
        buttons[2].layer.borderWidth = 0
        buttons[3].layer.borderWidth = 0
    }
}
