//
//  Endpoint.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 19/01/23.
//

import Foundation


public protocol Endpoint {
    
    var headers: [String:String]? { get }
    var body: Data? { get }
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    
}

// MARK: - Default properties

public extension Endpoint {
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
  
    
}


// MARK: - HTTP Method

public enum HTTPMethod {
    case get
    case patch
    case post
    
    var asString: String {
        switch self {
        case .get:
            return "GET"
        case .patch:
            return "PATCH"
        case .post:
            return "POST"
        }
    }
}
