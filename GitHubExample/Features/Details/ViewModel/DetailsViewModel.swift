//
//  DetailsViewModel.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

class DetailsViewModel: DetailsViewModelProtocol {
    
    var userDetails: UserDetails?
    var user: UserModel
    var service: UserServiceProtocol
    var repos: [UserRepo] = []
 
    
    var onDataSourceChanged: (() -> Void)?
    
    var onDataSourceEmpty: (() -> Void)?
    
    var onDataSourceError: (() -> Void)?
    
    var onInformationLoading: ((Bool) -> Void)?
    
    var onReposLoading: ((Bool) -> Void)?
    
    var onReposChanged: (() -> Void)?
    
    
    init(user: UserModel, service: UserServiceProtocol = UserService()) {
        self.user = user
        self.service = service
    }
    
    
    func viewDidLoad() {
        getUserDetails()
        getRepos()
    }
    
    private func getUserDetails() {
        
        onInformationLoading?(true)
        service.getUserDetails(userName: self.user.login) { [weak self] details, error in
            self?.onInformationLoading?(false)
            
            guard let details = details, error == nil else {
                self?.onDataSourceError?()
                return
            }
            
            self?.userDetails = details
            self?.onDataSourceChanged?()

        }
    }
    
    private func getRepos() {
        
        onReposLoading?(true)
        service.getUserRepos(userName: self.user.login) { [weak self] repos, error in
            self?.onReposLoading?(false)
            
            guard let repos = repos, error == nil else {
                self?.onDataSourceError?()
                return
            }
            
            if repos.count > 0 {
                self?.repos = repos
                self?.onReposChanged?()
            }
        }
    }
    
}
