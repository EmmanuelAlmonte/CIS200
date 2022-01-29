//
//  main.swift
//  BoatRaceTrackerCL
//
//  Created by Emmanuel Almonte on 6/12/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import Foundation

//stores all times for user inputted boats.
var boatTimes: Array<Int> = []

// stores all the names for user inputted boats.
var boatNames: [String] = []

// Boat name and Time
var boatNameTime = Dictionary<String, Int>()

// user input for boat name
var userBoatNameInput: String!

// user input for boat time
var userBoatTimes: String

// User input for boat time but in Integer
var userBoatTimesInt: Int
// Displays to user what they need to do in order to
print("To quit press enter with no data or enter '*' ")
// this while loops the display until user presses enter or enters '*'
while true{
    print("\n\nEnter a name for your boat")
    userBoatNameInput = readLine() ?? ""
    //checks if user wants to quit
    if userBoatNameInput == ""  || userBoatNameInput == "*"  {
        break
    }
    else{
        // determines where to store the data inputted.
        boatNames.append(userBoatNameInput)
        
        print("\nEnter the time for boat race")
        
        userBoatTimes = readLine() ?? ""
        
        userBoatTimesInt = Int(userBoatTimes) ?? 0
        
        boatTimes.append(userBoatTimesInt)
        
        boatNameTime[userBoatNameInput] = userBoatTimesInt
        
    }
}

// stores the slowest boat in the array boatTimes
var highestValue = boatTimes[0]
// stores the slowest boat
var slowestBoat = ""
// stores the lowestValue from boatTimes
var lowestValue = boatTimes[0]
//Stores the fastest boat in the race
var fastestBoat = ""
//stores the total times add together
var totalTime: Int = 0
//stores the average of times
var average: Int

// Finds the time of the fastest boat.
for times in boatTimes{
    if times < lowestValue{
        lowestValue = times
    }
}

// for loop to find the name of the fastest boat
for (name, time) in boatNameTime{
    if time == lowestValue{
        fastestBoat = name
    }
}

// Finds the time of the slowest boat.
for times in boatTimes{
    if times > highestValue{
        highestValue = times
    }
}

// For loop to find the name of the slowest boat.
for (name, time) in boatNameTime{
    if time == highestValue{
        slowestBoat = name
    }
}
// stores the total time by adding each element in boatTimes
for avg in boatTimes{
    totalTime += avg
}
// stores the average byt divding average by total boatTimes.
average = totalTime / boatTimes.count
// Output to user.
print("The slowest boat was \(slowestBoat) at \(highestValue) secs.\nThe fastest boat was \(fastestBoat) at \(lowestValue) secs.\nThe average time in this race was \(average) secs.")

