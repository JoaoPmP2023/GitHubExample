//
//  UserServiceMock.swift
//  GitHubExampleTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
@testable import GitHubExample

class UserServiceMock: UserServiceProtocol {
    
    let startWithEmpty: Bool
    let startWithError: Bool
    
    init(startWithEmpty: Bool = false, startWithError: Bool = false){
        
        self.startWithError = startWithError
        self.startWithEmpty = startWithEmpty
    }
    
    func getUsers(completion: @escaping ([GitHubExample.UserModel]?, Error?) -> ()) {
        
        if startWithEmpty {
            completion([], nil)
        } else if startWithError {
            completion(nil, NSError(domain: "Mock error", code: 400))
        } else {
            completion(UserModelMock.getMock(many: 10), nil)
        }
    }
    
    func getUserDetails(userName: String, completion: @escaping (GitHubExample.UserDetails?, Error?) -> ()) {
        if startWithEmpty {
            completion(nil, nil)
        } else if startWithError {
            completion(nil, NSError(domain: "Mock error", code: 400))
        } else {
            completion(UserModelMock.getUserDetails(userName: userName), nil)
        }
    }
    
    func getUserRepos(userName: String, completion: @escaping ([GitHubExample.UserRepo]?, Error?) -> ()) {
        if startWithEmpty {
            completion(nil, nil)
        } else if startWithError {
            completion(nil, NSError(domain: "Mock error", code: 400))
        } else {
            completion(UserModelMock.getUserRepos(userName: userName, many: 10), nil)
        }
    }
}
