//
//  API Response.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import Foundation

struct EmployeeResult: Codable {
    let firstName: String
    let headshot: PhotoInfo
    let lastName: String
}

struct PhotoInfo: Codable {
    let url: String?
}
