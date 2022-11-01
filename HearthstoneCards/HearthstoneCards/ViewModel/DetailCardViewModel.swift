//
//  DetailCardViewModel.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 01/11/22.
//

import Foundation

protocol DetailCardViewModelDelegate: AnyObject {
    
}

protocol DetailCardViewModelCoordinatorDelegate: AnyObject {
    
}

class DetailCardViewModel {
    
    weak var delegate: DetailCardViewModelDelegate?
    weak var delegateCoordinator: DetailCardViewModelCoordinatorDelegate?
    
    private let card: Card
    
    init(card: Card) {
        self.card = card
    }
}
