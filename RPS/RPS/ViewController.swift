//
//  ViewController.swift
//  RPS
//
//  Created by Thong Hoang Nguyen on 2019-04-23.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topMostLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    
    private var state: GameState = .Start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func play(_ sender: UIButton) {
        let comSign = randomSign()
        topMostLabel.text = comSign.emoji
        var mySign = Sign.Rock
        switch sender.tag {
        case 1: //rock
            mySign = Sign.Rock
            scissorsButton.isHidden = true
            paperButton.isHidden = true
        case 2: // scissors
            mySign = Sign.Scissors
            rockButton.isHidden = true
            paperButton.isHidden = true
        default: // Paper
            mySign = Sign.Paper
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        }
        state = mySign.getGameState(other: comSign)
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        playAgainButton.isHidden = false
        updateUI()
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        state = .Start
        updateUI()
    }
    
    fileprivate func updateUI() {
        switch state {
        case .Start:
            stateLabel.text = "Rock, Paper, Scissors"
            view.backgroundColor = .white
            playAgainButton.isHidden = true
            topMostLabel.text = "🤖"
            rockButton.isEnabled = true
            rockButton.isHidden = false
            paperButton.isEnabled = true
            paperButton.isHidden = false
            scissorsButton.isEnabled = true
            scissorsButton.isHidden = false
            
        case .Win:
            stateLabel.text = "You won!!"
            view.backgroundColor = .blue
        case .Lose:
            stateLabel.text = "You lost!!"
            view.backgroundColor = .red
        case .Draw:
            stateLabel.text = "Draw!!"
            view.backgroundColor = .yellow
        }
    }
}

