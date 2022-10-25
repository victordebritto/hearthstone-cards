//
//  Info.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation


struct Info {
    
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
    
}
// TODO: Remover
//Cards by Class
//Card Set
//Cards by Type
//Cards by Faction
//Cards by Quality
//Cards by Race
