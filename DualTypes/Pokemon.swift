//
//  Pokemon.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

enum DamageType {
    case none, single, double, quadruple, half, quarter
}

class Pokemon {
    var name: String
    var defense: [ElementType]
    var vulnerabilitySet: [ElementType: DamageType]
    var pokedex: Int
    
    class func vulnerabilitySet(element: ElementType) -> [ElementType: DamageType] {
        var returnSet = Pokemon.identityVulnerabilitySet()
        switch element {
        case .Normal:
            returnSet[.Fight] = .double
            returnSet[.Ghost] = .none
        case .Fight:
            returnSet[.Flying] = .double
            returnSet[.Rock] = .half
            returnSet[.Bug] = .half
            returnSet[.Psychic] = .double
            returnSet[.Dark] = .half
            returnSet[.Fairy] = .double
        case .Flying:
            returnSet[.Fight] = .half
            returnSet[.Ground] = .none
            returnSet[.Rock] = .double
            returnSet[.Bug] = .half
            returnSet[.Grass] = .half
            returnSet[.Electric] = .double
            returnSet[.Ice] = .double
        case .Poison:
            returnSet[.Fight] = .half
            returnSet[.Poison] = .half
            returnSet[.Ground] = .double
            returnSet[.Bug] = .half
            returnSet[.Grass] = .half
            returnSet[.Psychic] = .double
            returnSet[.Fairy] = .half
        case .Ground:
            returnSet[.Poison] = .half
            returnSet[.Rock] = .half
            returnSet[.Water] = .double
            returnSet[.Grass] = .double
            returnSet[.Electric] = .none
            returnSet[.Ice] = .double
        case .Rock:
            returnSet[.Normal] = .half
            returnSet[.Fight] = .double
            returnSet[.Flying] = .half
            returnSet[.Poison] = .half
            returnSet[.Ground] = .double
            returnSet[.Steel] = .double
            returnSet[.Fire] = .half
            returnSet[.Water] = .double
            returnSet[.Grass] = .double
        case .Bug:
            returnSet[.Fight] = .half
            returnSet[.Flying] = .double
            returnSet[.Ground] = .half
            returnSet[.Rock] = .double
            returnSet[.Fire] = .double
            returnSet[.Grass] = .half
        case .Ghost:
            returnSet[.Normal] = .none
            returnSet[.Fight] = .none
            returnSet[.Poison] = .half
            returnSet[.Bug] = .half
            returnSet[.Ghost] = .double
            returnSet[.Dark] = .double
        case .Steel:
            returnSet[.Normal] = .half
            returnSet[.Fight] = .double
            returnSet[.Flying] = .half
            returnSet[.Poison] = .none
            returnSet[.Ground] = .double
            returnSet[.Rock] = .half
            returnSet[.Bug] = .half
            returnSet[.Steel] = .half
            returnSet[.Fire] = .double
            returnSet[.Grass] = .half
            returnSet[.Psychic] = .half
            returnSet[.Ice] = .half
            returnSet[.Dragon] = .half
            returnSet[.Fairy] = .half
        case .Fire:
            returnSet[.Ground] = .double
            returnSet[.Rock] = .double
            returnSet[.Bug] = .half
            returnSet[.Steel] = .half
            returnSet[.Fire] = .half
            returnSet[.Water] = .double
            returnSet[.Grass] = .half
            returnSet[.Ice] = .half
            returnSet[.Fairy] = .half
        case .Water:
            returnSet[.Steel] = .half
            returnSet[.Fire] = .half
            returnSet[.Water] = .half
            returnSet[.Grass] = .double
            returnSet[.Electric] = .double
            returnSet[.Ice] = .half
        case .Grass:
            returnSet[.Flying] = .double
            returnSet[.Poison] = .double
            returnSet[.Ground] = .half
            returnSet[.Bug] = .double
            returnSet[.Fire] = .double
            returnSet[.Water] = .half
            returnSet[.Grass] = .half
            returnSet[.Electric] = .half
            returnSet[.Ice] = .double
        case .Electric:
            returnSet[.Flying] = .half
            returnSet[.Ground] = .double
            returnSet[.Steel] = .half
            returnSet[.Electric] = .half
        case .Psychic:
            returnSet[.Fight] = .half
            returnSet[.Bug] = .double
            returnSet[.Ghost] = .double
            returnSet[.Psychic] = .half
            returnSet[.Dark] = .double
        case .Ice:
            returnSet[.Fight] = .double
            returnSet[.Rock] = .double
            returnSet[.Steel] = .double
            returnSet[.Fire] = .double
            returnSet[.Ice] = .half
        case .Dragon:
            returnSet[.Fire] = .half
            returnSet[.Water] = .half
            returnSet[.Grass] = .half
            returnSet[.Electric] = .half
            returnSet[.Ice] = .double
            returnSet[.Dragon] = .double
            returnSet[.Fairy] = .double
        case .Fairy:
            returnSet[.Fight] = .half
            returnSet[.Poison] = .double
            returnSet[.Bug] = .half
            returnSet[.Steel] = .double
            returnSet[.Dragon] = .none
            returnSet[.Dark] = .half
        default:
            break
        }
        return returnSet
    }
    
    class func identityVulnerabilitySet() -> [ElementType: DamageType] {
        return [
            .Normal: .single,
            .Fight: .single,
            .Flying: .single,
            .Poison: .single,
            .Ground: .single,
            .Rock: .single,
            .Bug: .single,
            .Ghost: .single,
            .Steel: .single,
            .Fire: .single,
            .Water: .single,
            .Grass: .single,
            .Electric: .single,
            .Psychic: .single,
            .Ice: .single,
            .Dragon: .single,
            .Dark: .single,
            .Fairy: .single
        ]
    }
    
    class func multiplyDamageTypes(a:DamageType?, b:DamageType?) -> DamageType {
        guard let a = a else { return b! }
        guard let b = b else { return a }
        // multiply by zero
        if a == .none || b == .none {
            return .none
        }
        if a == .single {
            return b
        }
        // multiply by one
        if b == .single {
            return a
        }
        // multiply halves or double
        switch (a, b) {
        case (.half, .double), (.double, .half):
            return .single
        case (.half, .half):
            return .quarter
        case (.double, .double):
            return .quadruple
        default:
            print("This should not happen")
            return .single
        }
    }
    
    class func multiplyVulnerabilitySets(setA: [ElementType: DamageType], setB: [ElementType: DamageType]) -> [ElementType: DamageType] {
        var productVulnerabilities = Pokemon.identityVulnerabilitySet()
        let keys = Array(setA.keys) + Array(setB.keys)
        let uniqueKeys = Array(Set(keys))
        for key in uniqueKeys {
            productVulnerabilities[key] = multiplyDamageTypes(setA[key]!, b: setB[key]!)
        }
        return productVulnerabilities
    }
    
    class func gymLeaders() -> [Pokemon] {
        let vaporeon = Pokemon(pokedex: 134, name: "Vaporeon", defense: [.Water])
        let flareon = Pokemon(pokedex: 136, name: "Flareon", defense: [.Fire])
        let jolteon = Pokemon(pokedex: 135, name: "Jolteon", defense: [.Electric])
        let lapras = Pokemon(pokedex: 131, name: "Lapras", defense: [.Ice, .Water])
        let gyarados = Pokemon(pokedex: 130, name: "Gyarados", defense: [.Flying, .Water])
        let snorlax = Pokemon(pokedex: 143, name: "Snorlax", defense: [.Normal])
        let dragonite = Pokemon(pokedex: 149, name: "Dragonite", defense: [.Flying, .Dragon])
        let golduck = Pokemon(pokedex: 55, name: "Golduck", defense: [.Water])
        let exeggutor = Pokemon(pokedex: 103, name: "Exeggutor", defense: [.Psychic, .Grass])
        let slowbro = Pokemon(pokedex: 80, name: "Slowbro", defense: [.Psychic, .Water])
        let aerodactyl = Pokemon(pokedex: 142, name: "Aerodactyl", defense: [.Flying, .Rock])
        let arcanine = Pokemon(pokedex: 59, name: "Arcanine", defense: [.Fire])
        
        return [
            vaporeon, flareon, jolteon,
            lapras, dragonite, gyarados,
            snorlax, golduck, exeggutor,
            slowbro, aerodactyl, arcanine
        ]
    }
    
    init(pokedex: Int, name: String, defense: [ElementType]){
        self.pokedex = pokedex
        self.name = name
        self.defense = defense
        let vulnerabilitySets = defense.map {
            return Pokemon.vulnerabilitySet($0)
        }
        if defense.count == 1 {
            self.vulnerabilitySet = vulnerabilitySets.first!
        } else {
            self.vulnerabilitySet = Pokemon.multiplyVulnerabilitySets(vulnerabilitySets.first!, setB: vulnerabilitySets.last!)
        }
    }
}