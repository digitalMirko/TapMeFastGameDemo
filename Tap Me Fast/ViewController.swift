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
        
    }

    // button action
    @IBAction func startGame(_ sender: Any) {
        
        
    }
    
    

}

