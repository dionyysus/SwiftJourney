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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func softSelected(_ sender: UIButton) {
        print(softTime)
    }
    
    @IBAction func mediumSelected(_ sender: UIButton) {
        print(mediumTime)
    }
    
    @IBAction func hardSelected(_ sender: Any) {
        print(hardTime)
    }
    
}
