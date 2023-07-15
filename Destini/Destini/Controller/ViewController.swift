//
//  ViewController.swift
//  Destini
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let story0 = "You see a fork in the road."
    let choice1 = "Take a left"
    let choice2 = "Take a right"
   
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
    
        let userChoice = sender.currentTitle ?? ""
        let selectedChoise = storyBrain.nextStory(userChoice)
        storyLabel.text = storyBrain.stories[storyBrain.storyNumber].title
        choice1Button.setTitle(storyBrain.stories[storyBrain.storyNumber].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[storyBrain.storyNumber].choice2, for: .normal)
    }
    
}

