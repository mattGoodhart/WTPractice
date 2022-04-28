//
//  API Response.swift
//  WT Practice
//
//  Created by Alicia Goodhart on 4/28/22.
//

import Foundation

struct APIResponse: Codable {
    let employees: [EmployeeResults]
}

struct EmployeeResults: Codable {
    let firstName: String
    let headshot: PhotoInfo
    let lastName: String
}

struct PhotoInfo: Codable {
    let url: String
}
