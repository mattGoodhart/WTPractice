//
//  Networking.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import Foundation

class Networking {
    
    static let shared = Networking()
    private init() {}
    
    let endpoint = URL(string: "https://namegame.willowtreeapps.com/api/v1.0/profiles")!
    
    func fetchAndParseJSON(completion: @escaping (([EmployeeResult]) -> Void)) {
        let task = URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            guard let data = data, error == nil else {
                print("fetch failed: \(String(describing: error))")
                return
            }
            
            do {
                let model = try JSONDecoder().decode([EmployeeResult].self, from: data)
                
                let filteredModel = model.filter { employee in
                    employee.headshot.url != nil
                }
                
                print(filteredModel)
                completion(filteredModel)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}




