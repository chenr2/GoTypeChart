//
//  Pokemon.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

enum DamageType {
    case single, double, half
}

struct TypeResult {
    let sumDifferential: CGFloat
    let opponent: Pokemon
    let opponentQuickMove: QuickMove
    let opponentChargeMove: SpecialMove
}

struct AverageMon {
    let average: CGFloat
    let opponent: Pokemon
}

class Pokemon {
    var species: PokemonEnumeration
    var type: [ElementType]
    var vulnerabilitySet: [ElementType: DamageType]
    var pokedex: Int
    var bestCounter: [ElementType] {
        return Pokemon.directCounter(type)
    }
    var stamina: Int
    var attack: Int
    var defense: Int
    var quickAttacks: [QuickAttack]
    var specialAttacks: [SpecialAttack]
    
    let maxAttack: CGFloat = 271
    let maxDefense: CGFloat = 396
    let maxStamina: CGFloat = 510
    
    
    
    func getPercentage(_ stat: CGFloat, total: CGFloat) -> CGFloat {
        // 320 / 500 = 0.64
        // 0.64 * 100 = 64
        let percentage = 100 * CGFloat(stat) / total
        // 10 * √64 = 80
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    
    var attackPercentage: CGFloat {
        return getPercentage(CGFloat(attack), total: maxAttack)
    }

    var defensePercentage: CGFloat {
        return getPercentage(CGFloat(defense), total: maxDefense)
    }

    var staminaPercentage: CGFloat {
        return getPercentage(CGFloat(stamina), total: maxStamina)
    }
    
    class func directCounter(_ type: [ElementType]) -> [ElementType] {
        switch type.count {
        case 1:
            guard let singleElement = type.first else { return [] }
            switch singleElement {
            case .Normal:
                return [.Fight]
            case .Fight:
                return []
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
                return []
            case .Psychic:
                return [.Dark]
            case .Ice:
                return [.Fire, .Steel]
            case .Dragon:
                return [.Fairy]
            case .Dark:
                return [.Fairy, .Fight]
            case .Fairy:
                return []
            }
        case 2:
            guard let firstElement = type.first,
                let secondElement = type.last else { return [] }
            switch (firstElement, secondElement) {
            case (.Flying, .Water), (.Water, .Flying): // gyarados
                return [.Electric]
            case (.Psychic, .Grass), (.Grass, .Psychic): // exegguctor
                return [.Bug]
            case (.Dragon, .Flying), (.Flying, .Dragon): // dragonite
                return [.Ice]
            case (.Fire, .Flying), (.Flying, .Fire): // charizard, moltres
                return [.Rock]
            case (.Psychic, .Water), (.Water, .Psychic): // showbro, starmie
                return [.Grass, .Bug, .Electric] // dark and ghost don't really work out
            case (.Ice, .Water), (.Water, .Ice): // lapras
                return [.Electric, .Fight, .Rock] // don't use grass vs lapras
            case (.Grass, .Poison), (.Poison, .Grass): // venasaur, victreebel, vileplume, gloom
                return [.Fire] // nothing wrong with ice/psychic per se. but ice tends to pair with water (vuln to grass). and psychic tends to pair with water or grass (vuln to poison). just more straightforward to use fire. but some exceptions: jinx and pidgeot
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
            case (.Normal, .Flying), (.Flying, .Normal): // pidgeot, dodrio, fearow
                return [.Rock] // all are pretty good, but Rock is resistant to both!
            case (.Poison, .Flying), (.Flying, .Poison): // golbat
                return [.Rock]
            case (.Bug, .Poison), (.Poison, .Bug): // venomoth
                return [.Fire, .Flying, .Rock]
            case (.Electric, .Flying), (.Flying, .Electric): // zapdos
                return [.Rock]
            case (.Ice, .Flying), (.Flying, .Ice): // articuno
                return [.Rock]
            case (.Electric, .Steel), (.Steel, .Electric): // magneton
                return [.Ground]
            case (.Bug, .Grass), (.Grass, .Bug): // parasect
                return [.Fire, .Flying] // wow, two quads!
            case (.Ice, .Psychic), (.Psychic, .Ice): // jynx
                return [.Steel]
            case (.Psychic, .Fairy), (.Fairy, .Psychic): // mr. mime
                return [.Steel]
            default:
                return []
            }
        default:
            break
        }
        return []
    }
    
    class func vulnerabilitySet(_ element: ElementType) -> [ElementType: DamageType] {
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
    
    class func multiplyDamageTypes(_ a:DamageType?, b:DamageType?) -> DamageType {
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
    
    class func multiplyVulnerabilitySets(_ setA: [ElementType: DamageType], setB: [ElementType: DamageType]) -> [ElementType: DamageType] {
        var productVulnerabilities = Pokemon.identityVulnerabilitySet()
        let keys = Array(setA.keys) + Array(setB.keys)
        let uniqueKeys = Array(Set(keys))
        for key in uniqueKeys {
            productVulnerabilities[key] = multiplyDamageTypes(setA[key]!, b: setB[key]!)
        }
        return productVulnerabilities
    }
    
    class func pokemonForSpecies(_ species: PokemonEnumeration) -> Pokemon? {
        return PokemonCollections.allPokemon().filter {
            $0.species == species
        }.first
    }
    
    class func stabMultiplier(_ pokemon: Pokemon, element: ElementType) -> CGFloat {
        let stabFlag = pokemon.type.contains(element)
        return stabFlag ? 1.25 : 1
    }
    
    class func typeDamage(_ victimType: ElementType, moveType: ElementType)
        -> CGFloat {
        guard let bonusFlag = Pokemon.vulnerabilitySet(victimType)[moveType] else { return 1 }
        switch bonusFlag {
        case .double:
            return 1.25
        case .half:
            return 0.8
        default:
            return 1
        }
    }
    
    class func calculateTypeResults(_ pokemon: Pokemon, quickAttack: QuickAttack, specialAttack: SpecialAttack) -> [TypeResult] {
        let opponents = PokemonCollections.contenders()
        var typeResults: [TypeResult] = []
        let quickMove = QuickMove.moveForQuickAttack(quickAttack) // defender's
        let chargeMove = SpecialMove.moveForSpecialAttack(specialAttack) // defender's
        for opponent in opponents {
            // all this is still the defender's moves
            let qmElement = quickMove.element
            let qmStabMultiplier = Pokemon.stabMultiplier(pokemon, element: qmElement)
            let qmStab = quickMove.dps * qmStabMultiplier
            var qmBonusDamage1: CGFloat = 1
            var qmBonusDamage2: CGFloat = 1
            
            let cmElement = chargeMove.element
            let cmStabMultiplier = Pokemon.stabMultiplier(pokemon, element: cmElement)
            let chargeMoveDPS = SpecialMove.cmDPSBasedOnQm(cmPower: chargeMove.power, bar: chargeMove.bar, duration: chargeMove.duration, quickmoveEPS: quickMove.eps)
            let cmStab = chargeMoveDPS * cmStabMultiplier
            var cmBonusDamage1: CGFloat = 1
            var cmBonusDamage2: CGFloat = 1
            
            if let opponentType1 = opponent.type.first {
                qmBonusDamage1 = Pokemon.typeDamage(opponentType1, moveType: qmElement)
                cmBonusDamage1 = Pokemon.typeDamage(opponentType1, moveType: cmElement)
            }
            if let opponentType2 = opponent.type.last, opponent.type.count == 2 {
                qmBonusDamage2 = Pokemon.typeDamage(opponentType2, moveType: qmElement)
                cmBonusDamage2 = Pokemon.typeDamage(opponentType2, moveType: cmElement)
            }
            // defender's moves.
            // quick move damage * stab * type effectiveness * (attack / defense)
            let qmDamage = qmStab * qmBonusDamage1 * qmBonusDamage2 * CGFloat(pokemon.attack) / CGFloat(opponent.defense)
            let cmDamage = cmStab * cmBonusDamage1 * cmBonusDamage2 * CGFloat(pokemon.attack) / CGFloat(opponent.defense)
            
            for opponentQM in opponent.quickAttacks {
                for opponentCM in opponent.specialAttacks {
                    // the attacker's moves
                    let oqm = QuickMove.moveForQuickAttack(opponentQM)
                    let oqmElement = oqm.element
                    let oqmStabMultiplier = Pokemon.stabMultiplier(opponent, element: oqmElement)
                    let oqmStab = oqm.dps * oqmStabMultiplier
                    var oqmBonusDamage1: CGFloat = 1
                    var oqmBonusDamage2: CGFloat = 1
                    
                    let ocm = SpecialMove.moveForSpecialAttack(opponentCM)
                    let ocmElement = ocm.element
                    let ocmStabMultiplier = Pokemon.stabMultiplier(opponent, element: ocmElement)
                    let oChargeMoveDPS = SpecialMove.cmDPSBasedOnQm(cmPower: ocm.power, bar: ocm.bar, duration: ocm.duration, quickmoveEPS: oqm.eps)
                    let ocmStab = oChargeMoveDPS * ocmStabMultiplier
                    var ocmBonusDamage1: CGFloat = 1
                    var ocmBonusDamage2: CGFloat = 1
                    
                    if let myType1 = pokemon.type.first {
                        oqmBonusDamage1 = Pokemon.typeDamage(myType1, moveType: oqmElement)
                        ocmBonusDamage1 = Pokemon.typeDamage(myType1, moveType: ocmElement)
                    }
                    
                    if let myType2 = pokemon.type.last , pokemon.type.count == 2 {
                        oqmBonusDamage2 = Pokemon.typeDamage(myType2, moveType: oqmElement)
                        ocmBonusDamage2 = Pokemon.typeDamage(myType2, moveType: ocmElement)
                    }
                    
                    let oqmDamage = oqmStab * oqmBonusDamage1 * oqmBonusDamage2 * CGFloat(opponent.attack) / CGFloat(pokemon.defense)
                    let ocmDamage = ocmStab * ocmBonusDamage1 * ocmBonusDamage2 * CGFloat(opponent.attack) / CGFloat(pokemon.defense)
                    
                    let rawDifferential = (oqmDamage + ocmDamage) - (qmDamage + cmDamage)
                    let thisResult = TypeResult(
                        sumDifferential: rawDifferential,
                        opponent: opponent,
                        opponentQuickMove: oqm,
                        opponentChargeMove: ocm
                    )
                    typeResults.append(thisResult)
                }
            }
        }
        return typeResults
    }
    
    class func calculateTypeCounters(_ pokemon: Pokemon, quickAttack: QuickAttack, specialAttack: SpecialAttack) -> [TypeResult] {
        let typeResults = Pokemon.calculateTypeResults(pokemon, quickAttack: quickAttack, specialAttack: specialAttack)
        var topResults: [TypeResult] = []
        
        for leader in PokemonCollections.contenders() {
            let moveCombinations = typeResults.filter {
                $0.opponent.species == leader.species
            }.sorted { a, b in
                // tie-breaker
                (a.opponentQuickMove.dps + a.opponentChargeMove.simpleDPS) > (b.opponentQuickMove.dps + b.opponentChargeMove.simpleDPS)
            }.sorted { a, b in
                a.sumDifferential > b.sumDifferential
            }
            if let topMoveSet = moveCombinations.first {
                topResults.append(topMoveSet)
            }
        }
        topResults = topResults.sorted { a, b in
            return a.sumDifferential > b.sumDifferential
        }
        return Array(topResults.prefix(6))
    }
    
    class func calculatePotentialTargetsFor(_ pokemon: Pokemon, quickAttack: QuickAttack, specialAttack: SpecialAttack) -> [AverageMon] {

        let typeResults = Pokemon.calculateTypeResults(pokemon, quickAttack: quickAttack, specialAttack: specialAttack)
        var topResults: [AverageMon] = []
        
        for leader in PokemonCollections.contenders() {
            let movesForThisMon = typeResults.filter {
                $0.opponent.species == leader.species
            }
            let sum = movesForThisMon.map {
                return $0.sumDifferential
            }.reduce(0, {$0 + $1})
            // average all the sum differentials
            // and return a average result
            // maybe show beads on a wire to show distribution of average
            let average = AverageMon(average: sum / CGFloat(movesForThisMon.count), opponent: leader)
            topResults.append(average)
        }
        topResults = topResults.sorted { a, b in
            return a.average < b.average
        }
        
        return Array(topResults.prefix(8))
    }
    
    class func calculateCP(pokemon: Pokemon) -> Int {
        let attackPlusIV: CGFloat = CGFloat(pokemon.attack) + 15.0
        let defensePlusIV: CGFloat = CGFloat(pokemon.defense) + 15.0
        let staminaPlusIV: CGFloat = CGFloat(pokemon.stamina) + 15.0
        let cpFloat:CGFloat = ((attackPlusIV) * sqrt(defensePlusIV) * sqrt(staminaPlusIV) * sqrt(0.7903001)) / 10
        return Int(cpFloat)
    }
    
    init(pokedex: Int, species: PokemonEnumeration, type: [ElementType], quickAttacks: [QuickAttack], specialAttacks: [SpecialAttack], stamina: Int, attack: Int, defense: Int){
        self.pokedex = pokedex
        self.species = species
        self.type = type
        self.stamina = stamina
        self.attack = attack
        self.defense = defense
        let vulnerabilitySets = type.map {
            return Pokemon.vulnerabilitySet($0)
        }
        self.quickAttacks = quickAttacks
        self.specialAttacks = specialAttacks
        if type.count == 1 {
            self.vulnerabilitySet = vulnerabilitySets.first!
        } else {
            self.vulnerabilitySet = Pokemon.multiplyVulnerabilitySets(vulnerabilitySets.first!, setB: vulnerabilitySets.last!)
        }
    }
}
