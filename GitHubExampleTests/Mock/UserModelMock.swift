//
//  UserModelMock.swift
//  GitHubExampleTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
@testable import GitHubExample

struct UserModelMock {
    
    static func getMock(many: Int) -> [UserModel] {
        
        var list = [UserModel]()
        
        
        for i in 0...many {
            list.append(UserModel(login: "test  \(i)", id: 0, nodeID: "", avatarURL: "https://avatars.githubusercontent.com/u/1?v=4", gravatarID: "", url: "", htmlURL: "", followersURL: "", followingURL: "", gistsURL: "", starredURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", eventsURL: "", receivedEventsURL: "", type: "", siteAdmin: false))
        }
       
        
        return list
    }
    
    static func getUserDetails(userName: String) -> UserDetails {
        UserDetails(login: userName, name: "name \(userName)")
    }
    
    static func getUserRepos(userName: String, many: Int) -> [UserRepo] {
        
        var list = [UserRepo]()
        
        for i in 0...many {
            list.append(UserRepo(id: i, nodeID: "userName \(i)", name: userName, fullName: "userName \(i)"))
        }
        
        return list
    }
}
