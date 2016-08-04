//
//  Pokemon.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

class Pokemon {
    var name: String
    var defense: [ElementType]
    
    class func gymLeaders() -> [Pokemon] {
        let vaporeon = Pokemon(name: "Vaporeon", defense: [.Water])
        let lapras = Pokemon(name: "Lapras", defense: [.Ice, .Water])
        let dragonite = Pokemon(name: "Dragonite", defense: [.Flying, .Dragon])
        return [vaporeon, lapras, dragonite, lapras, dragonite]
    }
    
    init(name: String, defense: [ElementType]){
        self.name = name
        self.defense = defense
    }
}