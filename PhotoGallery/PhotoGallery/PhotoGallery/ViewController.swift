//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Emmanuel Almonte on 6/21/21.
//  Copyright © 2021 Emmanuel Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // outlet var for The label above the image
    @IBOutlet var imageText: UILabel!
    // outlet var for right Button
    @IBOutlet var rightButton: UIButton!
    // outlet var for left Button
    @IBOutlet var leftButton: UIButton!
    // outlet var for image
    @IBOutlet var imageView: UIImageView!
    // This var stores the names of the images
    var imageNames:[String] = []
    // This var determines which screen is currently being displayed.
    var currentScreen = 0
    // This holds the information of how many Images and description there are
    var nationalParkPhotos: [String:String] = ["Bridge": "Bridge Near Buffalo Springs", "BuffaloTrail": "Buffalo Pasture Trail", "CampServices": "Camper Service Building", "LittleNiagara": "Litter Niagara Falls", "ParkRanger": "Park ranger stopping traffic while bull elk crosses road in Mammoth Hot Springs", "PlattHistoricDistrict": "Pavillion Springs", "PuaPooLava":"Entrance to much older Pua Poo lava Tube", "Scenery": "Scenery Platt Historic Distric", "StormShelter": "Storm Shelter", "SuperIntendent": "Superintendent's House"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Creates the first photo and text
        updatePage()
        
        // Do any additional setup after loading the view.
    }
    
    //Changes the photo depending on which button is tapped.
    
    // Loops through all the names in the dictionary and stores it in an array called imagesNames
    func photoName() -> [String]{
        for (name, text) in nationalParkPhotos{
            imageNames.append(name)
        }
        // This function returns the list of names
        return imageNames
    }
    //This function sets and updates the photo and text. It goes based off of the order in the list of names
    func updatePage(){
        photoName()
        // Checks if the name is in the list and then gets the descriptive text from the dictionary.
        // The value of the currentScreen is set to 0 which is also the starting index of the list of Names
        // This allows the list to start from zero and you can navigate up and down (left or right) the amount of items on the list
        if let text = nationalParkPhotos[imageNames[currentScreen] ]{
            //Sets both photo and Labels text depending on the in
            imageView.image = UIImage(named: imageNames[currentScreen])
            imageText.text = text
        }
    }

    // Determines whether right Button was clicked or not
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        // if the currentScreen value is greater than the total amount of items in the list the currentScreen will be 0 or the first page.
        if currentScreen > imageNames.count {
            currentScreen = 0
        }
        // Everytime the right button is clicked the screen moves to the right once and updates the Page
        currentScreen += 1
        updatePage()
        }
        // Determines if left button was clicked or not
    @IBAction func leftButtonClicked(_ sender: UIButton) {
        // If the currenScreen value is the less than the first index in the list it will go back to end of the list
        if currentScreen <= 0 {
            // instead of hard coding the value 10 here I used imagesNames.count so that if later on I want to add more photos and text I can
            currentScreen = imageNames.count
        }
        currentScreen -= 1
        updatePage()
    }
}
