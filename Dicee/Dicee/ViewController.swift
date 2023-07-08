//
//  ViewController.swift
//  Dicee
//
//  Created by Gizem Coşkun on 8.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var changeDice1 = 1
    var changeDice2 = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        
        let dices = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]

        diceImageView1.image = dices[changeDice1]
        diceImageView2.image = dices[changeDice2]
        
        changeDice1 += 1
        changeDice2 -= 1
    }
}

