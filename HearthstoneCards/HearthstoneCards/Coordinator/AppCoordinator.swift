//
//  AppCoordinator.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let viewModel = ListCardsViewModel()
        viewModel.delegateCoordinator = self
        let vc = ListCardsViewController.create(viewModel: viewModel)

        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        guard let navigation = window.rootViewController as? UINavigationController else { return  }
        navigationController = navigation
        
        self.childCoordinators.append(self)
    }
}

extension AppCoordinator: ListCardsViewModelCoordinatorDelegate {
    func openCategory(category: CategoryTypes, item: String) {
        let coordinator = ListCardsByCategoryCoordinator(navigationController: self.navigationController,
                                                         category: category,
                                                         itemSelect: item)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
