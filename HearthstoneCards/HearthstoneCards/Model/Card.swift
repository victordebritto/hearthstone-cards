//
//  Card.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 25/10/22.
//

import Foundation

struct Card {
    
// TODO: Remover
//    A imagem principal do cartão
//    Nome ok
//    Descrição "flavor" ok
//    Descrição curta ok
//    Set pertencente ok
//    Tipo ok
//    Facção ok
//    Raridade ok
//    Ataque ok
//    Custo ok
//    Health ok
    
    let cardID: String
    let dbfID: Int
    let name: String
    let type: String
    let faction: String?
    let rarity: String?
    let cost: Int
    let attack: Int
    let health: Int
    let text: String
    let flavor: String?
    let artist: String?

    let img: String?
    let imgGold: String?
    
    init(cardID: String, dbfID: Int, name: String, type: String, faction: String?, rarity: String?, cost: Int, attack: Int, health: Int, text: String, flavor: String?, artist: String?, img: String?, imgGold: String?) {
        self.cardID = cardID
        self.dbfID = dbfID
        self.name = name
        self.type = type
        self.faction = faction
        self.rarity = rarity
        self.cost = cost
        self.attack = attack
        self.health = health
        self.text = text
        self.flavor = flavor
        self.artist = artist
        self.img = img
        self.imgGold = imgGold
    }
}
