//
//  UserTableViewCell.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    lazy var userImage: UIImageView = {
        let imageView = UIImageView().autoResizingOff()
        imageView.heightTo(80)
        imageView.widthTo(80)
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel().autoResizingOff()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    private func setupUI(){
        
        self.contentView.addSubview(userImage)
        self.contentView.addSubview(userNameLabel)
    }
    
    private func setupConstraints() {
        userImage.leadingToSuperview(16)
        userImage.topToSuperview(16)
        userImage.bottomToSuperview(16)
        
        userNameLabel.leadingToTrailing(of: userImage, margin: 10)
        userNameLabel.centerVertical(to: userImage)
        
    }
    
    public func setup(user: UserModel) {
        userImage.downloaded(from: user.avatarURL)
        userNameLabel.text = user.login
    }

}
