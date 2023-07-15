//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import Foundation

struct CalculatorBrain {

    var bmi: Float = 0.0
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / (height * height)
    }
}

