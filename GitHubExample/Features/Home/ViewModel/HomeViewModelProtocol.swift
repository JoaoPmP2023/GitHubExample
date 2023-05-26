//
//  HomeViewModelProtocol.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    
    var dataSource: [UserModel] { get }
    func viewDidLoad()
    func didSelectRow(row: Int)
    func getUser(row: Int) -> UserModel
    var onDataSourceChanged: (() -> Void)? { get set }
    var onDataSourceEmpty: (() -> Void)? { get set }
    var onDataSourceError: (() -> Void)? { get set }
    var onInformationLoading: ((Bool) -> Void)? { get set }
    var onGoToDetails: ((UserModel) -> Void)? { get set }
}
