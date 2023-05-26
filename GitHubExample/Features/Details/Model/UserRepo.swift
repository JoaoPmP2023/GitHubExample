//
//  UserRepo.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userDetails = try? JSONDecoder().decode(UserDetails.self, from: jsonData)

import Foundation

// MARK: - UserDetails
struct UserRepo: Codable {
    let id: Int
    let nodeID, name, fullName: String
  

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
    }
}
