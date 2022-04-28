//
//  GameBoardViewController.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit

let endpointString: String = "https://namegame.willowtreeapps.com/api/v1.0/profiles"

class GameBoardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // query and parse the json while showing activity indicator and disabling buttons
        
    }
    
    
    func fetchEmployeeInfo() {
        guard let endpoint = URL(string: endpointString) else {
            print("Couldn't create URL")
            return
        }
        
        Networking.shared.fetchAndParseJSON(url: endpoint)
        
        
    }
}


