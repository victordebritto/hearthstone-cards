//
//  ListCardsCategoryViewController.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 30/10/22.
//

import UIKit

protocol ListCardsCategoryViewControllerDelegate: AnyObject {
    func categoryItems(cards: [Card])
    func showError(error: Error)
}

class ListCardsCategoryViewController: UIViewController {
    
    static func create(viewModel: ListCardsCategoryViewModel) -> ListCardsCategoryViewController {
        let vc = ListCardsCategoryViewController()
        vc.viewModel = viewModel
        return vc
    }

    private var cardTableView: UITableView?
    
    private var cards: [Card] = []
    
    private var viewModel: ListCardsCategoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineLayout()
        view.displayActivityIndicator(shouldDisplay: true)
        
        viewModel?.delegate = self
        
        viewModel?.getCategoryItems()
    }
    
    private func defineLayout() {
        cardTableView = {
            let tb = UITableView()
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.separatorStyle = .singleLine
            tb.dataSource = self
            tb.delegate = self
            tb.backgroundColor = .white
            tb.register(ListCardsCategoryCustomTableCell.self, forCellReuseIdentifier: ListCardsCategoryCustomTableCell.identifier)
            return tb
        }()
        
        guard let cardTableView = cardTableView else { return  }
        view.addSubview(cardTableView)
        
        NSLayoutConstraint.activate([
            cardTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cardTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ListCardsCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCardsCategoryCustomTableCell.identifier,
                                                       for: indexPath) as? ListCardsCategoryCustomTableCell else {
            return UITableViewCell()
        }
        
        cell.setCardName(name: cards[indexPath.row].name)
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
  //  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Detail Card
 //   }
}

extension ListCardsCategoryViewController: UITableViewDelegate { }

extension ListCardsCategoryViewController: ListCardsCategoryViewModelDelegate {
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
    
    func categoryItems(cards: [Card]) {
        self.cards = cards
        
        cardTableView?.reloadData()
        view.displayActivityIndicator(shouldDisplay: false)
    }
}
