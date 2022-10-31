//
//  Category.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 29/10/22.
//

import Foundation

struct Category {
    
    let type: CategoryTypes
    let items: [String]
    
    init(type: CategoryTypes, items: [String]) {
        self.type = type
        self.items = items
    }

}

enum CategoryTypes : String {
    case classes = "Classes"
    case sets = "Sets"
    case types = "Types"
    case factions = "Factions"
    case qualities = "Qualities"
    case races = "Races"
}
