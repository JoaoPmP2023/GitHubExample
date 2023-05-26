//
//  UsersEndPoint.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
import NetworkSDK


enum UsersEndPoint {
    
    case getUsers
    case userDetails(userName: String)
    case userRepos(userName: String)
    
}

extension UsersEndPoint: Endpoint {
    
    
    var headers: [String : String]? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getUsers, .userDetails, .userRepos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .userDetails(let userName):
            return "/users/\(userName)"
        case .userRepos(let userName):
            return "/users/\(userName)/repos"
        }
    }
    
}
