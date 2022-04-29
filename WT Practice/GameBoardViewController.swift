//
//  GameBoardViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit

class GameBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var displayedEmployeeName: UILabel!
    
    let endpointString: String = "https://namegame.willowtreeapps.com/api/v1.0/profiles"
    
    var gameType: GameType!
    
    var nameInQuestion: String = ""
    
    var modelForGame: [EmployeeResult] = []
    
    let timerSeconds: Int = 20
    
    var score: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        
        
        // query and parse the json while showing activity indicator and disabling buttons
        //setUpGameType()
    }
    
    @objc func gameTimer() {
        //
    }
    
    func configure(with gameType: GameType) {
        self.gameType = gameType
        if gameType == .practice {
            self.title = "Practice Mode"
        } else {
            self.title = "Timed Mode"
        }
    }
    
    func fetchEmployeeInfo() {
        guard let endpoint = URL(string: endpointString) else {
            print("Couldn't create URL")
            return
        }
        
        Networking.shared.fetchAndParseJSON(url: endpoint) { employees in
            
            
        }
        
        
    }
    
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


