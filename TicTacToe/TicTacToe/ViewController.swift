//
//  ViewController.swift
//  TicTacToe
//
//  Created by Gizem Coşkun on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Button: UIButton!
    @IBOutlet weak var b1Button: UIButton!
    @IBOutlet weak var b3Button: UIButton!
    @IBOutlet weak var b2Button: UIButton!
    @IBOutlet weak var c1Button: UIButton!
    @IBOutlet weak var c2Button: UIButton!
    @IBOutlet weak var c3Button: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossessScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }

    func initBoard(){
        board.append(a1Button)
        board.append(a2Button)
        board.append(a3Button)
        board.append(b1Button)
        board.append(b2Button)
        board.append(b3Button)
        board.append(c1Button)
        board.append(c2Button)
        board.append(c3Button)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            crossessScore += 1
            resultAlert(title: "Crosses Win!")
        }
        if checkForVictory(NOUGHT){
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        
        if (fullBoard()){
            resultAlert(title: "Draw")
        }
    }
    func checkForVictory(_ s :String) -> Bool {
        
        
        //horizantal victory
        if thisSymbol(a1Button, s) && thisSymbol(a2Button, s) && thisSymbol(a3Button, s){
            return true
        }
        if thisSymbol(b1Button, s) && thisSymbol(b3Button, s) && thisSymbol(b3Button, s){
            return true
        }
        if thisSymbol(c1Button, s) && thisSymbol(c2Button, s) && thisSymbol(c3Button, s){
            return true
        }
        
        //vertical victory
        if thisSymbol(a1Button, s) && thisSymbol(b1Button, s) && thisSymbol(c1Button, s){
            return true
        }
        if thisSymbol(a2Button, s) && thisSymbol(b2Button, s) && thisSymbol(c2Button, s){
            return true
        }
        if thisSymbol(a3Button, s) && thisSymbol(b3Button, s) && thisSymbol(c3Button, s){
            return true
        }
        
        //diagonal victory
        if thisSymbol(a1Button, s) && thisSymbol(b2Button, s) && thisSymbol(c3Button, s){
            return true
        }
        if thisSymbol(a3Button, s) && thisSymbol(b2Button, s) && thisSymbol(c1Button, s){
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    func resultAlert(title: String){
        
        let message = "\nNoughts" + String(noughtsScore) + "\nCrosses" + String(crossessScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        } else if firstTurn == Turn.Nought {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            } else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

