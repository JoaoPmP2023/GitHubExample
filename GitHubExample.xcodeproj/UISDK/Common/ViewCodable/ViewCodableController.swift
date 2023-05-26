//
//  ViewCodableController.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation
import UIKit

open class ViewCodableController: UIViewController, ViewCodable {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white   
    }
  
}
