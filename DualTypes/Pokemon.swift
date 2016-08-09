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
    case S, A, B
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
            case (.Fire, .Flying), (.Flying, .Fire): // charizard, moltres
                return [.Rock]
            case (.Psychic, .Water), (.Water, .Psychic): // showbro, starmie
                return [] // that's why psychic is good
            case (.Ice, .Water), (.Water, .Ice): // lapras
                return [] // that's why lapras is good
            case (.Grass, .Poison), (.Poison, .Grass): // venasaur, victreebel, vileplume
                return [] // nothing really stands out among the super effectives
            case (.Water, .Fight), (.Fight, .Water): // poliwrath
                return [] // nothing really stands out among the super effectives
            case (.Ground, .Poison), (.Poison, .Ground): // nidoking, nidoqueen
                return [] // nothing really stands out among the super effectives
            case (.Ground, .Rock), (.Rock, .Ground): // golem, rhydon
                return [.Water, .Grass] // two!
            case (.Rock, .Water), (.Water, .Rock): // omastar
                return [.Electric] // 4x
            case (.Normal, .Fairy), (.Fairy, .Normal):
                return [] // both poison and steel are fine, but one is not better than the other
            case (.Water, .Poison), (.Poison, .Water): // tentacruel
                return [.Electric, .Psychic]
            case (.Bug, .Flying), (.Flying, .Bug): // scyther
                return [.Rock]
            case (.Ghost, .Poison), (.Poison, .Ghost): // gengar
                return [.Dark, .Ground]
            case (.Normal, .Flying), (.Flying, .Normal): // pidgeot
                return [.Rock] // all are pretty good, but Rock is resistant to both!
            case (.Poison, .Flying), (.Flying, .Poison): // golbat
                return [.Rock]
            case (.Bug, .Poison), (.Poison, .Bug): // venomoth
                return [.Fire, .Flying, .Rock]
            case (.Electric, .Flying), (.Flying, .Electric): // zapdos
                return [.Rock]
            case (.Ice, .Flying), (.Flying, .Ice): // articuno
                return [.Rock]
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
        let ivysaur = Pokemon(pokedex: 2, name: "Ivysaur", defense: [.Grass, .Poison], tier: .B)
        let venasaur = Pokemon(pokedex: 3, name: "Venasaur", defense: [.Grass, .Poison], tier: .S)
        let charmeleon = Pokemon(pokedex: 5, name: "Charmeleon", defense: [.Fire], tier: .B)
        let charizard = Pokemon(pokedex: 6, name: "Charizard", defense: [.Fire, .Flying], tier: .S)
        let wartortle = Pokemon(pokedex: 8, name: "Wartortle", defense: [.Water], tier: .B)
        let blastoise = Pokemon(pokedex: 9, name: "Blastoise", defense: [.Water], tier: .A)
        let pidgeot = Pokemon(pokedex: 18, name: "Pidgeot", defense: [.Normal, .Flying], tier: .A)
        let raichu = Pokemon(pokedex: 26, name: "Raichu", defense: [.Electric], tier: .A)
        let nidoking = Pokemon(pokedex: 34, name: "Nidoking", defense: [.Ground, .Poison], tier: .S)
        let nidoqueen = Pokemon(pokedex: 31, name: "Nidoqueen", defense: [.Ground, .Poison], tier: .S)
        let clefable = Pokemon(pokedex: 36, name: "Clefable", defense: [.Fairy], tier: .A)
        let ninetales = Pokemon(pokedex: 38, name: "Ninetales", defense: [.Fire], tier: .A)
        let wigglytuff = Pokemon(pokedex: 40, name: "Wigglytuff", defense: [.Normal, .Fairy], tier: .A)
        let golbat = Pokemon(pokedex: 42, name: "Golbat", defense: [.Poison, .Flying], tier: .B)
        let vileplume = Pokemon(pokedex: 45, name: "Vileplume", defense: [.Grass, .Poison], tier: .S)
        let venomoth = Pokemon(pokedex: 49, name: "Venomoth", defense: [.Bug, .Poison], tier: .B)
        //        let foo = Pokemon(pokedex: 0, name: "", defense: [], tier: .B)
        let golduck = Pokemon(pokedex: 55, name: "Golduck", defense: [.Water], tier: .A)
        let primeape = Pokemon(pokedex: 57, name: "Primeape", defense: [.Fight], tier: .B)
        let arcanine = Pokemon(pokedex: 59, name: "Arcanine", defense: [.Fire], tier: .S)
        let poliwrath = Pokemon(pokedex: 62, name: "Poliwrath", defense: [.Fight, .Water], tier: .S)
        let machamp = Pokemon(pokedex: 68, name: "Machamp", defense: [.Fight], tier: .S)
        let victreebel = Pokemon(pokedex: 71, name: "Victreebel", defense: [.Grass, .Poison], tier: .S)
        let tentacruel = Pokemon(pokedex: 73, name: "Tentacruel", defense: [.Water, .Poison], tier: .A)
        let golem = Pokemon(pokedex: 76, name: "Golem", defense: [.Ground, .Rock], tier: .A)
        let rapidash = Pokemon(pokedex: 78, name: "Rapidash", defense: [.Fire], tier: .A)
        let slowbro = Pokemon(pokedex: 80, name: "Slowbro", defense: [.Psychic, .Water], tier: .S)
        let dewgong = Pokemon(pokedex: 87, name: "Dewgong", defense: [.Ice, .Water], tier: .A)
        let muk = Pokemon(pokedex: 89, name: "Muk", defense: [.Poison], tier: .S)
        let cloyster = Pokemon(pokedex: 91, name: "Cloyster", defense: [.Ice, .Water], tier: .A)
        let gengar = Pokemon(pokedex: 94, name: "Gengar", defense: [.Ghost, .Poison], tier: .A)
        let hypno = Pokemon(pokedex: 97, name: "Hypno", defense: [.Psychic], tier: .A)
        let kingler = Pokemon(pokedex: 99, name: "Kingler", defense: [.Water], tier: .B)
        let exeggutor = Pokemon(pokedex: 103, name: "Exeggutor", defense: [.Psychic, .Grass], tier: .S)
        let weezing = Pokemon(pokedex: 110, name: "Weezing", defense: [.Poison], tier: .A)
        let rhydon = Pokemon(pokedex: 112, name: "Rhydon", defense: [.Ground, .Rock], tier: .A)
        let kangaskhan = Pokemon(pokedex: 115, name: "Kangaskhan", defense: [.Normal], tier: .A)
        let seaking = Pokemon(pokedex: 119, name: "Seaking", defense: [.Water], tier: .A)
        let starmie = Pokemon(pokedex: 121, name: "Starmie", defense: [.Water, .Psychic], tier: .A)
        let scyther = Pokemon(pokedex: 123, name: "Scyther", defense: [.Bug, .Flying], tier: .A)
        let electabuzz = Pokemon(pokedex: 125, name: "Electabuzz", defense: [.Electric], tier: .A)
        let magmar = Pokemon(pokedex: 126, name: "Magmar", defense: [.Fire], tier: .A)
        let pinsir = Pokemon(pokedex: 127, name: "Pinsir", defense: [.Bug], tier: .A)
        let gyarados = Pokemon(pokedex: 130, name: "Gyarados", defense: [.Flying, .Water], tier: .A)
        let lapras = Pokemon(pokedex: 131, name: "Lapras", defense: [.Ice, .Water], tier: .S)
        let vaporeon = Pokemon(pokedex: 134, name: "Vaporeon", defense: [.Water], tier: .S)
        let jolteon = Pokemon(pokedex: 135, name: "Jolteon", defense: [.Electric], tier: .A)
        let flareon = Pokemon(pokedex: 136, name: "Flareon", defense: [.Fire], tier: .S)
        let omastar = Pokemon(pokedex: 139, name: "Omastar", defense: [.Rock, .Water], tier: .A)
        let kabutops = Pokemon(pokedex: 141, name: "Kabutops", defense: [.Rock, .Water], tier: .A)
        let aerodactyl = Pokemon(pokedex: 142, name: "Aerodactyl", defense: [.Flying, .Rock], tier: .B)
        let snorlax = Pokemon(pokedex: 143, name: "Snorlax", defense: [.Normal], tier: .A)
        let articuno = Pokemon(pokedex: 144, name: "Articuno", defense: [.Ice, .Flying], tier: .S)
        let zapdos = Pokemon(pokedex: 145, name: "Zapdos", defense: [.Electric, .Flying], tier: .S)
        let moltres = Pokemon(pokedex: 146, name: "Moltres", defense: [.Flying, .Fire], tier: .S)
        let dragonite = Pokemon(pokedex: 149, name: "Dragonite", defense: [.Flying, .Dragon], tier: .S)
        let mewtwo = Pokemon(pokedex: 150, name: "Mewtwo", defense: [.Psychic], tier: .S)
        let mew = Pokemon(pokedex: 151, name: "Mew", defense: [.Psychic], tier: .S)

        
        return [
            ivysaur, venasaur,
            charmeleon, charizard,
            wartortle, blastoise,
            vaporeon, flareon, jolteon,
            lapras, dragonite, gyarados,
            snorlax, golduck, exeggutor,
            slowbro, aerodactyl, arcanine,
            muk, machamp, victreebel,
            poliwrath, nidoking, nidoqueen,
            vileplume, clefable, golem,
            magmar, weezing, rhydon,
            omastar, wigglytuff, ninetales,
            starmie, rapidash, tentacruel,
            hypno, dewgong, kabutops,
            electabuzz, pinsir, scyther,
            gengar, pidgeot, seaking,
            kangaskhan, raichu, cloyster,
            golbat, venomoth, primeape,
            kingler, mew, mewtwo,
            moltres, zapdos, articuno
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