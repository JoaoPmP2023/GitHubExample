//
//  UserServiceProtocol.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
import NetworkSDK

protocol UserServiceProtocol {
    
    func getUsers(completion: @escaping ([UserModel]?,Error?) -> ())
    func getUserDetails(userName: String, completion: @escaping (UserDetails?,Error?) -> ())
    func getUserRepos(userName: String, completion: @escaping ([UserRepo]?,Error?) -> ())
}
