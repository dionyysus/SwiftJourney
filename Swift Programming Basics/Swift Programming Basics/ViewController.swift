//
//  ViewController.swift
//  Swift Programming Basics
//
//  Created by Gizem Coşkun on 8.07.2023.
//

import UIKit

class ViewController: UIViewController {

    var numbers = [43, 73, 195, 53]
    var newNumbers = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //create a random password
        let len = 8
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"
        let randomPassword = String((0..<len).compactMap{ _ in alphabet.randomElement() })
        print(randomPassword)
        
        
        //add new item to new array
        for i in 0...3 {
            var result = numbers[i] * numbers[i+1]
            newNumbers.append(result)
            print(newNumbers)
        }
        
        print(newNumbers)
    }

    

}

