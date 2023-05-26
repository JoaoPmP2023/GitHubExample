//
//  NetworkServiceProtocol.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation

public protocol NetworkServiceProtocol {
    
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping ResultCallback<T>)
    func cancelRequest(for endpoint: Endpoint)
}
