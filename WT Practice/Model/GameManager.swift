//
//  GameManager.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import Foundation

class GameManager {
    
    let allEmployees: [EmployeeResult]
    weak var delegate: GameBoardViewController?
    
    init(allEmployees: [EmployeeResult]) {
        self.allEmployees = allEmployees
    }
    
    
    func getSixRandomEmployees() -> [EmployeeResult] {
        
        return []
    }
    
    func startGame(with gameType: GameType) {
        //choose a random name from employees in random employee array
        //start timer if timed game
    }
    
    func endGame() {
        //if timed game, end when timer expires - display score with UIalertcontroller and set okay button to segue back to home screen (dismiss)
        //if practice game, end upon incorrect guess - clicking OK returns to home screen
    }
    
    
    
}
