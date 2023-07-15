//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: String?
    var advice: String?
    var color: UIColor?
   
    @IBOutlet weak var bmiImageView: UIImageView!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result
        adviceLabel.text = advice
        bmiImageView.backgroundColor = color
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
