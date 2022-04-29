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
    
    func fetchAndParseJSON(url: URL, completion: @escaping (([EmployeeResult]) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("fetch failed: \(String(describing: error))")
                return
            }
            
            do {
                let model = try JSONDecoder().decode(APIResponse.self, from: data)
                print(model)
                completion(model.employees)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
//
//    func setUpGameBoard() {
//
//        var sixEmployees = [EmployeeResults]()
//
//        for _ in (0..<6) {
//            guard let employee = localModel.randomElement() else {
//                return
//            }
//            sixEmployees.append(employee)
//        }
//        for employee in sixEmployees {
//
//            guard let imageURL = URL(string: employee.headshot.url) else {
//                print("Couldnt create photo URL")
//                return
//            }
//
//            fetchData(at: imageURL) { data in
//                //update the view
//
//            }
//        }
//
//    }
//
//
//        func fetchData(at url: URL, with completion: @escaping ((Data?) -> Void)) {
//            DispatchQueue.global().async { //necessary?
//                print("starting image download")
//                guard let data = try? Data(contentsOf: url) else {
//                    DispatchQueue.main.async {
//                        print("Download failed for URL: \(url)")
//                        completion(nil)
//                    }
//                    return
//                }
//                DispatchQueue.main.async {
//                    completion(data)
//                }
//            }
//        }
    }
    
    
    

