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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedGameType: GameType?
    var gameManager: GameManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Networking.shared.fetchAndParseJSON() { employees in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.timedModeButton.isEnabled = true
                self.practiceModeButton.isEnabled = true
                self.gameManager = GameManager(allEmployees: employees)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
    }
    
    @IBAction func practiceButtonHit() {
        self.selectedGameType = .practice
        segueToGameBoard(gametype: .practice)
    }
    
    @IBAction func timedButtonHit() {
        self.selectedGameType = .timed
        segueToGameBoard(gametype: .timed)
    }
    
    func segueToGameBoard(gametype: GameType) {
        performSegue(withIdentifier: "GameBoardSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "GameBoardSegue", let gameBoardViewController = segue.destination as? GameBoardViewController, let gameType = selectedGameType, let newGameManager = gameManager else {
            return
        }
        gameBoardViewController.configure(with: gameType, gameManager: newGameManager)
    }
}
