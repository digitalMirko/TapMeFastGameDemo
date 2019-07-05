//
//  ViewController.swift
//  Tap Me Fast
//
//  Created by Mirko Cukich on 7/4/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // time label
    @IBOutlet weak var timeLabel: UILabel!
    // score label
    @IBOutlet weak var scoreLabel: UILabel!
    // button label
    @IBOutlet weak var startGameButton: UIButton!
    
    // timer used to do countdown 10, 9, 8...0
    var timer = Timer()
    // int for timer itself, numberic value
    var timeInt = 10
    // int for score int
    var scoreInt = 0
    // int for game mode: used to control game, if 0 ready to play the game, if 1 game in play
    var gameInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        timeInt = 10 // hard coding beginning time
    }

    // button action
    @IBAction func startGame(_ sender: Any) {
        // if timer equal to 10
        if timeInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
            // disables button so it doesn't go nuts if you click it a few times
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5 // fades out disabled button
        }
        // game mode: game in play
        if gameInt == 1 {
            // adds 1 to score
            scoreInt += 1
            // displays updated value in score label
            scoreLabel.text = String(scoreInt)
        } else {
            // restarting game
            timeInt = 10 // restting time to 10
            scoreInt = 0  // resetting score to 0
            
            // resetting labels with updated values
            timeLabel.text = String (timeInt)
            scoreLabel.text = String(scoreInt)
            
            // resetting button title to "Start"
            startGameButton.setTitle("Start", for: UIControl.State.normal)
        }
    }
    // starts our countdown
    @objc func startCounter() {
        // counts down timer by 1
        timeInt -= 1
        // every time time subtracts 1 it will display in label
        timeLabel.text = String(timeInt)
        
        // enables disabled button, comes back to life when it comes to 9
        startGameButton.isEnabled = true
        startGameButton.alpha = 1 // unfades button
        
        // changes 'Start' to 'Tap Away' on button
        startGameButton.setTitle("Tap Away", for: UIControl.State.normal)
        
        //  game mode: game in play
        gameInt = 1
        
        // when hits 0 stop timer
        if timeInt == 0 {
            timer.invalidate() // stop the timer and stay at 0
            
            // disables button when game finishes
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5 // fades out disabled button
            
            // changes 'Tap Away' to 'Restart' on button
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
            // timer for restart option, pauses for 5 seconds after game is over
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
        }
    }
    // Restarts the game
    @objc func restart(){
        
        // game mode: so we don't reset the game on the final click,
        // final score will stay up for 5 seconds
        gameInt = 0
        
        // enables disabled button
        startGameButton.isEnabled = true
        startGameButton.alpha = 1 // unfades button
    }
}
