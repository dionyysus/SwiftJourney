//
//  BillBrain.swift
//  Tipsy
//
//  Created by Gizem Coşkun on 17.07.2023.
//

import UIKit

struct BillBrain {
    var bill: Bill?
    
    func getBill() -> String{
        return bill?.totalBill ?? ""
    }
    
    func getSettings() -> String{
        return bill?.settings ?? ""
    }
    
    mutating func calculateBill(bill: String, splitNumber: String, tip: Double){
        let lastBill = ((Double(bill) ?? 0.0) + tip ) / ((Double(splitNumber)) ?? 0.0)
        self.bill = Bill(totalBill: String(lastBill), settings:  "Split between \(splitNumber) people, with \(tip*100)% tip.")
        self.bill?.totalBill = String(lastBill)
        
    }
    
}
