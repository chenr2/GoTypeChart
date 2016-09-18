//
//  PokemonCounter.swift
//  DualTypes
//
//  Created by Robert Chen on 9/14/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

struct PokemonCounter {
    
    let species: PokemonEnumeration
    var quickMove: QuickAttack? = nil
    var chargeMove: SpecialAttack? = nil
    
    static func hardCounters(index: Int) -> [PokemonCounter] {
        let kabutopsStoneEdge = PokemonCounter(
            species: .kabutops,
            quickMove: .mudShot,
            chargeMove: .stoneEdge
        )
        let machamp = PokemonCounter(
            species: .machamp,
            quickMove: .karateChop,
            chargeMove: .crossChop
        )
        switch index {
        case 130: // gyarados
            let raichu = PokemonCounter(
                species: .raichu,
                quickMove: .spark,
                chargeMove: .thunder
            )
            let electabuzz = PokemonCounter(
                species: .electabuzz,
                quickMove: .thunderShock,
                chargeMove: .thunder
            )
            let jolteon = PokemonCounter(
                species: .venusaur,
                quickMove: .thunderShock,
                chargeMove: .thunder
            )
            return [raichu, electabuzz, jolteon]
        case 26, 125, 135: // jolteon, electabuzz, raichu
            let marowak = PokemonCounter(
                species: .marowak,
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            let sandslash = PokemonCounter(
                species: .sandslash,
                quickMove: .mudShot,
                chargeMove: .earthquake
            )
            let golem = PokemonCounter(
                species: .golem,
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            let rhydon = PokemonCounter(
                species: .rhydon,
                quickMove: .mudSlap,
                chargeMove: .earthquake
            )
            return [golem, rhydon, sandslash, marowak]

        case 134: // vaporeon
            let victreebel = PokemonCounter(
                species: .victreebel,
                quickMove: .razorLeaf,
                chargeMove: .solarBeam
            )
            let vileplume = PokemonCounter(
                species: .vileplume,
                quickMove: .razorLeaf,
                chargeMove: .solarBeam
            )
            let venusaur = PokemonCounter(
                species: .venusaur,
                quickMove: .vineWhip,
                chargeMove: .solarBeam
            )
            return [victreebel, vileplume, venusaur]
        case 6, 146: // charizard
            return [kabutopsStoneEdge]
        case 38, 59, 78, 126, 136: // arcanine, flareon, magmar, ninetales, rapidash
            let omanyte = PokemonCounter(
                species: .omanyte,
                quickMove: .waterGun,
                chargeMove: .brine
            )
            return [kabutopsStoneEdge, omanyte]
        case 3, 45, 71: // Venusaur, Vileplume, Victreebel
            let charizard = PokemonCounter(
                species: .charizard,
                quickMove: .wingAttack,
                chargeMove: .fireBlast
            )
            let jynx = PokemonCounter(
                species: .jynx,
                quickMove: .frostBreath,
                chargeMove: .psyshock
            )
            let pidgeot = PokemonCounter(
                species: .pidgeot,
                quickMove: .wingAttack,
                chargeMove: .hurricane
            )
            return [charizard, jynx, pidgeot]
        case 80: // slowbro
            let solarExeggutor = PokemonCounter(
                species: .exeggutor,
                quickMove: .zenHeadbutt,
                chargeMove: .solarBeam
            )
            let solarParasect = PokemonCounter(
                species: .parasect,
                quickMove: .bugBite,
                chargeMove: .solarBeam
            )
            let idealSeaking = PokemonCounter(
                species: .seaking,
                quickMove: .poisonJab,
                chargeMove: .megahorn
            )
            return [solarExeggutor, solarParasect, idealSeaking]
        case 103: // exeggutor
            let bugPinsir = PokemonCounter(
                species: .pinsir,
                quickMove: .furyCutter,
                chargeMove: .xScissor
            )
            let bugScyther = PokemonCounter(
                species: .scyther,
                quickMove: .furyCutter,
                chargeMove: .bugBuzz
            )
            return [bugScyther, bugPinsir]
        case 124: // jynx
            let magneton = PokemonCounter(
                species: .magneton,
                quickMove: .spark,
                chargeMove: .flashCannon
            )
            return [magneton]
        case 131: // Lapras
            let magnetonElectric = PokemonCounter(
                species: .magneton,
                quickMove: .spark,
                chargeMove: .discharge
            )
            return [machamp, kabutopsStoneEdge, magnetonElectric]
        case 128, 143: // snorlax, tauros
            let fightingPinsir = PokemonCounter(
                species: .pinsir,
                quickMove: .rockSmash,
                chargeMove: .submission
            )
            return [fightingPinsir, machamp]
        case 149: // Dragonite
            let lapras = PokemonCounter(
                species: .lapras,
                quickMove: .frostBreath,
                chargeMove: .blizzard
            )
            let cloyster = PokemonCounter(
                species: .cloyster,
                quickMove: .frostBreath,
                chargeMove: .blizzard
            )
            let dewgong = PokemonCounter(
                species: .dewgong,
                quickMove: .frostBreath,
                chargeMove: .blizzard
            )
            let clefable = PokemonCounter(
                species: .clefable,
                quickMove: .pound,
                chargeMove: .moonblast
            )
            return [lapras, cloyster, dewgong, clefable]
        case 31, 34:
            let jynx = PokemonCounter(
                species: .jynx,
                quickMove: .frostBreath,
                chargeMove: .psyshock
            )
            let gyarados = PokemonCounter(
                species: .gyarados,
                quickMove: .bite,
                chargeMove: .hydroPump
            )
            return [jynx, gyarados]
        default:
            return []
        }
    }
    
}
