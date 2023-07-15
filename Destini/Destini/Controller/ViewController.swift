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
   
    let stories = [
     Story(title: "You see a fork in the road.", choice1: "Take a left", choice2: "Take a right"),
     Story(title: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),
     Story(title: "You find a teasure chest", choice1: "Open it", choice2: "Check for traps")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
        print(sender.currentTitle)
        if sender.currentTitle == "Take a left" {
            storyLabel.text = stories[1].title
            choice1Button.setTitle(stories[1].choice1, for: .normal)
            choice2Button.setTitle(stories[1].choice2, for: .normal)
        }else if sender.currentTitle == "Take a right"{
            storyLabel.text = stories[2].title
            choice1Button.setTitle(stories[2].choice1, for: .normal)
            choice2Button.setTitle(stories[2].choice2, for: .normal)
        }
    }
    
}

