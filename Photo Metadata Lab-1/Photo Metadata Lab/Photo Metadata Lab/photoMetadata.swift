//
//  photoMetadata.swift
//  Photo Metadata Lab
//
//  Created by Emmanuel Almonte on 6/16/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation


struct PhotoMetadata{
    // description
    var description: String
    //stores aperture value
    var aperture: Double
    // stores shutterSpeed value
    var shutterSpeed: Double
    // stores iso value
    var iso: Double
    //stores the value of ev
    var ev: Double
    
    //This is a computed property which determines and stores the value of lux
    var lux: Double{
        2.5 * pow(2, ev)
    }
    // custom initializer that also calculates the value of ev
    init(aperture: Double, shutterSpeed: Double, iso: Double) {
        self.description = " "
        self.aperture = aperture
        self.shutterSpeed = shutterSpeed
        self.iso = iso
        self.ev = round((log2(pow(aperture,2) / shutterSpeed) + log2(iso / 100)) * 10) / 10.0
    }
    
    
    //This is a description function that sets description to what ever user entered.
    mutating func setDescription(userdescription: String){
        description = userdescription.uppercased()
    }
}
