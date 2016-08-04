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
    
    class func gymLeaders() -> [Pokemon] {
        let lapras = Pokemon(name: "Lapras")
        let dragonite = Pokemon(name: "Dragonite")
        return [lapras, dragonite]
    }
    
    init(name: String){
        self.name = name
    }
}