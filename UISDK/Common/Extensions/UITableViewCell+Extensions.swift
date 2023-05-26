//
//  UITableViewCell+Extensions.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation
import UIKit


extension UITableViewCell {
    
    public static func cellIdentifier() -> String {
        String(describing: self)
    }
}
