//
//  ViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit


enum GameType {
    case practce
    case timed
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var practiceModeButton: UIButton!
    @IBOutlet weak var timedModeButton: UIButton!
    
    
    
    @IBAction func practiceButtonHit() {
        segueToGameBoard(gametype: .practce)
    }
    
    @IBAction func timedButtonHit() {
        segueToGameBoard(gametype: .timed)
    }
    
    func segueToGameBoard(gametype: GameType) {
        performSegue(withIdentifier: "GameBoardSegue", sender: self)
        
        // let gameBoard =  //instantiateViewController(withIdentifier: "GameBoardViewController")
        // gameBoard.title = "Practice Mode"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameBoardSegue" {
            let gameBoardViewController = segue.destination as! GameBoardViewController
            //
        }
    }
}
