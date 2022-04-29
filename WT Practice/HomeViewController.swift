//
//  ViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit


enum GameType {
    case practice
    case timed
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var practiceModeButton: UIButton!
    @IBOutlet weak var timedModeButton: UIButton!
    
    var selectedGameType: GameType?
    
    @IBAction func practiceButtonHit() {
        segueToGameBoard(gametype: .practice)
    }
    
    @IBAction func timedButtonHit() {
        segueToGameBoard(gametype: .timed)
    }
    
    func segueToGameBoard(gametype: GameType) {
        performSegue(withIdentifier: "GameBoardSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "GameBoardSegue", let gameBoardViewController = segue.destination as? GameBoardViewController, let gameType = selectedGameType else {
            return
        }
        gameBoardViewController.configure(with: gameType)
    }
}
