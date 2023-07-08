//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Gizem Coşkun on 8.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = [UIImage(named: "ball1"),UIImage(named: "ball2"),UIImage(named: "ball3"),UIImage(named: "ball4"),UIImage(named: "ball5"),]

    
    @IBAction func askButtonPressed(_ sender: Any) {
        
        imageView.image = ballArray[2]
    }
    
}

