//
//  DetailCardCoordinator.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 01/11/22.
//

import UIKit

class DetailCardCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var card: Card
    
    init(navigationController: UINavigationController, card: Card) {
        self.navigationController = navigationController
        self.card = card
    }
    
    func start() {
        let viewModel = DetailCardViewModel(card: self.card)
        viewModel.delegateCoordinator = self
        let controller = DetailCardViewController.create(viewModel: viewModel, card: self.card)
        navigationController.navigationBar.topItem?.title = ""
        navigationController.pushViewController(controller, animated: true)
    }
}
extension DetailCardCoordinator: DetailCardViewModelCoordinatorDelegate {
    
}
