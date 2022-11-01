//
//  ListCardsViewModel.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation

protocol ListCardsViewModelDelegate: AnyObject {
    func setCategoryData(category: [Category])
    func showError(error: Error)
}

protocol ListCardsViewModelCoordinatorDelegate: AnyObject {
    func openCategory(category: CategoryTypes, item: String)
}

class ListCardsViewModel {
        
    private let infoService: ServiceHearthstoreProtocol = ServiceHearthstone()
    
    weak var delegateCoordinator: ListCardsViewModelCoordinatorDelegate?
    weak var delegate: ListCardsViewModelDelegate?
    
    func getCategories() {
        
        infoService.getInfo { success, failure in
            if let failure {
                self.delegate?.showError(error: failure)
                return
            }
            
            guard let category = success?.parseToCategoryArray() else {
                self.delegate?.showError(error: failure ?? Error.genericError)
                return
            }
            self.delegate?.setCategoryData(category: category)
        }
    }
    
    func openCategory(category: CategoryTypes, item: String) {
        self.delegateCoordinator?.openCategory(category: category, item: item)
    }
}
