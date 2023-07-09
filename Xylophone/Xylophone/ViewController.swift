//
//  ViewController.swift
//  Xylophone
//
//  Created by Gizem Coşkun on 9.07.2023.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle ?? "")
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

