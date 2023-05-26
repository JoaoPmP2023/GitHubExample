//
//  ProblemViewController.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation
import UIKit

final class ProblemViewController: ViewCodableController {
 
    lazy var imageViewProblem: UIImageView = {
       
        let imageView = UIImageView().autoResizingOff()
        imageView.heightTo(100)
        imageView.widthTo(100)
        return imageView
        
    }()
    
    
    lazy var labelProblem: UILabel = {
       
        let label = UILabel().autoResizingOff()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var closeButton: UIButton = {
       
        let button = UIButton(type: .close).autoResizingOff()
        button.addTarget(self, action: #selector(onCloseTapped), for: .touchUpInside)
        return button
        
    }()
    
    let screenType: ProblemEnum
    
    init(screenType: ProblemEnum){
        self.screenType = screenType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(imageViewProblem)
        view.addSubview(labelProblem)
        view.addSubview(closeButton)
        
        imageViewProblem.centerHorizontalToSuperView()
        imageViewProblem.centerVerticalToSuperView(constant: -40)
        
        labelProblem.topToBottom(of: imageViewProblem, margin: 20)
        labelProblem.centerHorizontalToSuperView()
        labelProblem.leadingToSuperview(16)
        labelProblem.trailingToSuperview(16)
        
        closeButton.topToBottom(of: labelProblem, margin: 20)
        closeButton.centerHorizontalToSuperView()
        
        
        imageViewProblem.image = UIImage(systemName: screenType.imageName)
        labelProblem.text = screenType.message
    }
    
    @objc func onCloseTapped() {
        self.dismiss(animated: true)
    }
}
