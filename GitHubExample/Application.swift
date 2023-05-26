//
//  Application.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
import NetworkSDK

struct Application {
    
    static func startApplication(){
        
        NetworkSDKInstance.intance.baseUrl = Strings.URL.baseUrl
    }
}

