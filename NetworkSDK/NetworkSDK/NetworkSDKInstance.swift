//
//  SDKInstance.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 19/01/23.
//

import Foundation

open class NetworkSDKInstance: NetworkSDKInstanceProtocol {
    
    
    public init(){}
    public var baseUrl: String?
    public static var intance: NetworkSDKInstanceProtocol = NetworkSDKInstance()
    
}
