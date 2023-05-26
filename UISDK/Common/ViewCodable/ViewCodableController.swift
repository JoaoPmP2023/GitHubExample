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
    
    public func loadingView(show:Bool) {
        
        
        if show {
            let loadingVC = LoadingViewController()
            
            // Animate loadingVC over the existing views on screen
            loadingVC.modalPresentationStyle = .overCurrentContext
            
            // Animate loadingVC with a fade in animation
            loadingVC.modalTransitionStyle = .crossDissolve
            
            present(loadingVC, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true)
        }
        
    }
    
    public func showProblemViewController(screenType: ProblemEnum) {
        
        let loadingVC = ProblemViewController(screenType: screenType)
        
        // Animate loadingVC over the existing views on screen
        loadingVC.modalPresentationStyle = .overCurrentContext
        
        // Animate loadingVC with a fade in animation
        loadingVC.modalTransitionStyle = .crossDissolve
        
        present(loadingVC, animated: true, completion: nil)
    }
  
}
