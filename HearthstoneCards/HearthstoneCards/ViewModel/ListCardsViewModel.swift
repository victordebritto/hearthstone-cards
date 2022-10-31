//
//  ListCardsViewModel.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation

protocol ListCardsViewModelDelegate {
    func getCategories()
}

class ListCardsViewModel {
        
    private let infoService: InfoServiceProtocol = InfoService()
    
    var view: ListCardsViewDelegate
    
    private func callInfo() {
        
    }
    
    init(view: ListCardsViewDelegate) {
        self.view = view
    }
}

extension ListCardsViewModel: ListCardsViewModelDelegate {
    
    func getCategories() {
        
        infoService.getInfo { success, failure in
            if let failure {
                //show modal erro
            }
            
            guard let category = success?.parseToCategoryArray() else {
                // call erro
                return
            }
            self.view.setCategoryData(category: category)
        }
    }
    
    // TODO: Remover
    func mock() -> [Category] {
        let info = Info(classes: ["Teste1", "teste 2"],
                       sets: ["Teste1", "teste 2", "Teste1", "teste 2"],
                       types: ["Teste1", "teste 2","Teste1", "teste 2"],
                       factions: ["Teste1", "teste 2","Teste1", "teste 2", "Teste1", "teste 2"],
                       qualities: ["Teste1"],
                       races: ["Teste1", "teste 2"]).parseToCategoryArray()
        return info
    }
}
