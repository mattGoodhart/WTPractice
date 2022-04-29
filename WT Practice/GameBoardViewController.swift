//
//  GameBoardViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit

protocol GameManagerDelegate {
    func gameDidStart()
    func gameDidEnd()
    func updateScore()
}

class GameBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, GameManagerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var displayedEmployeeName: UILabel!
    
    var gameManager: GameManager! = nil
    var gameType: GameType!
    var nameInQuestion: String = ""
    var modelForGame: [EmployeeResult] = []
    let timerSeconds: Int = 20
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
    }

    @objc func gameTimer() {
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setup game board
    }
    
    func configure(with gameType: GameType, gameManager: GameManager) {
        self.gameType = gameType
        self.gameManager = gameManager
        if gameType == .practice {
            self.title = "Practice Mode"
        } else {
            self.title = "Timed Mode"
        }
        gameManager.delegate = self
    }
    
    //MARK: GameManagerDelegate
    func gameDidStart() {
        
    }
    
    func gameDidEnd() {
        
    }
    
    func updateScore() {
        
    }
    

    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        //process game logic based on game type
        switch gameType {
        case .practice:
            if nameInQuestion == (self.modelForGame[(indexPath).row].firstName + " " + self.modelForGame[(indexPath).row].lastName) {
                //unhide the "correct" image
            } else {
                //unhide the "incorrect" image
                //present game over mesage
            }
        case .timed:
            let timer = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(gameTimer), userInfo: nil, repeats: false)
        default:
            return
        }
    }
}


