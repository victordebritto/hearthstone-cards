//
//  ListCardsViewController.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import UIKit

class ListCardsViewController: UIViewController {
    
        
    private var tableView: UITableView!
    private var loading: UIActivityIndicatorView!
    private var loadView: UIView!
    
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
        loadingState(isOn: true)
        viewModel?.delegate = self
        viewModel?.getCategories()
        self.navigationItem.title = "Hearthstone"
        self.navigationItem.style = .navigator

    }
    
    private func loadingState(isOn: Bool) {
        switch isOn{
            case true:
                loadView.isHidden = false
                loading.startAnimating()
            case false:
                loadView.isHidden = true
                loading.stopAnimating()
        }
    }
    
    private func defineLayout() {
        
        loadView = {
            let vw = UIView()
            vw.translatesAutoresizingMaskIntoConstraints = false
            vw.backgroundColor = .white
            vw.isHidden = false
            return vw
        }()
        
        loading = {
            let l = UIActivityIndicatorView(style: .large)
            l.translatesAutoresizingMaskIntoConstraints = false
            l.color = .gray
            return l
        }()
        
        tableView = {
            let tb = UITableView()
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.separatorStyle = .singleLine
            tb.dataSource = self
            tb.delegate = self
            tb.backgroundColor = .white
            tb.register(CustomListTableViewCell.self, forCellReuseIdentifier: CustomListTableViewCell.identifier)
            return tb
        }()
        
        view.addSubview(tableView)
        
        view.addSubview(loadView)
        loadView.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadView.topAnchor.constraint(equalTo: view.topAnchor),
            loadView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loading.centerYAnchor.constraint(equalTo: loadView.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: loadView.centerXAnchor),
            
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
        
        loadingState(isOn: false)
    }
}
