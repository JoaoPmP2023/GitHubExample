//
//  UITextField+Extensions.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation
import UIKit


extension UITextField {
    public func setMaxLength(_ maxLength: Int) {
        guard let text = self.text
        else {
            return
        }
        if text.count > maxLength {
            deleteBackward()
        }
        
    }
}
