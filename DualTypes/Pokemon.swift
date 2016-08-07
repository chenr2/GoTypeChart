//
//  Pokemon.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

enum DamageType {
    case single, double, half
}

enum Tier {
    case S, A, B, F
}

class Pokemon {
    var name: String
    var defense: [ElementType]
    var vulnerabilitySet: [ElementType: DamageType]
    var pokedex: Int
    var tier: Tier
    var bestCounter: [ElementType] {
        return Pokemon.directCounter(defense)
    }
    
    class func directCounter(type: [ElementType]) -> [ElementType] {
        switch type.count {
        case 1:
            guard let singleElement = type.first else { return [] }
            switch singleElement {
            case .Normal:
                return [.Fight]
            case .Fight:
                return [.Fairy, .Flying]
            case .Flying:
                return [.Electric, .Rock]
            case .Poison:
                return [.Ground]
            case .Ground:
                return [.Grass]
            case .Rock:
                return [.Fight, .Steel]
            case .Bug:
                return [.Fire, .Flying]
            case .Ghost:
                return [.Dark]
            case .Steel:
                return [.Fire]
            case .Fire:
                return [.Rock, .Water]
            case .Water:
                return [.Grass]
            case .Grass:
                return [.Bug, .Flying, .Poison]
            case .Electric:
                return [.Ground]
            case .Psychic:
                return [.Dark]
            case .Ice:
                return [.Fire, .Steel]
            case .Dragon:
                return [.Fairy]
            case .Dark:
                return [.Fairy, .Fight]
            case .Fairy:
                return [.Poison, .Steel]
            }
        case 2:
            guard let firstElement = type.first,
                let secondElement = type.last else { return [] }
            switch (firstElement, secondElement) {
            case (.Psychic, .Grass), (.Grass, .Psychic): // exegguctor
                return [.Bug]
            case (.Dragon, .Flying), (.Flying, .Dragon): // dragonite
                return [.Ice]
            case (.Fire, .Flying), (.Flying, .Fire): // charizard
                return [.Rock]
            case (.Psychic, .Water), (.Water, .Psychic): // showbro
                return [] // that's why psychic is good
            case (.Ice, .Water), (.Water, .Ice): // lapras
                return [] // that's why lapras is good
            case (.Grass, .Poison), (.Poison, .Grass): // venasaur, victreebel
                return [] // nothing really stands out among the super effectives
            case (.Water, .Fight), (.Fight, .Water): // poliwrath
                return [] // nothing really stands out among the super effectives
            case (.Ground, .Poison), (.Poison, .Ground): // nidoking, nidoqueen
                return [] // nothing really stands out among the super effectives
                
            default:
                return []
            }
        default:
            break
        }
        return []
    }
    
    class func vulnerabilitySet(element: ElementType) -> [ElementType: DamageType] {
        var returnSet = Pokemon.identityVulnerabilitySet()
        switch element {
        case .Normal:
            returnSet[.Fight] = .double
            returnSet[.Ghost] = .half
        case .Fight:
            returnSet[.Flying] = .double
            returnSet[.Rock] = .half
            returnSet[.Bug] = .half
            returnSet[.Psychic] = .double
            returnSet[.Dark] = .half
            returnSet[.Fairy] = .double
        case .Flying:
            returnSet[.Fight] = .half
            returnSet[.Ground] = .half
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
            returnSet[.Electric] = .half
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
            returnSet[.Normal] = .half
            returnSet[.Fight] = .half
            returnSet[.Poison] = .half
            returnSet[.Bug] = .half
            returnSet[.Ghost] = .double
            returnSet[.Dark] = .double
        case .Steel:
            returnSet[.Normal] = .half
            returnSet[.Fight] = .double
            returnSet[.Flying] = .half
            returnSet[.Poison] = .half
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
            returnSet[.Dragon] = .half
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

        // multiply by one
        if a == .single {
            return b
        }
        if b == .single {
            return a
        }
        // multiply halves or double
        switch (a, b) {
        case (.half, .half):
            return .half
        case (.double, .double):
            return .double
        default:
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
        let bulbasaur = Pokemon(pokedex: 1, name: "Bulbasaur", defense: [.Grass, .Poison], tier: .F)
        let ivysaur = Pokemon(pokedex: 2, name: "Ivysaur", defense: [.Grass, .Poison], tier: .B)
        let venasaur = Pokemon(pokedex: 3, name: "Venasaur", defense: [.Grass, .Poison], tier: .S)
        let charmander = Pokemon(pokedex: 4, name: "Charmander", defense: [.Fire], tier: .F)
        let charmeleon = Pokemon(pokedex: 5, name: "Charmeleon", defense: [.Fire], tier: .B)
        let charizard = Pokemon(pokedex: 6, name: "Charizard", defense: [.Fire, .Flying], tier: .S)
        let squirtle = Pokemon(pokedex: 7, name: "Squirtle", defense: [.Water], tier: .F)
        let wartortle = Pokemon(pokedex: 8, name: "Wartortle", defense: [.Water], tier: .B)
        let blastoise = Pokemon(pokedex: 9, name: "Blastoise", defense: [.Water], tier: .A)
        let caterpie = Pokemon(pokedex: 10, name: "Caterpie", defense: [.Bug], tier: .F)
        let nidoking = Pokemon(pokedex: 34, name: "Nidoking", defense: [.Ground, .Poison], tier: .S)
        let nidoqueen = Pokemon(pokedex: 31, name: "Nidoqueen", defense: [.Ground, .Poison], tier: .S)
        //        let foo = Pokemon(pokedex: 0, name: "", defense: [], tier: .F)
        let golduck = Pokemon(pokedex: 55, name: "Golduck", defense: [.Water], tier: .A)
        let arcanine = Pokemon(pokedex: 59, name: "Arcanine", defense: [.Fire], tier: .S)
        let poliwrath = Pokemon(pokedex: 62, name: "Poliwrath", defense: [.Fight, .Water], tier: .S)
        let machamp = Pokemon(pokedex: 68, name: "Machamp", defense: [.Fight], tier: .S)
        let victreebel = Pokemon(pokedex: 71, name: "Victreebel", defense: [.Grass, .Poison], tier: .S)
        let slowbro = Pokemon(pokedex: 80, name: "Slowbro", defense: [.Psychic, .Water], tier: .S)
        let muk = Pokemon(pokedex: 89, name: "Muk", defense: [.Poison], tier: .S)
        let exeggutor = Pokemon(pokedex: 103, name: "Exeggutor", defense: [.Psychic, .Grass], tier: .S)
        let gyarados = Pokemon(pokedex: 130, name: "Gyarados", defense: [.Flying, .Water], tier: .A)
        let lapras = Pokemon(pokedex: 131, name: "Lapras", defense: [.Ice, .Water], tier: .S)
        let vaporeon = Pokemon(pokedex: 134, name: "Vaporeon", defense: [.Water], tier: .S)
        let jolteon = Pokemon(pokedex: 135, name: "Jolteon", defense: [.Electric], tier: .A)
        let flareon = Pokemon(pokedex: 136, name: "Flareon", defense: [.Fire], tier: .S)
        let aerodactyl = Pokemon(pokedex: 142, name: "Aerodactyl", defense: [.Flying, .Rock], tier: .B)
        let snorlax = Pokemon(pokedex: 143, name: "Snorlax", defense: [.Normal], tier: .A)
        let dragonite = Pokemon(pokedex: 149, name: "Dragonite", defense: [.Flying, .Dragon], tier: .S)
        
        return [
            bulbasaur, ivysaur, venasaur,
            charmander, charmeleon, charizard,
            squirtle, wartortle, blastoise,
            caterpie,
            vaporeon, flareon, jolteon,
            lapras, dragonite, gyarados,
            snorlax, golduck, exeggutor,
            slowbro, aerodactyl, arcanine,
            muk, machamp, victreebel,
            poliwrath, nidoking, nidoqueen
        ]
    }
    
    init(pokedex: Int, name: String, defense: [ElementType], tier: Tier){
        self.pokedex = pokedex
        self.name = name
        self.defense = defense
        self.tier = tier
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