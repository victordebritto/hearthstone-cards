//
//  Info.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation

struct Info: Decodable {
    
    let classes: [String]
    let sets: [String]
    let types: [String]
    let factions: [String]
    let qualities: [String]
    let races: [String]
    
    init(classes: [String],
         sets: [String],
         types: [String],
         factions: [String],
         qualities: [String],
         races: [String]) {
        self.classes = classes
        self.sets = sets
        self.types = types
        self.factions = factions
        self.qualities = qualities
        self.races = races
    }
    
    func parseToCategoryArray() -> [Category] {
        
        return [Category(type: CategoryTypes.classes, items: self.classes),
                Category(type: CategoryTypes.sets, items: self.sets),
                Category(type: CategoryTypes.types, items: self.types),
                Category(type: CategoryTypes.factions, items: self.factions),
                Category(type: CategoryTypes.qualities, items: self.qualities),
                Category(type: CategoryTypes.races, items: self.races)]
    }
}

