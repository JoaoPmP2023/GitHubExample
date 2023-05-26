//
//  DetailsViewModelProtocol.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

protocol DetailsViewModelProtocol: AnyObject {
    
    var userDetails: UserDetails { get }
    var repos: [UserRepo] { get }
    func viewDidLoad()
    var onDataSourceChanged: (() -> Void)? { get set }
    var onDataSourceEmpty: (() -> Void)? { get set }
    var onDataSourceError: (() -> Void)? { get set }
    var onInformationLoading: ((Bool) -> Void)? { get set }
    
}
