//
//  ViewController.swift
//  Egg Timer
//
//  Created by Gizem Coşkun on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    let eggTimes = ["Soft": 300 ,"Medium": 420, "Hard": 720]
    
    var secondsRemaining = 60
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        let hardness = sender.currentTitle ?? ""

        secondsRemaining = eggTimes[hardness] ?? 0
    
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }
    }
    

   
    
}
