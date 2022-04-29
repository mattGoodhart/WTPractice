//
//  GameBoardViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit
import Kingfisher

protocol GameManagerDelegate {
    func gameDidStart()
    func gameDidEnd()
    func updateScore()
}

class GameBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var displayedEmployeeName: UILabel!
    
    var gameType: GameType!
    var nameInQuestion: String = ""
    var modelForGame: [EmployeeResult] = []
    let timerSeconds: Int = 20
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc func gameTimer() {
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setup game board
    }
    
    func configure(with gameType: GameType, employees: [EmployeeResult]) {
        self.gameType = gameType
        self.modelForGame = employees
        if gameType == .practice {
            self.title = "Practice Mode"
        } else {
            self.title = "Timed Mode"
        }
    }
    
    //MARK: Game Logic
    
    //chooseSixRandomEmployees()
    
    //compareCellSelectionToEmployeeName()
    
    //endGame()
    
    //startGame()
    

    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let url = URL(string: "https://namegame.willowtreeapps.com/images/T0287KQCQ-U01CA6M4T0W-fa7975c0bc34-512.png")
        
        cell.employeeImageView.kf.setImage(with: url)
    
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
                //present game over message with alert controller
            }
        case .timed:
            let timer = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(gameTimer), userInfo: nil, repeats: false)
        default:
            return
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/2.25, height: collectionView.bounds.size.width/2.25)
    }
}


