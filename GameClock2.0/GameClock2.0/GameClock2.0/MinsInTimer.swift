//
//  MinsInTimer.swift
//  GameClock2.0
//
//  Created by Emmanuel Almonte on 6/25/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation


struct secsToMins{
    
    var time: Int
    
    var mins:Int {
        time / 60
    }
    
    var secs: Int {
        time % 60
    }
    
    
    
}
