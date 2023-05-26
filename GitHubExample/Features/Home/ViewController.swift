//
//  ViewController.swift
//  GitHubExample
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import UIKit
import UISDK

class ViewController: ViewCodableController {

    lazy var tableView: UITableView = {
        let tableView = UITableView().autoResizingOff()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier())
        return tableView
    }()
    
    let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        observeViewModel()
        viewModel.viewDidLoad()
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func observeViewModel() {
        viewModel.onDataSourceChanged = { [weak self] in
            
            self?.tableView.reloadData()
        }
        
        viewModel.onGoToDetails = { [weak self] user in
            
            let viewController = DetailsViewController(viewModel: DetailsViewModel(user: user))
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        
        viewModel.onDataSourceError = { [weak self] in
            self?.showProblemViewController(screenType: .error)
        }
        
        viewModel.onDataSourceEmpty = { [weak self] in
            
            self?.showProblemViewController(screenType: .noData)
        }
        
        viewModel.onInformationLoading = { [weak self] loading in
            
            self?.loadingView(show: loading)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier(), for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? UserTableViewCell else {
            return
        }
        cell.setup(user: viewModel.getUser(row: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(row: indexPath.row)
    }
}

extension ViewController {
    
    func setupHierarchy(){
        view.addSubview(tableView)
    }
    func setupConstraints(){
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupAdditionalConfigs(){
        
    }

}
