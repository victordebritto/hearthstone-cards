//
//  ListCardsViewController.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import UIKit

class ListCardsViewController: UIViewController {
    
        
    private var tableView: UITableView!
    
    private var categories: [Category]?
    
    var viewModel: ListCardsViewModel?
    
    static func create(viewModel: ListCardsViewModel) -> ListCardsViewController {
        let viewcontroller = ListCardsViewController()
        viewcontroller.viewModel = viewModel
        
        return viewcontroller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineLayout()
        view.displayActivityIndicator(shouldDisplay: true)
        viewModel?.delegate = self
        viewModel?.getCategories()
        self.navigationItem.title = "Hearthstone"
        self.navigationItem.style = .navigator

    }
    
    private func defineLayout() {
        
        tableView = {
            let tb = UITableView()
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.dataSource = self
            tb.delegate = self
            tb.backgroundColor = .white
            tb.register(CustomListTableViewCell.self, forCellReuseIdentifier: CustomListTableViewCell.identifier)
            return tb
        }()
        
        view.addSubview(tableView)
 
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ListCardsViewController: UITableViewDelegate { }

extension ListCardsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomListTableViewCell.identifier, for: indexPath) as! CustomListTableViewCell
        
        cell.backgroundColor = .white
        cell.viewModel = viewModel
        guard let category = categories?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setData(typeSelect: category.type, nameItems: category.items)
        
        return cell
    }
}

extension ListCardsViewController:  ListCardsViewModelDelegate {
    func setCategoryData(category: [Category]) {
        self.categories = category
        tableView.reloadData()
        
        view.displayActivityIndicator(shouldDisplay: false)
    }
    
    func showError(error: Error) {
        var title = ""
        var message = ""
        switch error {
        case .errorRequest(_):
            title = "Serviço"
            message = "Erro ao tentar acessar o servico da Hearthstone"
        case .invalidEndpoint:
            title = "Endpoit"
            message = "End point incorreto"
        case .genericError:
            title = "Erro"
            message = "Erro inesperado, tente novamente"
        }
        self.showAlert(title: title, message: message, actionTitle: "OK")
    }
}
