//
//  main.swift
//  Control_Flow_and_Debugging
//
//  Created by Emmanuel Almonte on 5/27/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation




var usrAnimal: String
var usrPreferedCar: String
var usrScore: String
let usrLorR: String

print("Choose an Animal: \"Tiger\" \"Lion\" \"Lepoard\" \"Cheetah\" ")

usrAnimal = readLine() ?? ""

print("Do you prefer gas or electric cars? electric or gas?")
usrPreferedCar = readLine() ?? ""

print("Enter a number from 1-35: ")
usrScore = readLine() ?? ""
var intusrScore = Int(usrScore) ?? 0


print("You're being chased down a dark road by a dark unkwown figure")
print("There seems to be something restraining you from running a full speed, \n\n You see your home you can try to \"unlock\" the door or continue to \"run\"? ")
var usrChoice = readLine() ?? ""

if usrChoice.lowercased() == "unlock"{
    print("You have \(usrScore) to unlock the door")
    print("You have two keys one for your car and one for your home\n Choose \"left\" or \"right\"")
    let usrLorR = readLine() ?? ""
    if usrLorR.lowercased() == "left" {
        print("You chose your car keys and the \(usrAnimal) captured you!!!")
    }
    else {
        print("You chose the correct key and entered your home safely!!")
    }
}
else if usrChoice.lowercased() == "run"{
    print("You have \(intusrScore) secs to get to your car until \(usrAnimal) captures you")
    print("Choose \"left\" or \"right\" pocket to pick your car or home keys")
    usrLorR = readLine() ?? ""
    if usrLorR.lowercased() == "left" {
        print("You have less than 15 secs but you were able to get in your car")
        let result = (usrLorR.lowercased() == "left") ? "You're tires have been slashed and have been captured by \(usrAnimal)" :  "You unlocked your car and got away. "
        print(result)
    }
    else{
        print("the \(usrAnimal) captured you before you could even get your keys")
    }
}
// print("Do you lock your door or run to your room? ")
//var usrSafe = readLine() ?? ""
