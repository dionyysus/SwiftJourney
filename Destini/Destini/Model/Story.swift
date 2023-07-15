//
//  Story.swift
//  Destini
//
//  Created by Gizem Coşkun on 15.07.2023.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice2: String
    
    init(title: String, choice1: String, choice2: String) {
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
    }
    
}
