//
//  ListCardsByCategoryCoordinator.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import UIKit

class ListCardsByCategoryCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var category: CategoryTypes
    var itemSelect: String
    
    init(navigationController: UINavigationController, category: CategoryTypes, itemSelect: String) {
        self.navigationController = navigationController
        self.category = category
        self.itemSelect = itemSelect
    }
    
    func start() {
        let viewModel = ListCardsCategoryViewModel(category: self.category,
                                                   itemSelect: self.itemSelect)
        viewModel.delegateCoordinator = self
        let viewController = ListCardsCategoryViewController.create(viewModel: viewModel)
      
        navigationController.navigationBar.topItem?.title = ""
        navigationController.pushViewController(viewController, animated: true)
                
    }
}

extension ListCardsByCategoryCoordinator: ListCardsCategoryViewModelCoordinator {
    func selectCard() {
        //OpenDetail Card
    }
}
