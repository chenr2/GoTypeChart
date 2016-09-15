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
        switch index {
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
            return [bugPinsir]
        case 124: // jynx
            let magneton = PokemonCounter(
                name: "Magneton",
                quickMove: .spark,
                chargeMove: .flashCannon
            )
            return [magneton]
        case 131: // Lapras
            let kabutopsStoneEdge = PokemonCounter(
                name: "Kabutops",
                quickMove: .mudShot,
                chargeMove: .stoneEdge
            )
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