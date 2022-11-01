//
//  ListCardsViewModel.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation

protocol ListCardsViewModelDelegate: AnyObject {
    func setCategoryData(category: [Category])
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
                //show modal erro
            }
            
            guard let category = success?.parseToCategoryArray() else {
                // call erro
                return
            }
            self.delegate?.setCategoryData(category: category)
        }
    }
    
    func openCategory(category: CategoryTypes, item: String) {
        self.delegateCoordinator?.openCategory(category: category, item: item)
    }
}
