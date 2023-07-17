//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No Advice"
    }
    func getBebe)= -> String{
        return bmi?.value ?? "nooo value "
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "eat more piece!", color: .blue)
        } else if 18.5 <= bmiValue && bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "fit as a friddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "eat less piece!", color: .systemPink)
        }      }
    
}

