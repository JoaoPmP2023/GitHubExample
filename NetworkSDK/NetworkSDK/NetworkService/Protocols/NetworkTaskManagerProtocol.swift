//
//  NetworkTaskManagerProtocol.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation

public protocol NetworkTaskManagerProtocol {
    func task(forRequest request: URLRequest) -> URLSessionTask?
    func add(_ task: URLSessionTask, forRequest request: URLRequest)
    func removeTask(forRequest request: URLRequest)
}
