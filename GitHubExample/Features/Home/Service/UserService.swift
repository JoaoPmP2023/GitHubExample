//
//  UserService.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
import NetworkSDK

class UserService: UserServiceProtocol {
    
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(networkInstance: NetworkSDKInstance.intance)){
        self.networkService = networkService
    }
    
    func getUsers(completion: @escaping ([UserModel]?, Error?) -> ()) {
        
        networkService.request(UsersEndPoint.getUsers) { (result: Result<[UserModel]>) in
            
            switch result {
                case .success(let response):
                completion(response,nil)
                case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
    
    func getUserDetails(userName: String, completion: @escaping (UserDetails?, Error?) -> ()) {
        
        networkService.request(UsersEndPoint.userDetails(userName: userName)) { (result: Result<UserDetails>) in
            
            switch result {
                case .success(let response):
                completion(response,nil)
                case .failure(let error):
                completion(nil, error)
                
            }
        }
        
    }
    
    func getUserRepos(userName: String, completion: @escaping ([UserRepo]?, Error?) -> ()) {
     
        networkService.request(UsersEndPoint.userRepos(userName: userName)) { (result: Result<[UserRepo]>) in
            
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
        
    
    
    
}
