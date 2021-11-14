//
//  ViewController.swift
//  RPS
//
//  Created by akshay.m on 14/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStatus(gameState: .start)
    }

    @IBOutlet weak var opponentSign: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var playerSignPaper: UIButton!
    @IBOutlet weak var playerSignRock: UIButton!
    @IBOutlet weak var playerSignScissor: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func scissorChoiceButton(_ sender: UIButton) {
        play(sign: .scissor)
    }
    @IBAction func paperChoiceButton(_ sender: UIButton) {
        play(sign: .paper)
    }
    @IBAction func rockChoiceButton(_ sender: UIButton) {
        play(sign: .rock)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        updateStatus(gameState: .start)
    }
    
    func updateStatus(gameState: GameState) {
        if gameState == .draw {
            statusLabel.text = "It's a draw!"
            view.backgroundColor = UIColor.yellow
        } else if gameState == .lose {
            statusLabel.text = "You lost!"
            view.backgroundColor = UIColor.red
        } else if gameState == .win {
            statusLabel.text = "You won!"
            view.backgroundColor = UIColor.green
        } else {
            statusLabel.text = "Lets play!"
            opponentSign.text = "🕹"
            view.backgroundColor = UIColor.blue
            
            playAgainButton.isHidden = true
            
            playerSignPaper.isEnabled = true
            playerSignRock.isEnabled = true
            playerSignScissor.isEnabled = true
            playerSignRock.isHidden = false
            playerSignPaper.isHidden = false
            playerSignScissor.isHidden = false
        }
    }
    
    func play(sign: Sign) {
        let randomSign = randomSign()
        let playerStatus = sign.winsOver(randomSign)
        updateStatus(gameState: playerStatus)
        
        opponentSign.text = randomSign.signEmoji
        
        playerSignRock.isEnabled = false
        playerSignPaper.isEnabled = false
        playerSignScissor.isEnabled = false
        
        if sign == .scissor {
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = true
        } else if sign == .paper {
            playerSignRock.isHidden = true
            playerSignScissor.isHidden = true
        } else {
            playerSignPaper.isHidden = true
            playerSignScissor.isHidden = true
        }
        
        playAgainButton.isHidden = false
        
    }
}

