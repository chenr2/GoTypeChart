//
//  PokemonCounter.swift
//  DualTypes
//
//  Created by Robert Chen on 9/14/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

struct PokemonCounter {
    
    let name: String
    var quickMove: QuickAttack? = nil
    var chargeMove: SpecialAttack? = nil
    
    static func hardCounters(index: Int) -> [PokemonCounter] {
        let kabutopsStoneEdge = PokemonCounter(
            name: "Kabutops",
            quickMove: .mudShot,
            chargeMove: .stoneEdge
        )
        switch index {
        case 130: // gyarados
            let raichu = PokemonCounter(
                name: "Raichu",
                quickMove: .spark,
                chargeMove: .thunder
            )
            let electabuzz = PokemonCounter(
                name: "Electabuzz",
                quickMove: .thunderShock,
                chargeMove: .thunder
            )
            let jolteon = PokemonCounter(
                name: "Venusaur",
                quickMove: .thunderShock,
                chargeMove: .thunder
            )
            return [raichu, electabuzz, jolteon]
        case 26, 125, 135: // jolteon, electabuzz, raichu
            let marowak = PokemonCounter(
                name: "Marowak",
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            let sandslash = PokemonCounter(
                name: "Sandslash",
                quickMove: .mudShot,
                chargeMove: .earthquake
            )
            let golem = PokemonCounter(
                name: "Golem",
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            let rhydon = PokemonCounter(
                name: "Rhydon",
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            return [golem, rhydon, sandslash, marowak]

        case 134: // vaporeon
            let victreebel = PokemonCounter(
                name: "Victreebel",
                quickMove: .razorLeaf,
                chargeMove: .solarBeam
            )
            let vileplume = PokemonCounter(
                name: "Vileplume",
                quickMove: .razorLeaf,
                chargeMove: .solarBeam
            )
            let venusaur = PokemonCounter(
                name: "Venusaur",
                quickMove: .vineWhip,
                chargeMove: .solarBeam
            )
            return [victreebel, vileplume, venusaur]
        case 6, 146: // charizard
            return [kabutopsStoneEdge]
        case 38, 59, 78, 126, 136: // arcanine, flareon, magmar, ninetales, rapidash
            let omanyte = PokemonCounter(
                name: "Omanyte",
                quickMove: .waterGun,
                chargeMove: .brine
            )
            return [kabutopsStoneEdge, omanyte]
        case 3, 45, 71: // Venusaur, Vileplume, Victreebel
            let charizard = PokemonCounter(
                name: "Charizard",
                quickMove: .wingAttack,
                chargeMove: .fireBlast
            )
            let jynx = PokemonCounter(
                name: "Jynx",
                quickMove: .frostBreath,
                chargeMove: .psyshock
            )
            let pidgeot = PokemonCounter(
                name: "Pidgeot",
                quickMove: .wingAttack,
                chargeMove: .hurricane
            )
            return [charizard, jynx, pidgeot]
        case 80: // slowbro
            let solarExeggutor = PokemonCounter(
                name: "Exeggutor",
                quickMove: .zenHeadbutt,
                chargeMove: .solarBeam
            )
            let solarParasect = PokemonCounter(
                name: "Parasect",
                quickMove: .bugBite,
                chargeMove: .solarBeam
            )
            let idealSeaking = PokemonCounter(
                name: "Seaking",
                quickMove: .poisonJab,
                chargeMove: .megahorn
            )
            return [solarExeggutor, solarParasect, idealSeaking]
        case 103: // exeggutor
            let bugPinsir = PokemonCounter(
                name: "Pinsir",
                quickMove: .furyCutter,
                chargeMove: .xScissor
            )
            let bugScyther = PokemonCounter(
                name: "Scyther",
                quickMove: .furyCutter,
                chargeMove: .bugBuzz
            )
            return [bugScyther, bugPinsir]
        case 124: // jynx
            let magneton = PokemonCounter(
                name: "Magneton",
                quickMove: .spark,
                chargeMove: .flashCannon
            )
            return [magneton]
        case 131: // Lapras
            return [kabutopsStoneEdge]
        case 128, 143: // snorlax, tauros
            let fightingPinsir = PokemonCounter(
                name: "Pinsir",
                quickMove: .rockSmash,
                chargeMove: .submission
            )
            return [fightingPinsir]
        case 149: // Dragonite
            let lapras = PokemonCounter(
                name: "Lapras",
                quickMove: .frostBreath,
                chargeMove: .blizzard
            )
            return [lapras]
            
        default:
            return []
        }
    }
    
}
