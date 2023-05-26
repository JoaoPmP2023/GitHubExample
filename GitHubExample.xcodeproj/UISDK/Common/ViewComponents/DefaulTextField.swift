//
//  DefaulTextField.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation
import UIKit

open class DefaulTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        tintColor = .systemBlue
        font = .systemFont(ofSize: 16)
        borderStyle = .roundedRect
    }
}
