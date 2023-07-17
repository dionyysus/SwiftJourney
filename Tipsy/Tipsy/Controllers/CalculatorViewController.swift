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
    var billBrain = BillBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle ?? ""
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
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
        let bill = billTextField.text ?? ""
        let splitNumber = splitNumberLabel.text ?? ""
        billBrain.calculateBill(bill: bill, splitNumber: splitNumber, tip: tip)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = billBrain.getBill()
            destinationVC.settings = billBrain.getSettings()
        }
    }
}

