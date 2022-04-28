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
    
    var localModel = [EmployeeResults]()
    
    
    func fetchAndParseJSON(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                    guard let data = data, error == nil, let self = self else {
                        print("fetch failed: \(String(describing: error))")
                        return
                    }
                    
                    do {
                        let model = try JSONDecoder().decode(APIResponse.self, from: data)
                        
                        for employee in model.employees {
                            self.localModel.append(employee)
                        }
                        
                        DispatchQueue.main.async {
                            
                            self.setUpGameBoard()
                            
                            //self.choose 6 and get image
                            
                            // choose 6 random entries
                            
                            // get images for all six
                            
                            // choose
                            
                        }
                    } catch {
                        print(error)
                    }
                }
                task.resume()
            }
    
 
    func setUpGameBoard() {
        
        var sixEmployees = [EmployeeResults]()
        
        for _ in (0..<6) {
            guard let employee = localModel.randomElement() else {
                return
            }
            sixEmployees.append(employee)
        }
        for employee in sixEmployees {
            
            guard let imageURL = URL(string: employee.headshot.url) else {
                print("Couldnt create photo URL")
                return
            }
            
            fetchData(at: imageURL) { data in
                //update the view
                
            }
        }
        
    }
    
    
        func fetchData(at url: URL, with completion: @escaping ((Data?) -> Void)) {
            DispatchQueue.global().async { //necessary?
                print("starting image download")
                guard let data = try? Data(contentsOf: url) else {
                    DispatchQueue.main.async {
                        print("Download failed for URL: \(url)")
                        completion(nil)
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
    }
    
    
    

