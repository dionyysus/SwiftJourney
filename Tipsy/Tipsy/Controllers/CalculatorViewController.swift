//
//  ViewController.swift
//  Tipsy
//
//  Created by Gizem Coşkun on 17.07.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitNumber = 0
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
                
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign) ?? 0.0
        
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        if Int(sender.value) > splitNumber {
            splitNumber += 1
        }else {
            splitNumber -= 1
        }
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(splitNumber)
    }
}

