//
//  StoryBrain.swift
//  Destini
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import Foundation

struct StoryBrain {
    
    var storyNumber = 0
    
    let stories = [
     Story(title: "You see a fork in the road.", choice1: "Take a left", choice2: "Take a right"),
     Story(title: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),
     Story(title: "You find a teasure chest", choice1: "Open it", choice2: "Check for traps")
    ]
    
    mutating func nextStory(_ userChoice: String){
        
        if userChoice == stories[storyNumber].choice1 {
            storyNumber += 1
        }else if userChoice ==  stories[storyNumber].choice2{
            storyNumber += 2
        }
    }
    
}
