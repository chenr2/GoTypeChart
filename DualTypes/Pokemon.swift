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
    
    class func vulnerabilitySet(element: ElementType) -> [ElementType: DamageType] {
        var returnSet = Pokemon.identityVulnerabilitySet()
        switch element {
        case .Water:
            returnSet[.Steel] = .half
            returnSet[.Fire] = .half
            returnSet[.Water] = .half
            returnSet[.Grass] = .double
            returnSet[.Electric] = .double
            returnSet[.Ice] = .half
        case .Ice:
            returnSet[.Fight] = .double
            returnSet[.Rock] = .double
            returnSet[.Steel] = .double
            returnSet[.Fire] = .double
            returnSet[.Ice] = .half

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
        let vaporeon = Pokemon(name: "Vaporeon", defense: [.Water])
        let lapras = Pokemon(name: "Lapras", defense: [.Ice, .Water])
        let dragonite = Pokemon(name: "Dragonite", defense: [.Flying, .Dragon])
        return [vaporeon, lapras, dragonite, lapras, dragonite]
    }
    
    init(name: String, defense: [ElementType]){
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