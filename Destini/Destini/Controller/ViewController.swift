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
   
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
    
        storyBrain.nextStory(sender.currentTitle ?? "")
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

