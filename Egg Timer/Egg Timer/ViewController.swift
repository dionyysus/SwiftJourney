//
//  ViewController.swift
//  Egg Timer
//
//  Created by Gizem Coşkun on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barProgressView: UIProgressView!
    
    let eggTimes = ["Soft": 3 ,"Medium": 4, "Hard": 7]
   var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        let hardness = sender.currentTitle ?? ""
        totalTime = eggTimes[hardness] ?? 0
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            barProgressView.progress = Float(percentageProgress)
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
}
