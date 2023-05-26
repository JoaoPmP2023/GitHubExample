//
//  HomeViewModel.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    var onDataSourceChanged: (() -> Void)?
    
    var onDataSourceEmpty: (() -> Void)?
    
    var onDataSourceError: (() -> Void)?
    
    var onInformationLoading: ((Bool) -> Void)?
    
    var onGoToDetails: ((UserModel) -> Void)?
    
    
    private let service: UserServiceProtocol
    var dataSource: [UserModel]
    init(service: UserServiceProtocol = UserService(), dataSource: [UserModel] = []) {
        self.service = service
        self.dataSource = dataSource
    }
    
    
    
    func viewDidLoad() {
        
        onInformationLoading?(true)
        service.getUsers { [weak self] users, error in
            
            self?.onInformationLoading?(false)
            
            guard let users = users, error == nil else {
                self?.onDataSourceError?()
                return
            }
            
            if users.count > 0 {
                self?.dataSource = users
                self?.onDataSourceChanged?()
            } else {
                self?.onDataSourceEmpty?()
            }
            
        }
    }
    
    func didSelectRow(row: Int) {
        let user = getUser(row: row)
        onGoToDetails?(user)
    }
    
    func getUser(row: Int) -> UserModel {
        dataSource[row]
    }
    
}
