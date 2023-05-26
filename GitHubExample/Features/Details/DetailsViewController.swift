//
//  DetailsViewController.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import UIKit
import UISDK

class DetailsViewController: ViewCodableController {

    let viewModel: DetailsViewModelProtocol
    
    lazy var userTitleLabel: UILabel = {
        let label = UILabel().autoResizingOff()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var userImage: UIImageView = {
       
        let imageView = UIImageView().autoResizingOff()
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.yellow.cgColor
        imageView.layer.masksToBounds = true
        imageView.heightTo(200)
        imageView.widthTo(200)
        
        return imageView
        
    }()
    
    lazy var reposDescriptionLabel: UILabel = {
        let label = UILabel().autoResizingOff()
        label.font = .systemFont(ofSize: 16)
        label.text = "Repositories: "
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView().autoResizingOff()
        tableView.register(ReposTableViewCell.self, forCellReuseIdentifier: ReposTableViewCell.cellIdentifier())
        return tableView
    }()
    
    init(viewModel: DetailsViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
        configurePage()
        configTableView()
        viewModel.viewDidLoad()
    }
    
    private func configurePage(){
        self.navigationItem.title = viewModel.user.login
       
        userImage.downloaded(from: viewModel.user.avatarURL)
    }
    
    private func observeViewModel() {
        
        viewModel.onDataSourceChanged = { [weak self] in
            
            self?.userTitleLabel.text = self?.viewModel.userDetails?.name
        }
        
        viewModel.onReposChanged = { [weak self] in
            self?.tableView.reloadData()
        }
      
    }
    
    private func configTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DetailsViewController {
    
    func setupHierarchy(){
        view.addSubview(userImage)
        view.addSubview(userTitleLabel)
        view.addSubview(reposDescriptionLabel)
        view.addSubview(tableView)
    }
    func setupConstraints(){
        
        userImage.topToSuperview(20)
        userImage.centerHorizontalToSuperView()
        userTitleLabel.topToBottom(of: userImage,margin: 20)
        userTitleLabel.centerHorizontalToSuperView()
        
        reposDescriptionLabel.topToBottom(of: userTitleLabel, margin: 10)
        reposDescriptionLabel.leadingToSuperview(16)
        tableView.topToBottom(of: reposDescriptionLabel, margin: 16)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
    }
    
    func setupAdditionalConfigs(){
        
    }

}
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ReposTableViewCell.cellIdentifier(), for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repos.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        guard let cell = cell as? ReposTableViewCell else { return }
        
        cell.setup(userRepo: viewModel.getRepoItem(row: indexPath.row))
    }
    
}
