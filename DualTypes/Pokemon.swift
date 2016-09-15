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

class Pokemon {
    var name: String
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
    
    let maxAttack: CGFloat = 282
    let maxDefense: CGFloat = 242
    let maxStamina: CGFloat = 500
    
    func getPercentage(stat: CGFloat, total: CGFloat) -> CGFloat {
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
    
    class func directCounter(type: [ElementType]) -> [ElementType] {
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
        let bulbasaur = Pokemon(
            pokedex: 1,
            name: "Bulbasaur",
            type: [.Grass, .Poison],
            quickAttacks: [.tackle, .vineWhip],
            specialAttacks: [.sludgeBomb, .seedBomb, .powerWhip],
            stamina: 90,
            attack:126,
            defense: 126
        )
        
        let ivysaur = Pokemon(pokedex: 2, name: "Ivysaur", type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .powerWhip], stamina: 120, attack: 156, defense: 158)
        let venusaur = Pokemon(pokedex: 3, name: "Venusaur", type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .petalBlizzard], stamina: 160, attack: 198, defense: 200)
        let charmander = Pokemon(pokedex: 4, name: "Charmander", type: [.Fire], quickAttacks: [.scratch, .ember], specialAttacks: [.flameBurst, .flamethrower, .flameCharge], stamina: 78, attack: 128, defense: 108)
        let charmeleon = Pokemon(pokedex: 5, name: "Charmeleon", type: [.Fire], quickAttacks: [.scratch, .ember], specialAttacks: [.flameBurst, .flamethrower, .firePunch], stamina: 116, attack: 160, defense: 140)
        let charizard = Pokemon(pokedex: 6, name: "Charizard", type: [.Fire, .Flying], quickAttacks: [.wingAttack, .ember], specialAttacks: [.dragonClaw, .flamethrower, .fireBlast], stamina: 156, attack: 212, defense: 182)
        let squirtle = Pokemon(pokedex: 7, name: "Squirtle", type: [.Water], quickAttacks: [.tackle, .bubble], specialAttacks: [.aquaJet, .aquaTail, .waterPulse], stamina: 88, attack: 112, defense: 142)
        let wartortle = Pokemon(pokedex: 8, name: "Wartortle", type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.aquaJet, .hydroPump, .iceBeam], stamina: 118, attack: 144, defense: 176)
        let blastoise = Pokemon(pokedex: 9, name: "Blastoise", type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.iceBeam, .hydroPump, .flashCannon], stamina: 158, attack: 186, defense: 222)
        let caterpie = Pokemon(pokedex: 10, name: "Caterpie", type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 90, attack: 62, defense: 66)
        let metapod = Pokemon(pokedex: 11, name: "Metapod", type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 100, attack: 56, defense: 86)
        let butterfree = Pokemon(pokedex: 12, name: "Butterfree", type: [.Bug, .Flying], quickAttacks: [.confusion, .bugBite], specialAttacks: [.psychic, .bugBuzz, .signalBeam], stamina: 120, attack: 144, defense: 144)
        let weedle = Pokemon(pokedex: 13, name: "Weedle", type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 80, attack: 68, defense: 64)
        let kakuna = Pokemon(pokedex: 14, name: "Kakuna", type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 90, attack: 62, defense: 82)
        let beedrill = Pokemon(pokedex: 15, name: "Beedrill", type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonJab], specialAttacks: [.aerialAce, .sludgeBomb, .xScissor], stamina: 130, attack: 144, defense: 130)
        let pidgey = Pokemon(pokedex: 16, name: "Pidgey", type: [.Normal, .Flying], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 80, attack: 94, defense: 90)
        let pidgeotto = Pokemon(pokedex: 17, name: "Pidgeotto", type: [.Normal, .Flying], quickAttacks: [.wingAttack, .steelWing], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 126, attack: 126, defense: 122)
        let pidgeot = Pokemon(pokedex: 18, name: "Pidgeot", type: [.Normal, .Flying], quickAttacks: [.wingAttack, .steelWing], specialAttacks: [.hurricane, .aerialAce, .airCutter], stamina: 166, attack: 170, defense: 166)
        let rattata = Pokemon(pokedex: 19, name: "Rattata", type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.dig, .hyperFang, .bodySlam], stamina: 60, attack: 92, defense: 86)
        let raticate = Pokemon(pokedex: 20, name: "Raticate", type: [.Normal], quickAttacks: [.bite, .quickAttack], specialAttacks: [.dig, .hyperFang, .hyperBeam], stamina: 110, attack: 146, defense: 150)
        let spearow = Pokemon(pokedex: 21, name: "Spearow", type: [.Normal, .Flying], quickAttacks: [.quickAttack, .peck], specialAttacks: [.aerialAce, .twister, .drillPeck], stamina: 80, attack: 102, defense: 78)
        let fearow = Pokemon(pokedex: 22, name: "Fearow", type: [.Normal, .Flying], quickAttacks: [.steelWing, .peck], specialAttacks: [.aerialAce, .twister, .drillRun], stamina: 130, attack: 168, defense: 146)
        let ekans = Pokemon(pokedex: 23, name: "Ekans", type: [.Poison], quickAttacks: [.acid, .poisonSting], specialAttacks: [.gunkShot, .sludgeBomb, .wrap], stamina: 70, attack: 112, defense: 112)
        let arbok = Pokemon(pokedex: 24, name: "Arbok", type: [.Poison], quickAttacks: [.acid, .bite], specialAttacks: [.gunkShot, .sludgeWave, .darkPulse], stamina: 120, attack: 166, defense: 166)
        let pikachu = Pokemon(pokedex: 25, name: "Pikachu", type: [.Electric], quickAttacks: [.thunderShock, .quickAttack], specialAttacks: [.thunderbolt, .discharge, .thunder], stamina: 70, attack: 124, defense: 108)
        let raichu = Pokemon(pokedex: 26, name: "Raichu", type: [.Electric], quickAttacks: [.thunderShock, .spark], specialAttacks: [.brickBreak, .thunderPunch, .thunder], stamina: 120, attack: 200, defense: 154)
        let sandshrew = Pokemon(pokedex: 27, name: "Sandshrew", type: [.Ground], quickAttacks: [.scratch, .mudShot], specialAttacks: [.dig, .rockSlide, .rockTomb], stamina: 100, attack: 90, defense: 114)
        let sandslash = Pokemon(pokedex: 28, name: "Sandslash", type: [.Ground], quickAttacks: [.metalClaw, .mudShot], specialAttacks: [.rockTomb, .bulldoze, .earthquake], stamina: 150, attack: 150, defense: 172)
        let nidoranFemale = Pokemon(pokedex: 29, name: "Nidoran♀", type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .bodySlam], stamina: 110, attack: 100, defense: 104)
        let nidorina = Pokemon(pokedex: 30, name: "Nidorina", type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .dig], stamina: 140, attack: 132, defense: 136)
        let nidoqueen = Pokemon(pokedex: 31, name: "Nidoqueen", type: [.Poison, .Ground], quickAttacks: [.poisonJab, .bite], specialAttacks: [.stoneEdge, .sludgeWave, .earthquake], stamina: 180, attack: 184, defense: 190)
        let nidoranMale = Pokemon(pokedex: 32, name: "Nidoran♂", type: [.Poison], quickAttacks: [.poisonSting, .peck], specialAttacks: [.hornAttack, .bodySlam, .sludgeBomb], stamina: 92, attack: 110, defense: 94)
        let nidorino = Pokemon(pokedex: 33, name: "Nidorino", type: [.Poison], quickAttacks: [.poisonJab, .bite], specialAttacks: [.hornAttack, .dig, .sludgeBomb], stamina: 122, attack: 142, defense: 128)
        let nidoking = Pokemon(pokedex: 34, name: "Nidoking", type: [.Poison, .Ground], quickAttacks: [.poisonJab, .furyCutter], specialAttacks: [.megahorn, .earthquake, .sludgeWave], stamina: 162, attack: 204, defense: 170)
        let clefairy = Pokemon(pokedex: 35, name: "Clefairy", type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.bodySlam, .disarmingVoice, .moonblast], stamina: 140, attack: 116, defense: 124)
        let clefable = Pokemon(pokedex: 36, name: "Clefable", type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.psychic, .dazzlingGleam, .moonblast], stamina: 190, attack: 178, defense: 178)
        let vulpix = Pokemon(pokedex: 37, name: "Vulpix", type: [.Fire], quickAttacks: [.quickAttack, .ember], specialAttacks: [.flamethrower, .bodySlam, .flameCharge], stamina: 76, attack: 106, defense: 118)
        let ninetales = Pokemon(pokedex: 38, name: "Ninetales", type: [.Fire], quickAttacks: [.feintAttack, .ember], specialAttacks: [.heatWave, .fireBlast, .flamethrower], stamina: 146, attack: 176, defense: 194)
        let jigglypuff = Pokemon(pokedex: 39, name: "Jigglypuff", type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.disarmingVoice, .bodySlam, .dazzlingGleam], stamina: 230, attack: 98, defense: 54)
        let wigglytuff = Pokemon(pokedex: 40, name: "Wigglytuff", type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.dazzlingGleam, .hyperBeam, .playRough], stamina: 280, attack: 168, defense: 108)
        let zubat = Pokemon(pokedex: 41, name: "Zubat", type: [.Poison, .Flying], quickAttacks: [.bite, .quickAttack], specialAttacks: [.sludgeBomb, .poisonFang, .airCutter], stamina: 80, attack: 88, defense: 90)
        let golbat = Pokemon(pokedex: 42, name: "Golbat", type: [.Poison, .Flying], quickAttacks: [.bite, .wingAttack], specialAttacks: [.ominousWind, .poisonFang, .airCutter], stamina: 150, attack: 164, defense: 164)
        let oddish = Pokemon(pokedex: 43, name: "Oddish", type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .seedBomb, .sludgeBomb], stamina: 90, attack: 134, defense: 130)
        let gloom = Pokemon(pokedex: 44, name: "Gloom", type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .sludgeBomb], stamina: 120, attack: 162, defense: 158)
        let vileplume = Pokemon(pokedex: 45, name: "Vileplume", type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .solarBeam], stamina: 150, attack: 202, defense: 190)
        let paras = Pokemon(pokedex: 46, name: "Paras", type: [.Bug, .Grass], quickAttacks: [.bugBite, .scratch], specialAttacks: [.seedBomb, .xScissor, .crossPoison], stamina: 70, attack: 122, defense: 120)
        let parasect = Pokemon(pokedex: 47, name: "Parasect", type: [.Bug, .Grass], quickAttacks: [.bugBite, .furyCutter], specialAttacks: [.solarBeam, .xScissor, .crossPoison], stamina: 120, attack: 162, defense: 170)
        let venonat = Pokemon(pokedex: 48, name: "Venonat", type: [.Bug, .Poison], quickAttacks: [.confusion, .bugBite], specialAttacks: [.signalBeam, .poisonFang, .psybeam], stamina: 120, attack: 108, defense: 118)
        let venomoth = Pokemon(pokedex: 49, name: "Venomoth", type: [.Bug, .Poison], quickAttacks: [.confusion, .bugBite], specialAttacks: [.bugBuzz, .poisonFang, .psychic], stamina: 140, attack: 172, defense: 154)
        let diglett = Pokemon(pokedex: 50, name: "Diglett", type: [.Ground], quickAttacks: [.scratch, .mudSlap], specialAttacks: [.rockTomb, .dig, .mudBomb], stamina: 20, attack: 108, defense: 86)
        let dugtrio = Pokemon(pokedex: 51, name: "Dugtrio", type: [.Ground], quickAttacks: [.suckerPunch, .mudSlap], specialAttacks: [.stoneEdge, .earthquake, .mudBomb], stamina: 70, attack: 148, defense: 140)
        let meowth = Pokemon(pokedex: 52, name: "Meowth", type: [.Normal], quickAttacks: [.scratch, .bite], specialAttacks: [.darkPulse, .nightSlash, .bodySlam], stamina: 80, attack: 104, defense: 94)
        let persian = Pokemon(pokedex: 53, name: "Persian", type: [.Normal], quickAttacks: [.scratch, .feintAttack], specialAttacks: [.playRough, .powerGem, .nightSlash], stamina: 130, attack: 156, defense: 146)
        let psyduck = Pokemon(pokedex: 54, name: "Psyduck", type: [.Water], quickAttacks: [.zenHeadbutt, .waterGun], specialAttacks: [.aquaTail, .crossChop, .psybeam], stamina: 100, attack: 132, defense: 112)
        let golduck = Pokemon(pokedex: 55, name: "Golduck", type: [.Water], quickAttacks: [.confusion, .waterGun], specialAttacks: [.hydroPump, .iceBeam, .psychic], stamina: 160, attack: 194, defense: 176)
        let mankey = Pokemon(pokedex: 56, name: "Mankey", type: [.Fight], quickAttacks: [.karateChop, .scratch], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 80, attack: 112, defense: 96)
        let primeape = Pokemon(pokedex: 57, name: "Primeape", type: [.Fight], quickAttacks: [.karateChop, .lowKick], specialAttacks: [.nightSlash, .crossChop, .lowSweep], stamina: 130, attack: 178, defense: 150)
        let growlithe = Pokemon(pokedex: 58, name: "Growlithe", type: [.Fire], quickAttacks: [.ember, .bite], specialAttacks: [.flameWheel, .bodySlam, .flamethrower], stamina: 110, attack: 156, defense: 110)
        let arcanine = Pokemon(pokedex: 59, name: "Arcanine", type: [.Fire], quickAttacks: [.fireFang, .bite], specialAttacks: [.fireBlast, .bulldoze, .flamethrower], stamina: 180, attack: 230, defense: 180)
        let poliwag = Pokemon(pokedex: 60, name: "Poliwag", type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.bodySlam, .bubbleBeam, .mudBomb], stamina: 80, attack: 108, defense: 98)
        let poliwhirl = Pokemon(pokedex: 61, name: "Poliwhirl", type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.scald, .bubbleBeam, .mudBomb], stamina: 130, attack: 132, defense: 132)
        let poliwrath = Pokemon(pokedex: 62, name: "Poliwrath", type: [.Water, .Fight], quickAttacks: [.bubble, .mudShot], specialAttacks: [.icePunch, .hydroPump, .submission], stamina: 180, attack: 180, defense: 202)
        let abra = Pokemon(pokedex: 63, name: "Abra", type: [.Psychic], quickAttacks: [.zenHeadbutt], specialAttacks: [.shadowBall, .signalBeam, .psyshock], stamina: 50, attack: 110, defense: 76)
        let kadabra = Pokemon(pokedex: 64, name: "Kadabra", type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .dazzlingGleam, .psybeam], stamina: 80, attack: 150, defense: 112)
        let alakazam = Pokemon(pokedex: 65, name: "Alakazam", type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .dazzlingGleam, .psychic], stamina: 110, attack: 186, defense: 152)
        let machop = Pokemon(pokedex: 66, name: "Machop", type: [.Fight], quickAttacks: [.lowKick, .karateChop], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 140, attack: 118, defense: 96)
        let machoke = Pokemon(pokedex: 67, name: "Machoke", type: [.Fight], quickAttacks: [.lowKick, .karateChop], specialAttacks: [.brickBreak, .crossChop, .submission], stamina: 160, attack: 154, defense: 144)
        let machamp = Pokemon(pokedex: 68, name: "Machamp", type: [.Fight], quickAttacks: [.bulletPunch, .karateChop], specialAttacks: [.stoneEdge, .crossChop, .submission], stamina: 180, attack: 198, defense: 180)
        let bellsprout = Pokemon(pokedex: 69, name: "Bellsprout", type: [.Grass, .Poison], quickAttacks: [.acid, .vineWhip], specialAttacks: [.sludgeBomb, .powerWhip, .wrap], stamina: 100, attack: 158, defense: 78)
        let weepinbell = Pokemon(pokedex: 70, name: "Weepinbell", type: [.Grass, .Poison], quickAttacks: [.acid, .razorLeaf], specialAttacks: [.sludgeBomb, .powerWhip, .seedBomb], stamina: 130, attack: 190, defense: 110)
        let victreebel = Pokemon(pokedex: 71, name: "Victreebel", type: [.Grass, .Poison], quickAttacks: [.acid, .razorLeaf], specialAttacks: [.sludgeBomb, .leafBlade, .solarBeam], stamina: 160, attack: 222, defense: 152)
        let tentacool = Pokemon(pokedex: 72, name: "Tentacool", type: [.Water, .Poison], quickAttacks: [.bubble, .poisonSting], specialAttacks: [.bubbleBeam, .waterPulse, .wrap], stamina: 80, attack: 106, defense: 136)
        let tentacruel = Pokemon(pokedex: 73, name: "Tentacruel", type: [.Water, .Poison], quickAttacks: [.acid, .poisonJab], specialAttacks: [.blizzard, .hydroPump, .sludgeWave], stamina: 160, attack: 170, defense: 196)
        let geodude = Pokemon(pokedex: 74, name: "Geodude", type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.rockSlide, .dig, .rockTomb], stamina: 80, attack: 106, defense: 118)
        let graveler = Pokemon(pokedex: 75, name: "Graveler", type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap], specialAttacks: [.rockSlide, .dig, .stoneEdge], stamina: 110, attack: 142, defense: 156)
        let golem = Pokemon(pokedex: 76, name: "Golem", type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap], specialAttacks: [.ancientPower, .earthquake, .stoneEdge], stamina: 160, attack: 176, defense: 198)
        let ponyta = Pokemon(pokedex: 77, name: "Ponyta", type: [.Fire], quickAttacks: [.tackle, .ember], specialAttacks: [.flameWheel, .fireBlast, .flameCharge], stamina: 100, attack: 168, defense: 138)
        let rapidash = Pokemon(pokedex: 78, name: "Rapidash", type: [.Fire], quickAttacks: [.lowKick, .ember], specialAttacks: [.heatWave, .fireBlast, .drillRun], stamina: 130, attack: 200, defense: 170)
        let slowpoke = Pokemon(pokedex: 79, name: "Slowpoke", type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .psyshock], stamina: 180, attack: 110, defense: 110)
        let slowbro = Pokemon(pokedex: 80, name: "Slowbro", type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .iceBeam], stamina: 190, attack: 184, defense: 198)
        let magnemite = Pokemon(pokedex: 81, name: "Magnemite", type: [.Electric, .Steel], quickAttacks: [.spark, .thunderShock], specialAttacks: [.magnetBomb, .discharge, .thunderbolt], stamina: 50, attack: 128, defense: 138)
        let magneton = Pokemon(pokedex: 82, name: "Magneton", type: [.Electric, .Steel], quickAttacks: [.spark, .thunderShock], specialAttacks: [.magnetBomb, .discharge, .flashCannon], stamina: 100, attack: 186, defense: 180)
        let farfetchd = Pokemon(pokedex: 83, name: "Farfetch'd", type: [.Normal, .Flying], quickAttacks: [.furyCutter, .cut], specialAttacks: [.airCutter, .aerialAce, .leafBlade], stamina: 104, attack: 138, defense: 132)
        let doduo = Pokemon(pokedex: 84, name: "Doduo", type: [.Normal, .Flying], quickAttacks: [.peck, .quickAttack], specialAttacks: [.swift, .aerialAce, .drillPeck], stamina: 70, attack: 126, defense: 96)
        let dodrio = Pokemon(pokedex: 85, name: "Dodrio", type: [.Normal, .Flying], quickAttacks: [.steelWing, .feintAttack], specialAttacks: [.drillPeck, .aerialAce, .airCutter], stamina: 120, attack: 182, defense: 150)
        let seel = Pokemon(pokedex: 86, name: "Seel", type: [.Water], quickAttacks: [.lick, .iceShard], specialAttacks: [.aquaJet, .icyWind, .aquaTail], stamina: 130, attack: 104, defense: 138)
        let dewgong = Pokemon(pokedex: 87, name: "Dewgong", type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard], specialAttacks: [.aquaJet, .icyWind, .blizzard], stamina: 180, attack: 156, defense: 192)
        let grimer = Pokemon(pokedex: 88, name: "Grimer", type: [.Poison], quickAttacks: [.mudSlap, .poisonJab], specialAttacks: [.sludge, .sludgeBomb, .mudBomb], stamina: 160, attack: 124, defense: 110)
        let muk = Pokemon(pokedex: 89, name: "Muk", type: [.Poison], quickAttacks: [.poisonJab, .lick], specialAttacks: [.sludgeWave, .sludgeBomb, .darkPulse], stamina: 210, attack: 180, defense: 188)
        let shellder = Pokemon(pokedex: 90, name: "Shellder", type: [.Water], quickAttacks: [.iceShard, .tackle], specialAttacks: [.icyWind, .waterPulse, .bubbleBeam], stamina: 60, attack: 120, defense: 112)
        let cloyster = Pokemon(pokedex: 91, name: "Cloyster", type: [.Water, .Ice], quickAttacks: [.iceShard, .frostBreath], specialAttacks: [.icyWind, .blizzard, .hydroPump], stamina: 100, attack: 196, defense: 196)
        let gastly = Pokemon(pokedex: 92, name: "Gastly", type: [.Ghost, .Poison], quickAttacks: [.lick, .suckerPunch], specialAttacks: [.darkPulse, .sludgeBomb, .ominousWind], stamina: 60, attack: 136, defense: 82)
        let haunter = Pokemon(pokedex: 93, name: "Haunter", type: [.Ghost, .Poison], quickAttacks: [.lick, .shadowClaw], specialAttacks: [.darkPulse, .sludgeBomb, .shadowBall], stamina: 90, attack: 172, defense: 118)
        let gengar = Pokemon(pokedex: 94, name: "Gengar", type: [.Ghost, .Poison], quickAttacks: [.shadowClaw, .suckerPunch], specialAttacks: [.darkPulse, .sludgeBomb, .shadowBall], stamina: 120, attack: 204, defense: 156)
        let onix = Pokemon(pokedex: 95, name: "Onix", type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.rockSlide, .stoneEdge, .ironHead], stamina: 70, attack: 90, defense: 186)
        let drowzee = Pokemon(pokedex: 96, name: "Drowzee", type: [.Psychic], quickAttacks: [.pound, .confusion], specialAttacks: [.psychic, .psyshock, .psybeam], stamina: 120, attack: 104, defense: 140)
        let hypno = Pokemon(pokedex: 97, name: "Hypno", type: [.Psychic], quickAttacks: [.zenHeadbutt, .confusion], specialAttacks: [.psychic, .psyshock, .shadowBall], stamina: 170, attack: 162, defense: 196)
        let krabby = Pokemon(pokedex: 98, name: "Krabby", type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.viceGrip, .waterPulse, .bubbleBeam], stamina: 60, attack: 116, defense: 110)
        let kingler = Pokemon(pokedex: 99, name: "Kingler", type: [.Water], quickAttacks: [.metalClaw, .mudShot], specialAttacks: [.viceGrip, .waterPulse, .xScissor], stamina: 110, attack: 178, defense: 168)
        let voltorb = Pokemon(pokedex: 100, name: "Voltorb", type: [.Electric], quickAttacks: [.tackle, .spark], specialAttacks: [.thunderbolt, .discharge, .signalBeam], stamina: 80, attack: 102, defense: 124)
        let electrode = Pokemon(pokedex: 101, name: "Electrode", type: [.Electric], quickAttacks: [.tackle, .spark], specialAttacks: [.thunderbolt, .discharge, .hyperBeam], stamina: 120, attack: 150, defense: 174)
        let exeggcute = Pokemon(pokedex: 102, name: "Exeggcute", type: [.Grass, .Psychic], quickAttacks: [.confusion], specialAttacks: [.psychic, .seedBomb, .ancientPower], stamina: 120, attack: 110, defense: 132)
        let exeggutor = Pokemon(pokedex: 103, name: "Exeggutor", type: [.Grass, .Psychic], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.psychic, .seedBomb, .solarBeam], stamina: 190, attack: 232, defense: 164)
        let cubone = Pokemon(pokedex: 104, name: "Cubone", type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .bulldoze], stamina: 100, attack: 102, defense: 150)
        let marowak = Pokemon(pokedex: 105, name: "Marowak", type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .earthquake], stamina: 120, attack: 140, defense: 202)
        let hitmonlee = Pokemon(pokedex: 106, name: "Hitmonlee", type: [.Fight], quickAttacks: [.lowKick, .rockSmash], specialAttacks: [.lowSweep, .stoneEdge, .brickBreak], stamina: 100, attack: 148, defense: 172)
        let hitmonchan = Pokemon(pokedex: 107, name: "Hitmonchan", type: [.Fight], quickAttacks: [.bulletPunch, .rockSmash], specialAttacks: [.firePunch, .icePunch, .thunderPunch], stamina: 100, attack: 138, defense: 204)
        let lickitung = Pokemon(pokedex: 108, name: "Lickitung", type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.hyperBeam, .stomp, .powerWhip], stamina: 180, attack: 126, defense: 160)
        let koffing = Pokemon(pokedex: 109, name: "Koffing", type: [.Poison], quickAttacks: [.tackle], specialAttacks: [.darkPulse, .sludge, .sludgeBomb], stamina: 80, attack: 136, defense: 142)
        let weezing = Pokemon(pokedex: 110, name: "Weezing", type: [.Poison], quickAttacks: [.tackle], specialAttacks: [.darkPulse, .shadowBall, .sludgeBomb], stamina: 130, attack: 190, defense: 198)
        let rhyhorn = Pokemon(pokedex: 111, name: "Rhyhorn", type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.bulldoze, .stomp, .hornAttack], stamina: 160, attack: 110, defense: 116)
        let rhydon = Pokemon(pokedex: 112, name: "Rhydon", type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.earthquake, .stoneEdge, .megahorn], stamina: 210, attack: 166, defense: 160)
        let chansey = Pokemon(pokedex: 113, name: "Chansey", type: [.Normal], quickAttacks: [.pound, .zenHeadbutt], specialAttacks: [.dazzlingGleam, .hyperBeam, .psychic], stamina: 500, attack: 40, defense: 60)
        let tangela = Pokemon(pokedex: 114, name: "Tangela", type: [.Grass], quickAttacks: [.vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .powerWhip], stamina: 130, attack: 164, defense: 152)
        let kangaskhan = Pokemon(pokedex: 115, name: "Kangaskhan", type: [.Normal], quickAttacks: [.lowKick, .mudSlap], specialAttacks: [.earthquake, .brickBreak, .stomp], stamina: 210, attack: 142, defense: 178)
        let horsea = Pokemon(pokedex: 116, name: "Horsea", type: [.Water], quickAttacks: [.waterGun, .bubble], specialAttacks: [.bubbleBeam, .dragonPulse, .flashCannon], stamina: 60, attack: 122, defense: 100)
        let seadra = Pokemon(pokedex: 117, name: "Seadra", type: [.Water], quickAttacks: [.waterGun, .dragonBreath], specialAttacks: [.hydroPump, .dragonPulse, .blizzard], stamina: 110, attack: 176, defense: 150)
        let goldeen = Pokemon(pokedex: 118, name: "Goldeen", type: [.Water], quickAttacks: [.mudShot, .peck], specialAttacks: [.aquaTail, .hornAttack, .waterPulse], stamina: 90, attack: 112, defense: 126)
        let seaking = Pokemon(pokedex: 119, name: "Seaking", type: [.Water], quickAttacks: [.poisonJab, .peck], specialAttacks: [.drillRun, .megahorn, .icyWind], stamina: 160, attack: 172, defense: 160)
        let staryu = Pokemon(pokedex: 120, name: "Staryu", type: [.Water], quickAttacks: [.waterGun, .tackle], specialAttacks: [.bubbleBeam, .powerGem, .swift], stamina: 60, attack: 130, defense: 128)
        let starmie = Pokemon(pokedex: 121, name: "Starmie", type: [.Water, .Psychic], quickAttacks: [.waterGun, .tackle], specialAttacks: [.hydroPump, .powerGem, .psybeam], stamina: 120, attack: 194, defense: 192)
        let mrMime = Pokemon(pokedex: 122, name: "Mr.Mime", type: [.Psychic, .Fairy], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.shadowBall, .psybeam, .psychic], stamina: 80, attack: 154, defense: 196)
        let scyther = Pokemon(pokedex: 123, name: "Scyther", type: [.Bug, .Flying], quickAttacks: [.steelWing, .furyCutter], specialAttacks: [.bugBuzz, .xScissor, .nightSlash], stamina: 140, attack: 176, defense: 180)
        let jynx = Pokemon(pokedex: 124, name: "Jynx", type: [.Ice, .Psychic], quickAttacks: [.pound, .frostBreath], specialAttacks: [.psyshock, .icePunch, .drainingKiss], stamina: 130, attack: 172, defense: 134)
        let electabuzz = Pokemon(pokedex: 125, name: "Electabuzz", type: [.Electric], quickAttacks: [.lowKick, .thunderShock], specialAttacks: [.thunderbolt, .thunder, .thunderPunch], stamina: 130, attack: 198, defense: 160)
        let magmar = Pokemon(pokedex: 126, name: "Magmar", type: [.Fire], quickAttacks: [.karateChop, .ember], specialAttacks: [.fireBlast, .flamethrower, .firePunch], stamina: 130, attack: 214, defense: 158)
        let pinsir = Pokemon(pokedex: 127, name: "Pinsir", type: [.Bug], quickAttacks: [.furyCutter, .rockSmash], specialAttacks: [.submission, .viceGrip, .xScissor], stamina: 130, attack: 184, defense: 186)
        let tauros = Pokemon(pokedex: 128, name: "Tauros", type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.earthquake, .ironHead, .hornAttack], stamina: 150, attack: 148, defense: 184)
        let magikarp = Pokemon(pokedex: 129, name: "Magikarp", type: [.Water], quickAttacks: [.splash], specialAttacks: [.struggle], stamina: 40, attack: 42, defense: 84)
        let gyarados = Pokemon(pokedex: 130, name: "Gyarados", type: [.Water, .Flying], quickAttacks: [.bite], specialAttacks: [.twister, .hydroPump, .dragonPulse], stamina: 190, attack: 192, defense: 196)
        let lapras = Pokemon(pokedex: 131, name: "Lapras", type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard], specialAttacks: [.iceBeam, .dragonPulse, .blizzard], stamina: 260, attack: 186, defense: 190)
        let ditto = Pokemon(pokedex: 132, name: "Ditto", type: [.Normal], quickAttacks: [.pound], specialAttacks: [.struggle], stamina: 96, attack: 110, defense: 110)
        let eevee = Pokemon(pokedex: 133, name: "Eevee", type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.bodySlam, .dig, .swift], stamina: 110, attack: 114, defense: 128)
        let vaporeon = Pokemon(pokedex: 134, name: "Vaporeon", type: [.Water], quickAttacks: [.waterGun], specialAttacks: [.aquaTail, .waterPulse, .hydroPump], stamina: 260, attack: 186, defense: 168)
        let jolteon = Pokemon(pokedex: 135, name: "Jolteon", type: [.Electric], quickAttacks: [.thunderShock], specialAttacks: [.thunderbolt, .discharge, .thunder], stamina: 130, attack: 192, defense: 174)
        let flareon = Pokemon(pokedex: 136, name: "Flareon", type: [.Fire], quickAttacks: [.ember], specialAttacks: [.flamethrower, .fireBlast, .heatWave], stamina: 130, attack: 238, defense: 178)
        let porygon = Pokemon(pokedex: 137, name: "Porygon", type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.discharge, .psybeam, .signalBeam], stamina: 130, attack: 156, defense: 158)
        let omanyte = Pokemon(pokedex: 138, name: "Omanyte", type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.rockTomb, .ancientPower, .brine], stamina: 70, attack: 132, defense: 160)
        let omastar = Pokemon(pokedex: 139, name: "Omastar", type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.rockSlide, .ancientPower, .hydroPump], stamina: 140, attack: 180, defense: 202)
        let kabuto = Pokemon(pokedex: 140, name: "Kabuto", type: [.Rock, .Water], quickAttacks: [.scratch, .mudShot], specialAttacks: [.aquaJet, .rockTomb, .ancientPower], stamina: 60, attack: 148, defense: 142)
        let kabutops = Pokemon(pokedex: 141, name: "Kabutops", type: [.Rock, .Water], quickAttacks: [.furyCutter, .mudShot], specialAttacks: [.waterPulse, .stoneEdge, .ancientPower], stamina: 120, attack: 190, defense: 190)
        let aerodactyl = Pokemon(pokedex: 142, name: "Aerodactyl", type: [.Rock, .Flying], quickAttacks: [.bite, .steelWing], specialAttacks: [.ironHead, .hyperBeam, .ancientPower], stamina: 160, attack: 182, defense: 162)
        let snorlax = Pokemon(pokedex: 143, name: "Snorlax", type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.hyperBeam, .earthquake, .bodySlam], stamina: 320, attack: 180, defense: 180)
        let articuno = Pokemon(pokedex: 144, name: "Articuno", type: [.Ice, .Flying], quickAttacks: [.frostBreath], specialAttacks: [.iceBeam, .icyWind, .blizzard], stamina: 180, attack: 198, defense: 242)
        let zapdos = Pokemon(pokedex: 145, name: "Zapdos", type: [.Electric, .Flying], quickAttacks: [.thunderShock], specialAttacks: [.discharge, .thunderbolt, .thunder], stamina: 180, attack: 232, defense: 194)
        let moltres = Pokemon(pokedex: 146, name: "Moltres", type: [.Flying, .Fire], quickAttacks: [.ember], specialAttacks: [.fireBlast, .heatWave, .flamethrower], stamina: 180, attack: 242, defense: 194)
        let dratini = Pokemon(pokedex: 147, name: "Dratini", type: [.Dragon], quickAttacks: [.dragonBreath], specialAttacks: [.wrap, .aquaTail, .twister], stamina: 82, attack: 128, defense: 110)
        let dragonair = Pokemon(pokedex: 148, name: "Dragonair", type: [.Dragon], quickAttacks: [.dragonBreath], specialAttacks: [.wrap, .aquaTail, .dragonPulse], stamina: 122, attack: 170, defense: 152)
        let dragonite = Pokemon(pokedex: 149, name: "Dragonite", type: [.Dragon, .Flying], quickAttacks: [.dragonBreath, .steelWing], specialAttacks: [.hyperBeam, .dragonClaw, .dragonPulse], stamina: 182, attack: 250, defense: 212)
        let mewtwo = Pokemon(pokedex: 150, name: "Mewtwo", type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.psychic, .shadowBall, .hyperBeam], stamina: 212, attack: 284, defense: 202)
        let mew = Pokemon(pokedex: 151, name: "Mew", type: [.Psychic], quickAttacks: [.pound], specialAttacks: [.blizzard, .dragonPulse, .earthquake, .fireBlast, .hyperBeam, .psychic, .solarBeam, .thunder ], stamina: 200, attack: 220, defense: 220)
        
        return [
            bulbasaur,
            ivysaur,
            venusaur,
            charmander,
            charmeleon,
            charizard,
            squirtle,
            wartortle,
            blastoise,
            caterpie,
            metapod,
            butterfree,
            weedle,
            kakuna,
            beedrill,
            pidgey,
            pidgeotto,
            pidgeot,
            rattata,
            raticate,
            spearow,
            fearow,
            ekans,
            arbok,
            pikachu,
            raichu,
            sandshrew,
            sandslash,
            nidoranFemale,
            nidorina,
            nidoqueen,
            nidoranMale,
            nidorino,
            nidoking,
            clefairy,
            clefable,
            vulpix,
            ninetales,
            jigglypuff,
            wigglytuff,
            zubat,
            golbat,
            oddish,
            gloom,
            vileplume,
            paras,
            parasect,
            venonat,
            venomoth,
            diglett,
            dugtrio,
            meowth,
            persian,
            psyduck,
            golduck,
            mankey,
            primeape,
            growlithe,
            arcanine,
            poliwag,
            poliwhirl,
            poliwrath,
            abra,
            kadabra,
            alakazam,
            machop,
            machoke,
            machamp,
            bellsprout,
            weepinbell,
            victreebel,
            tentacool,
            tentacruel,
            geodude,
            graveler,
            golem,
            ponyta,
            rapidash,
            slowpoke,
            slowbro,
            magnemite,
            magneton,
            farfetchd,
            doduo,
            dodrio,
            seel,
            dewgong,
            grimer,
            muk,
            shellder,
            cloyster,
            gastly,
            haunter,
            gengar,
            onix,
            drowzee,
            hypno,
            krabby,
            kingler,
            voltorb,
            electrode,
            exeggcute,
            exeggutor,
            cubone,
            marowak,
            hitmonlee,
            hitmonchan,
            lickitung,
            koffing,
            weezing,
            rhyhorn,
            rhydon,
            chansey,
            tangela,
            kangaskhan,
            horsea,
            seadra,
            goldeen,
            seaking,
            staryu,
            starmie,
            mrMime,
            scyther,
            jynx,
            electabuzz,
            magmar,
            pinsir,
            tauros,
            magikarp,
            gyarados,
            lapras,
            ditto,
            eevee,
            vaporeon,
            jolteon,
            flareon,
            porygon,
            omanyte,
            omastar,
            kabuto,
            kabutops,
            aerodactyl,
            snorlax,
            articuno,
            zapdos,
            moltres,
            dratini,
            dragonair,
            dragonite,
            mewtwo,
            mew
          ]
    }
    
    init(pokedex: Int, name: String, type: [ElementType], quickAttacks: [QuickAttack], specialAttacks: [SpecialAttack], stamina: Int, attack: Int, defense: Int){
        self.pokedex = pokedex
        self.name = name
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
