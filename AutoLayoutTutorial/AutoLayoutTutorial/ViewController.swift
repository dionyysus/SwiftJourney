//
//  ViewController.swift
//  AutoLayoutTutorial
//
//  Created by Gizem Coşkun on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("My Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
        ])
        
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


