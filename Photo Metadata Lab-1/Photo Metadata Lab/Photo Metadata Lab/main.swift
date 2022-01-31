//
//  main.swift
//  Photo Metadata Lab
//
//  Created by Emmanuel Almonte on 6/16/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation
// An array to store user input data
var userOneData: [String:Double] = [:]
var userTwoData: [String:Double] = [:]
//String variables for users description
var userOneDescription: String?
var userTwoDescription: String?

// userAperture, userShutterSpeed, and userIso will capture the user data
var userAperture: String
var userShutterSpeed: String
var userIso: String
// counter for while loop and determines which user
var user = 1

while user < 3 {
    // This will let you know which user is entering data
    print("This is Data for user \(user)")
    
    //This if-else statment determines which user is entering their data
    if user == 1{
            print("Enter the aperture value for your camera: ")
        userAperture = readLine() ?? ""
        // Stores the user data for the Aperture in a double var instead of a string var
        var userApertureD = Double(userAperture) ?? 0.0
        userOneData["aperture"] = userApertureD

        print("Enter the Shutter Speed value for your camera: ")
        userShutterSpeed = readLine() ?? ""
        // Stores the user data for Shutter Speed in a double var instead of a string var
        var userShutterSpeedD = Double(userShutterSpeed) ?? 0.0
        userOneData["shutterSpeed"] = userShutterSpeedD

        print("Enter the Iso value for your camera: ")
        userIso = readLine() ?? ""
        // Stores the user data for Iso in a double var instead of a string var
        var userIsoD = Double(userIso) ?? 0.0
        userOneData["iso"] = userIsoD
        
        print("Enter a description of photo")
        userOneDescription = readLine() ?? ""
    }//If user one entered data then else statemnet will enter user 2 data
    else{
        print("Enter the aperture value for your camera: ")
        userAperture = readLine() ?? ""
        // Stores the user data for the Aperture in a double var instead of a string var
        var userApertureD = Double(userAperture) ?? 0.0
        userTwoData["aperture"] = userApertureD

        print("Enter the Shutter Speed value for your camera: ")
        userShutterSpeed = readLine() ?? ""
        // Stores the user data for Shutter Speed in a double var instead of a string var
        var userShutterSpeedD = Double(userShutterSpeed) ?? 0.0
        userTwoData["shutterSpeed"] = userShutterSpeedD

        print("Enter the Iso value for your camera: ")
        userIso = readLine() ?? ""
        // Stores the user data for Iso in a double var instead of a string var
        var userIsoD = Double(userIso) ?? 0.0
        userTwoData["iso"] = userIsoD
        
        print("Enter a description of photo")
        userTwoDescription = readLine() ?? ""
    }

    //updates the user entering data
    user += 1
}


// Creates an instance of PhotoMetadata and uses the data from userOne and userTwo dictionary.
var userOne = PhotoMetadata(aperture: userOneData["aperture"] ?? 0, shutterSpeed: userOneData["shutterSpeed"] ?? 0 ,iso: userOneData["iso"] ?? 0)
var userTwo = PhotoMetadata(aperture: userTwoData["aperture"] ?? 0, shutterSpeed: userTwoData["shutterSpeed"] ?? 0 ,iso: userTwoData["iso"] ?? 0)

//Sets the description for user 1 and 2 using mutating function
userOne.setDescription(userdescription: userOneDescription ?? "")
userTwo.setDescription(userdescription: userTwoDescription ?? "")

// Displays User One and Two data
print("\nThe data for user one camera below \nAperture: \(userOne.aperture)\nShutterSpeed: \(userOne.shutterSpeed)\nIso: \(userOne.iso)\nLux: \(userOne.lux)\nEV: \(userOne.ev)\nDescription of Photo: \(userOne.description)\n")

print("\nThe data for user two camera below \nAperture: \(userTwo.aperture)\nShutterSpeed: \(userTwo.shutterSpeed)\nIso: \(userTwo.iso)\nLux: \(userTwo.lux)\nEV: \(userTwo.ev)\nDescription of Photo: \(userTwo.description)\n")


