//
//  ViewCodable.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 20/01/23.
//

import Foundation

@objc
protocol ViewCodable {
    /**
     A method responsible for creating the view hierarchy.
     
     - Attention: In order to keep the logic of this protocol, try to use this method only for hierarchy purposes.
     
     ~~~
        // Example of setupHierarchy
        func setupHierarchy() {
            addSubview(someContainerView)
            someContainerView.addSubview(someLabel)
            someContainerView.addSubview(someButton)
        }
     ~~~
     */
    @objc optional
    func setupHierarchy()
    
    /**
     A method responsible for creating and configuring the view constraints.
     
     - Attention: In order to keep the logic of this protocol, try to use this method only for constraint purposes.
     
     ~~~
        // Example of setupConstraints
        func setupConstraints() {
            someView.translatesAutoresizingMaskIntoConstraints = false
     
             NSLayoutConstraint.activate([
                 someView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                 someView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                 someView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                 someView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
             ])
        }
     ~~~
     
     - Note: It's recommended to use private functions to configure the constraints for each component. It will make the code inside the setupConstraints method cleaner.
     */
    @objc optional
    func setupConstraints()
    
    /**
     A method responsible for adding additional setups for the views.
     
     - Attention: In order to keep the logic of this protocol, try to use this method only for setup purposes.
     
     ~~~
        // Example of setupAdditionalConfigs
        func setupAdditionalConfigs() {
            backgroundColor = .red
            someView.delegate = self
        }
     ~~~

     */
    @objc optional
    func setupAdditionalConfigs()
}

extension ViewCodable {
    func setupUI() {
        setupHierarchy?()
        setupConstraints?()
        setupAdditionalConfigs?()
    }
}
