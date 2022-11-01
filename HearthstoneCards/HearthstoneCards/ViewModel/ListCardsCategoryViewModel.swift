//
//  ListCardsCategoryViewModel.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import Foundation

protocol ListCardsCategoryViewModelDelegate: AnyObject {
    func categoryItems(cards: [Card])
    func showError(error: Error)
}

protocol ListCardsCategoryViewModelCoordinator: AnyObject {
    func showCardDetail(card: Card)
    func dismiss()
}

class ListCardsCategoryViewModel {
        
    var category: CategoryTypes
    var itemSelect: String
    
    weak var delegate: ListCardsCategoryViewModelDelegate?
    weak var delegateCoordinator: ListCardsCategoryViewModelCoordinator?
    
    var service: ServiceHearthstoreProtocol?
    
    init(category: CategoryTypes, itemSelect: String) {
        self.category = category
        self.itemSelect = itemSelect
        service = ServiceHearthstone()
    }
    
    func getCategoryItems() {
        service?.getCardsByCategory(category: category, item: itemSelect, completion: { result, failure in
            if let failure {
                self.delegate?.showError(error: failure)
                self.delegateCoordinator?.dismiss()
                return
            }
            
            guard let result = result else {
                self.delegate?.showError(error: failure ?? Error.genericError)
                self.delegateCoordinator?.dismiss()
                return
            }
            
            self.delegate?.categoryItems(cards: result)
        })
    }
    
    func showDatailCard(card: Card) {
        delegateCoordinator?.showCardDetail(card: card)
    }
}
