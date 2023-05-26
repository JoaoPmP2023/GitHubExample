//
//  ReposTableViewCell.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    lazy var repoNameLabel: UILabel = {
       
        let label = UILabel().autoResizingOff()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI(){
        
        contentView.addSubview(repoNameLabel)
        repoNameLabel.leadingToSuperview(16)
        repoNameLabel.topToSuperview(16)
        
        
    }
    
    func setup(userRepo: UserRepo){
        repoNameLabel.text = userRepo.name
    }

}
