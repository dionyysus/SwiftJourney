//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gizem Coşkun on 17.07.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
