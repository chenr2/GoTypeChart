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
        let solarExeggutor = PokemonCounter(
            species: .exeggutor,
            quickMove: .zenHeadbutt,
            chargeMove: .solarBeam
        )
        let venusaur = PokemonCounter(
            species: .venusaur,
            quickMove: .vineWhip,
            chargeMove: .solarBeam
        )
        let tangela = PokemonCounter(
            species: .tangela,
            quickMove: .vineWhip,
            chargeMove: .powerWhip
        )
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
        let omanyte = PokemonCounter(
            species: .omanyte,
            quickMove: .waterGun,
            chargeMove: .brine
        )
        let primeape = PokemonCounter(
            species: .primeape,
            quickMove: .lowKick,
            chargeMove: .crossChop
        )

        switch index {
        case 126: // magmar
            let starmie = PokemonCounter(
                species: .starmie,
                quickMove: .waterGun,
                chargeMove: .hydroPump
            )
            return [kabutopsStoneEdge, omanyte, starmie]
        case 62: // poliwrath
            let slowbro = PokemonCounter(
                species: .slowbro,
                quickMove: .confusion,
                chargeMove: .psychic
            )
            return [solarExeggutor, venusaur, vileplume, victreebel, tangela, slowbro]
        case 18: // pidgeot
            let magneton = PokemonCounter(
                species: .magneton,
                quickMove: .spark,
                chargeMove: .discharge
            )
            return [magneton]
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
            return [venusaur, vileplume, victreebel, tangela]
        case 6, 146: // charizard
            return [kabutopsStoneEdge]
        case 38, 59, 78, 136: // arcanine, flareon, ninetales, rapidash
            return [kabutopsStoneEdge, omanyte]
        case 3, 45, 71: // Venusaur, Vileplume, Victreebel
            let charizard = PokemonCounter(
                species: .charizard,
                quickMove: .wingAttack,
                chargeMove: .fireBlast
            )
            let venomoth = PokemonCounter(
                species: .venomoth,
                quickMove: .confusion,
                chargeMove: .psychic
            )
            let golbat = PokemonCounter(
                species: .golbat,
                quickMove: .wingAttack,
                chargeMove: .airCutter
            )
            let pidgeot = PokemonCounter(
                species: .pidgeot,
                quickMove: .wingAttack,
                chargeMove: .hurricane
            )
            return [charizard, venomoth, golbat, pidgeot]
        case 80: // slowbro
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
            return [solarExeggutor, solarParasect, tangela, idealSeaking]
        case 103: // exeggutor
            let parasect = PokemonCounter(
                species: .parasect,
                quickMove: .bugBite,
                chargeMove: .xScissor
            )
            let butterfree = PokemonCounter(
                species: .butterfree,
                quickMove: .bugBite,
                chargeMove: .bugBuzz
            )
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
            return [parasect, butterfree, bugScyther, bugPinsir]
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
            let poliwrath = PokemonCounter(
                species: .poliwrath,
                quickMove: .mudShot,
                chargeMove: .submission
            )
            return [kabutopsStoneEdge, magnetonElectric, poliwrath, primeape, machamp]
        case 128, 143: // snorlax, tauros
            let rhydon = PokemonCounter(
                species: .rhydon,
                quickMove: .rockSmash,
                chargeMove: .earthquake
            )
            let fightingPinsir = PokemonCounter(
                species: .pinsir,
                quickMove: .rockSmash,
                chargeMove: .submission
            )
            return [primeape, machamp, rhydon, fightingPinsir]
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
