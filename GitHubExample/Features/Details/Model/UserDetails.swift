//
//  UserDetails.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

struct UserDetails: Codable {
    let login: String
   let name: String

    enum CodingKeys: String, CodingKey {
        case login
        case name
       
    }
}
