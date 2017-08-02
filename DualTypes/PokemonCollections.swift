//
//  PokemonCollections.swift
//  DualTypes
//
//  Created by Robert Chen on 9/20/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

struct PokemonCollections {
    static let bulbasaur = Pokemon(
        pokedex: 1,
        species: .bulbasaur,
        type: [.Grass, .Poison],
        quickAttacks: [.tackle, .vineWhip],
        specialAttacks: [.sludgeBomb, .seedBomb, .powerWhip],
        stamina: 90,
        attack: 118,
        defense: 118
    )
    static let ivysaur = Pokemon(pokedex: 2, species: .ivysaur, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .powerWhip], stamina: 120, attack: 151, defense: 151)
    static let venusaur = Pokemon(pokedex: 3, species: .venusaur, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .petalBlizzard], stamina: 160, attack: 198, defense: 198)
    static let charmander = Pokemon(pokedex: 4, species: .charmander, type: [.Fire], quickAttacks: [.scratch, .ember], specialAttacks: [.flameBurst, .flamethrower, .flameCharge], stamina: 78, attack: 116, defense: 96)
    static let charmeleon = Pokemon(pokedex: 5, species: .charmeleon, type: [.Fire], quickAttacks: [.fireFang, .ember], specialAttacks: [.flameBurst, .flamethrower, .firePunch], stamina: 116, attack: 158, defense: 129)
    static let charizard = Pokemon(pokedex: 6, species: .charizard, type: [.Fire, .Flying], quickAttacks: [.fireSpin, .airSlash], specialAttacks: [.dragonClaw, .overheat, .fireBlast], stamina: 156, attack: 223, defense: 176)
    static let squirtle = Pokemon(pokedex: 7, species: .squirtle, type: [.Water], quickAttacks: [.tackle, .bubble], specialAttacks: [.aquaJet, .aquaTail, .waterPulse], stamina: 88, attack: 94, defense: 122)
    static let wartortle = Pokemon(pokedex: 8, species: .wartortle, type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.aquaJet, .hydroPump, .iceBeam], stamina: 118, attack: 126, defense: 155)
    static let blastoise = Pokemon(pokedex: 9, species: .blastoise, type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.iceBeam, .hydroPump, .flashCannon], stamina: 158, attack: 171, defense: 210)
    static let caterpie = Pokemon(pokedex: 10, species: .caterpie, type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 90, attack: 55, defense: 62)
    static let metapod = Pokemon(pokedex: 11, species: .metapod, type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 100, attack: 45, defense: 64)
    static let butterfree = Pokemon(pokedex: 12, species: .butterfree, type: [.Bug, .Flying], quickAttacks: [.confusion, .struggleBug], specialAttacks: [.psychic, .bugBuzz, .signalBeam], stamina: 120, attack: 167, defense: 151)
    static let weedle = Pokemon(pokedex: 13, species: .weedle, type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 80, attack: 63, defense: 55)
    static let kakuna = Pokemon(pokedex: 14, species: .kakuna, type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 90, attack: 46, defense: 86)
    static let beedrill = Pokemon(pokedex: 15, species: .beedrill, type: [.Bug, .Poison], quickAttacks: [.infestation, .poisonJab], specialAttacks: [.aerialAce, .sludgeBomb, .xScissor], stamina: 130, attack: 169, defense: 150)
    static let pidgey = Pokemon(pokedex: 16, species: .pidgey, type: [.Normal, .Flying], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 80, attack: 85, defense: 76)
    static let pidgeotto = Pokemon(pokedex: 17, species: .pidgeotto, type: [.Normal, .Flying], quickAttacks: [.wingAttack, .steelWing], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 126, attack: 117, defense: 108)
    static let pidgeot = Pokemon(pokedex: 18, species: .pidgeot, type: [.Normal, .Flying], quickAttacks: [.airSlash, .steelWing], specialAttacks: [.hurricane, .aerialAce, .braveBird], stamina: 166, attack: 166, defense: 157)
    static let legacyPidgeot = Pokemon(pokedex: 18, species: .legacyPidgeot, type: [.Normal, .Flying], quickAttacks: [.airSlash, .wingAttack, .steelWing], specialAttacks: [.hurricane, .aerialAce, .airCutter, .braveBird], stamina: 166, attack: 166, defense: 157, legacy: true)
    static let rattata = Pokemon(pokedex: 19, species: .rattata, type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.dig, .hyperFang, .bodySlam], stamina: 60, attack: 103, defense: 70)
    static let raticate = Pokemon(pokedex: 20, species: .raticate, type: [.Normal], quickAttacks: [.bite, .quickAttack], specialAttacks: [.dig, .hyperFang, .hyperBeam], stamina: 110, attack: 161, defense: 144)
    static let spearow = Pokemon(pokedex: 21, species: .spearow, type: [.Normal, .Flying], quickAttacks: [.quickAttack, .peck], specialAttacks: [.aerialAce, .skyAttack, .drillPeck], stamina: 80, attack: 112, defense: 61)
    static let fearow = Pokemon(pokedex: 22, species: .fearow, type: [.Normal, .Flying], quickAttacks: [.steelWing, .peck], specialAttacks: [.aerialAce, .skyAttack, .drillRun], stamina: 130, attack: 182, defense: 135)
    static let ekans = Pokemon(pokedex: 23, species: .ekans, type: [.Poison], quickAttacks: [.acid, .poisonSting], specialAttacks: [.poisonFang, .sludgeBomb, .wrap], stamina: 70, attack: 110, defense: 102)
    static let arbok = Pokemon(pokedex: 24, species: .arbok, type: [.Poison], quickAttacks: [.acid, .bite], specialAttacks: [.gunkShot, .sludgeWave, .darkPulse], stamina: 120, attack: 167, defense: 158)
    static let pikachu = Pokemon(pokedex: 25, species: .pikachu, type: [.Electric], quickAttacks: [.thunderShock, .quickAttack], specialAttacks: [.thunderbolt, .discharge], stamina: 70, attack: 112, defense: 101)
    static let raichu = Pokemon(pokedex: 26, species: .raichu, type: [.Electric], quickAttacks: [.voltSwitch, .spark], specialAttacks: [.brickBreak, .thunderPunch, .wildCharge], stamina: 120, attack: 193, defense: 165)
    static let sandshrew = Pokemon(pokedex: 27, species: .sandshrew, type: [.Ground], quickAttacks: [.scratch, .mudShot], specialAttacks: [.dig, .rockSlide, .sandTomb], stamina: 100, attack: 126, defense: 145)
    static let sandslash = Pokemon(pokedex: 28, species: .sandslash, type: [.Ground], quickAttacks: [.metalClaw, .mudShot], specialAttacks: [.rockTomb, .bulldoze, .earthquake], stamina: 150, attack: 182, defense: 202)
    static let nidoranFemale = Pokemon(pokedex: 29, species: .nidoranFemale, type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .bodySlam], stamina: 110, attack: 86, defense: 94)
    static let nidorina = Pokemon(pokedex: 30, species: .nidorina, type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .dig], stamina: 140, attack: 117, defense: 126)
    static let nidoqueen = Pokemon(pokedex: 31, species: .nidoqueen, type: [.Poison, .Ground], quickAttacks: [.poisonJab, .bite], specialAttacks: [.stoneEdge, .sludgeWave, .earthquake], stamina: 180, attack: 180, defense: 174)
    static let nidoranMale = Pokemon(pokedex: 32, species: .nidoranMale, type: [.Poison], quickAttacks: [.poisonSting, .peck], specialAttacks: [.hornAttack, .bodySlam, .sludgeBomb], stamina: 92, attack: 105, defense: 76)
    static let nidorino = Pokemon(pokedex: 33, species: .nidorino, type: [.Poison], quickAttacks: [.poisonSting, .poisonJab], specialAttacks: [.hornAttack, .dig, .sludgeBomb], stamina: 122, attack: 137, defense: 112)
    static let nidoking = Pokemon(pokedex: 34, species: .nidoking, type: [.Poison, .Ground], quickAttacks: [.poisonJab, .ironTail], specialAttacks: [.megahorn, .earthquake, .sludgeWave], stamina: 162, attack: 204, defense: 157)
    static let clefairy = Pokemon(pokedex: 35, species: .clefairy, type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.bodySlam, .disarmingVoice, .moonblast], stamina: 140, attack: 107, defense: 116)
    static let clefable = Pokemon(pokedex: 36, species: .clefable, type: [.Fairy], quickAttacks: [.zenHeadbutt, .chargeBeam], specialAttacks: [.psychic, .dazzlingGleam, .moonblast], stamina: 190, attack: 178, defense: 171)
    static let vulpix = Pokemon(pokedex: 37, species: .vulpix, type: [.Fire], quickAttacks: [.quickAttack, .ember], specialAttacks: [.flamethrower, .bodySlam, .flameCharge], stamina: 76, attack: 96, defense: 122)
    static let ninetales = Pokemon(pokedex: 38, species: .ninetales, type: [.Fire], quickAttacks: [.feintAttack, .fireSpin], specialAttacks: [.heatWave, .overheat, .solarBeam], stamina: 146, attack: 169, defense: 204)
    static let jigglypuff = Pokemon(pokedex: 39, species: .jigglypuff, type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.disarmingVoice, .gyroBall, .dazzlingGleam], stamina: 230, attack: 80, defense: 44)
    static let wigglytuff = Pokemon(pokedex: 40, species: .wigglytuff, type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.dazzlingGleam, .hyperBeam, .playRough], stamina: 280, attack: 156, defense: 93)
    static let zubat = Pokemon(pokedex: 41, species: .zubat, type: [.Poison, .Flying], quickAttacks: [.bite, .quickAttack], specialAttacks: [.swift, .poisonFang, .airCutter], stamina: 80, attack: 83, defense: 76)
    static let golbat = Pokemon(pokedex: 42, species: .golbat, type: [.Poison, .Flying], quickAttacks: [.bite, .wingAttack], specialAttacks: [.shadowBall, .poisonFang, .airCutter], stamina: 150, attack: 161, defense: 153)
    static let oddish = Pokemon(pokedex: 43, species: .oddish, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .seedBomb, .sludgeBomb], stamina: 90, attack: 131, defense: 116)
    static let gloom = Pokemon(pokedex: 44, species: .gloom, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .sludgeBomb], stamina: 120, attack: 153, defense: 139)
    static let vileplume = Pokemon(pokedex: 45, species: .vileplume, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .solarBeam], stamina: 150, attack: 202, defense: 170)
    static let paras = Pokemon(pokedex: 46, species: .paras, type: [.Bug, .Grass], quickAttacks: [.bugBite, .scratch], specialAttacks: [.seedBomb, .xScissor, .crossPoison], stamina: 70, attack: 121, defense: 99)
    static let parasect = Pokemon(pokedex: 47, species: .parasect, type: [.Bug, .Grass], quickAttacks: [.struggleBug, .furyCutter], specialAttacks: [.solarBeam, .xScissor, .crossPoison], stamina: 120, attack: 165, defense: 146)
    static let legacyParasect = Pokemon(pokedex: 47, species: .legacyParasect, type: [.Bug, .Grass], quickAttacks: [.struggleBug, .bugBite, .furyCutter], specialAttacks: [.solarBeam, .xScissor, .crossPoison], stamina: 120, attack: 165, defense: 146, legacy: true)
    static let venonat = Pokemon(pokedex: 48, species: .venonat, type: [.Bug, .Poison], quickAttacks: [.confusion, .bugBite], specialAttacks: [.signalBeam, .poisonFang, .psybeam], stamina: 120, attack: 100, defense: 102)
    static let venomoth = Pokemon(pokedex: 49, species: .venomoth, type: [.Bug, .Poison], quickAttacks: [.confusion, .infestation], specialAttacks: [.bugBuzz, .silverWind, .psychic], stamina: 140, attack: 179, defense: 150)
    static let diglett = Pokemon(pokedex: 50, species: .diglett, type: [.Ground], quickAttacks: [.scratch, .mudSlap], specialAttacks: [.rockTomb, .dig, .mudBomb], stamina: 20, attack: 109, defense: 88)
    static let dugtrio = Pokemon(pokedex: 51, species: .dugtrio, type: [.Ground], quickAttacks: [.suckerPunch, .mudSlap], specialAttacks: [.stoneEdge, .earthquake, .mudBomb], stamina: 70, attack: 167, defense: 147)
    static let meowth = Pokemon(pokedex: 52, species: .meowth, type: [.Normal], quickAttacks: [.scratch, .bite], specialAttacks: [.darkPulse, .nightSlash, .foulPlay], stamina: 80, attack: 92, defense: 81)
    static let persian = Pokemon(pokedex: 53, species: .persian, type: [.Normal], quickAttacks: [.scratch, .feintAttack], specialAttacks: [.playRough, .powerGem, .foulPlay], stamina: 130, attack: 150, defense: 139)
    static let psyduck = Pokemon(pokedex: 54, species: .psyduck, type: [.Water], quickAttacks: [.zenHeadbutt, .waterGun], specialAttacks: [.aquaTail, .crossChop, .psybeam], stamina: 100, attack: 122, defense: 96)
    static let golduck = Pokemon(pokedex: 55, species: .golduck, type: [.Water], quickAttacks: [.confusion, .waterGun], specialAttacks: [.hydroPump, .iceBeam, .psychic], stamina: 160, attack: 191, defense: 163)
    static let mankey = Pokemon(pokedex: 56, species: .mankey, type: [.Fight], quickAttacks: [.karateChop, .scratch], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 80, attack: 148, defense: 87)
    static let primeape = Pokemon(pokedex: 57, species: .primeape, type: [.Fight], quickAttacks: [.counter, .lowKick], specialAttacks: [.nightSlash, .closeCombat, .lowSweep], stamina: 130, attack: 207, defense: 144)
    static let growlithe = Pokemon(pokedex: 58, species: .growlithe, type: [.Fire], quickAttacks: [.ember, .bite], specialAttacks: [.flameWheel, .bodySlam, .flamethrower], stamina: 110, attack: 136, defense: 96)
    static let arcanine = Pokemon(pokedex: 59, species: .arcanine, type: [.Fire], quickAttacks: [.fireFang, .snarl], specialAttacks: [.fireBlast, .crunch, .wildCharge], stamina: 180, attack: 227, defense: 166)
    static let legacyArcanine = Pokemon(pokedex: 59, species: .legacyArcanine, type: [.Fire], quickAttacks: [.fireFang, .snarl, .bite], specialAttacks: [.fireBlast, .bulldoze, .flamethrower, .crunch, .wildCharge], stamina: 180, attack: 227, defense: 166, legacy: true)
    static let poliwag = Pokemon(pokedex: 60, species: .poliwag, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.bodySlam, .bubbleBeam, .mudBomb], stamina: 80, attack: 101, defense: 82)
    static let poliwhirl = Pokemon(pokedex: 61, species: .poliwhirl, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.waterPulse, .bubbleBeam, .mudBomb], stamina: 130, attack: 130, defense: 130)
    static let poliwrath = Pokemon(pokedex: 62, species: .poliwrath, type: [.Water, .Fight], quickAttacks: [.bubble, .rockSmash], specialAttacks: [.icePunch, .hydroPump, .dynamicPunch], stamina: 180, attack: 182, defense: 187)
    static let abra = Pokemon(pokedex: 63, species: .abra, type: [.Psychic], quickAttacks: [.zenHeadbutt, .chargeBeam], specialAttacks: [.shadowBall, .signalBeam, .psyshock], stamina: 50, attack: 195, defense: 103)
    static let kadabra = Pokemon(pokedex: 64, species: .kadabra, type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .dazzlingGleam, .psybeam], stamina: 80, attack: 232, defense: 138)
    static let alakazam = Pokemon(pokedex: 65, species: .alakazam, type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .focusBlast, .futuresight], stamina: 110, attack: 271, defense: 194)
    static let machop = Pokemon(pokedex: 66, species: .machop, type: [.Fight], quickAttacks: [.rockSmash, .karateChop], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 140, attack: 137, defense: 88)
    static let machoke = Pokemon(pokedex: 67, species: .machoke, type: [.Fight], quickAttacks: [.lowKick, .karateChop], specialAttacks: [.brickBreak, .dynamicPunch, .submission], stamina: 160, attack: 177, defense: 130)
    static let machamp = Pokemon(pokedex: 68, species: .machamp, type: [.Fight], quickAttacks: [.bulletPunch, .counter], specialAttacks: [.heavySlam, .dynamicPunch, .closeCombat], stamina: 180, attack: 234, defense: 162)
    static let legacyMachamp = Pokemon(pokedex: 68, species: .legacyMachamp, type: [.Fight], quickAttacks: [.bulletPunch, .karateChop, .counter], specialAttacks: [.crossChop, .stoneEdge, .submission, .heavySlam, .dynamicPunch, .closeCombat], stamina: 180, attack: 234, defense: 162, legacy: true)
    static let bellsprout = Pokemon(pokedex: 69, species: .bellsprout, type: [.Grass, .Poison], quickAttacks: [.acid, .vineWhip], specialAttacks: [.sludgeBomb, .powerWhip, .wrap], stamina: 100, attack: 139, defense: 64)
    static let weepinbell = Pokemon(pokedex: 70, species: .weepinbell, type: [.Grass, .Poison], quickAttacks: [.acid, .bulletSeed], specialAttacks: [.sludgeBomb, .powerWhip, .seedBomb], stamina: 130, attack: 172, defense: 95)
    static let victreebel = Pokemon(pokedex: 71, species: .victreebel, type: [.Grass, .Poison], quickAttacks: [.acid, .razorLeaf], specialAttacks: [.sludgeBomb, .leafBlade, .solarBeam], stamina: 160, attack: 207, defense: 138)
    static let tentacool = Pokemon(pokedex: 72, species: .tentacool, type: [.Water, .Poison], quickAttacks: [.bubble, .poisonSting], specialAttacks: [.bubbleBeam, .waterPulse, .wrap], stamina: 80, attack: 97, defense: 182)
    static let tentacruel = Pokemon(pokedex: 73, species: .tentacruel, type: [.Water, .Poison], quickAttacks: [.acid, .poisonJab], specialAttacks: [.blizzard, .hydroPump, .sludgeWave], stamina: 160, attack: 166, defense: 237)
    static let geodude = Pokemon(pokedex: 74, species: .geodude, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.rockSlide, .dig, .rockTomb], stamina: 80, attack: 132, defense: 163)
    static let graveler = Pokemon(pokedex: 75, species: .graveler, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap], specialAttacks: [.rockBlast, .dig, .stoneEdge], stamina: 110, attack: 164, defense: 196)
    static let golem = Pokemon(pokedex: 76, species: .golem, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap], specialAttacks: [.rockBlast, .earthquake, .stoneEdge], stamina: 160, attack: 211, defense: 229)
    static let ponyta = Pokemon(pokedex: 77, species: .ponyta, type: [.Fire], quickAttacks: [.tackle, .ember], specialAttacks: [.flameWheel, .stomp, .flameCharge], stamina: 100, attack: 170, defense: 132)
    static let rapidash = Pokemon(pokedex: 78, species: .rapidash, type: [.Fire], quickAttacks: [.lowKick, .fireSpin], specialAttacks: [.heatWave, .fireBlast, .drillRun], stamina: 130, attack: 207, defense: 167)
    static let slowpoke = Pokemon(pokedex: 79, species: .slowpoke, type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .psyshock], stamina: 180, attack: 109, defense: 109)
    static let slowbro = Pokemon(pokedex: 80, species: .slowbro, type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .iceBeam], stamina: 190, attack: 177, defense: 194)
    static let magnemite = Pokemon(pokedex: 81, species: .magnemite, type: [.Electric, .Steel], quickAttacks: [.spark, .thunderShock], specialAttacks: [.magnetBomb, .discharge, .thunderbolt], stamina: 50, attack: 165, defense: 128)
    static let magneton = Pokemon(pokedex: 82, species: .magneton, type: [.Electric, .Steel], quickAttacks: [.spark, .chargeBeam], specialAttacks: [.magnetBomb, .zapCannon, .flashCannon], stamina: 100, attack: 223, defense: 182)
    static let farfetchd = Pokemon(pokedex: 83, species: .farfetchd, type: [.Normal, .Flying], quickAttacks: [.furyCutter, .airSlash], specialAttacks: [.airCutter, .aerialAce, .leafBlade], stamina: 104, attack: 124, defense: 118)
    static let doduo = Pokemon(pokedex: 84, species: .doduo, type: [.Normal, .Flying], quickAttacks: [.peck, .quickAttack], specialAttacks: [.braveBird, .aerialAce, .drillPeck], stamina: 70, attack: 158, defense: 88)
    static let dodrio = Pokemon(pokedex: 85, species: .dodrio, type: [.Normal, .Flying], quickAttacks: [.steelWing, .feintAttack], specialAttacks: [.drillPeck, .aerialAce, .braveBird], stamina: 120, attack: 218, defense: 145)
    static let seel = Pokemon(pokedex: 86, species: .seel, type: [.Water], quickAttacks: [.lick, .iceShard], specialAttacks: [.auroraBeam, .icyWind, .aquaTail], stamina: 130, attack: 85, defense: 128)
    static let dewgong = Pokemon(pokedex: 87, species: .dewgong, type: [.Water, .Ice], quickAttacks: [.frostBreath, .ironTail], specialAttacks: [.auroraBeam, .waterPulse, .blizzard], stamina: 180, attack: 139, defense: 184)
    static let legacyDewgong = Pokemon(pokedex: 87, species: .legacyDewgong, type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard, .ironTail], specialAttacks: [.aquaJet, .icyWind, .blizzard, .auroraBeam, .waterPulse], stamina: 180, attack: 139, defense: 184, legacy: true)
    static let grimer = Pokemon(pokedex: 88, species: .grimer, type: [.Poison], quickAttacks: [.mudSlap, .poisonJab], specialAttacks: [.sludge, .sludgeBomb, .mudBomb], stamina: 160, attack: 135, defense: 90)
    static let muk = Pokemon(pokedex: 89, species: .muk, type: [.Poison], quickAttacks: [.poisonJab, .infestation], specialAttacks: [.gunkShot, .sludgeWave, .darkPulse], stamina: 210, attack: 190, defense: 184)
    static let shellder = Pokemon(pokedex: 90, species: .shellder, type: [.Water], quickAttacks: [.iceShard, .tackle], specialAttacks: [.icyWind, .waterPulse, .bubbleBeam], stamina: 60, attack: 116, defense: 168)
    static let cloyster = Pokemon(pokedex: 91, species: .cloyster, type: [.Water, .Ice], quickAttacks: [.iceShard, .frostBreath], specialAttacks: [.auroraBeam, .avalanche, .hydroPump], stamina: 100, attack: 186, defense: 323)
    static let legacyCloyster = Pokemon(pokedex: 91, species: .legacyCloyster, type: [.Water, .Ice], quickAttacks: [.iceShard, .frostBreath], specialAttacks: [.icyWind, .blizzard, .hydroPump, .auroraBeam, .avalanche], stamina: 100, attack: 186, defense: 323, legacy: true)
    static let gastly = Pokemon(pokedex: 92, species: .gastly, type: [.Ghost, .Poison], quickAttacks: [.lick, .astonish], specialAttacks: [.darkPulse, .sludgeBomb, .nightShade], stamina: 60, attack: 186, defense: 70)
    static let haunter = Pokemon(pokedex: 93, species: .haunter, type: [.Ghost, .Poison], quickAttacks: [.astonish, .shadowClaw], specialAttacks: [.darkPulse, .sludgeBomb, .shadowPunch], stamina: 90, attack: 223, defense: 112)
    static let gengar = Pokemon(pokedex: 94, species: .gengar, type: [.Ghost, .Poison], quickAttacks: [.hex, .suckerPunch], specialAttacks: [.focusBlast, .sludgeBomb, .shadowBall], stamina: 120, attack: 261, defense: 156)
    static let onix = Pokemon(pokedex: 95, species: .onix, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.sandTomb, .stoneEdge, .heavySlam], stamina: 70, attack: 85, defense: 288)
    static let drowzee = Pokemon(pokedex: 96, species: .drowzee, type: [.Psychic], quickAttacks: [.pound, .confusion], specialAttacks: [.psychic, .psyshock, .psybeam], stamina: 120, attack: 89, defense: 158)
    static let hypno = Pokemon(pokedex: 97, species: .hypno, type: [.Psychic], quickAttacks: [.zenHeadbutt, .confusion], specialAttacks: [.psychic, .futuresight, .focusBlast], stamina: 170, attack: 144, defense: 215)
    static let krabby = Pokemon(pokedex: 98, species: .krabby, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.viceGrip, .waterPulse, .bubbleBeam], stamina: 60, attack: 181, defense: 156)
    static let kingler = Pokemon(pokedex: 99, species: .kingler, type: [.Water], quickAttacks: [.metalClaw, .bubble], specialAttacks: [.viceGrip, .waterPulse, .xScissor], stamina: 110, attack: 240, defense: 214)
    static let voltorb = Pokemon(pokedex: 100, species: .voltorb, type: [.Electric], quickAttacks: [.tackle, .spark], specialAttacks: [.thunderbolt, .discharge, .gyroBall], stamina: 80, attack: 109, defense: 114)
    static let electrode = Pokemon(pokedex: 101, species: .electrode, type: [.Electric], quickAttacks: [.voltSwitch, .spark], specialAttacks: [.thunderbolt, .discharge, .hyperBeam], stamina: 120, attack: 173, defense: 179)
    static let exeggcute = Pokemon(pokedex: 102, species: .exeggcute, type: [.Grass, .Psychic], quickAttacks: [.confusion, .bulletSeed], specialAttacks: [.psychic, .seedBomb, .ancientPower], stamina: 120, attack: 107, defense: 140)
    static let exeggutor = Pokemon(pokedex: 103, species: .exeggutor, type: [.Grass, .Psychic], quickAttacks: [.bulletSeed, .extrasensory], specialAttacks: [.psychic, .seedBomb, .solarBeam], stamina: 190, attack: 233, defense: 158)
    static let legacyExeggutor = Pokemon(pokedex: 103, species: .legacyExeggutor, type: [.Grass, .Psychic], quickAttacks: [.confusion, .zenHeadbutt, .bulletSeed, .extrasensory], specialAttacks: [.psychic, .seedBomb, .solarBeam], stamina: 190, attack: 233, defense: 158, legacy: true)
    static let cubone = Pokemon(pokedex: 104, species: .cubone, type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .bulldoze], stamina: 100, attack: 90, defense: 165)
    static let marowak = Pokemon(pokedex: 105, species: .marowak, type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .earthquake], stamina: 120, attack: 144, defense: 200)
    static let hitmonlee = Pokemon(pokedex: 106, species: .hitmonlee, type: [.Fight], quickAttacks: [.lowKick, .rockSmash], specialAttacks: [.lowSweep, .stoneEdge, .closeCombat], stamina: 100, attack: 224, defense: 211)
    static let hitmonchan = Pokemon(pokedex: 107, species: .hitmonchan, type: [.Fight], quickAttacks: [.bulletPunch, .counter], specialAttacks: [.firePunch, .thunderPunch, .closeCombat], stamina: 100, attack: 193, defense: 212)
    static let lickitung = Pokemon(pokedex: 108, species: .lickitung, type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.hyperBeam, .stomp, .powerWhip], stamina: 180, attack: 108, defense: 137)
    static let koffing = Pokemon(pokedex: 109, species: .koffing, type: [.Poison], quickAttacks: [.tackle, .infestation], specialAttacks: [.darkPulse, .sludge, .sludgeBomb], stamina: 80, attack: 119, defense: 164)
    static let weezing = Pokemon(pokedex: 110, species: .weezing, type: [.Poison], quickAttacks: [.tackle, .infestation], specialAttacks: [.darkPulse, .shadowBall, .sludgeBomb], stamina: 130, attack: 174, defense: 221)
    static let rhyhorn = Pokemon(pokedex: 111, species: .rhyhorn, type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.bulldoze, .stomp, .hornAttack], stamina: 160, attack: 140, defense: 157)
    static let rhydon = Pokemon(pokedex: 112, species: .rhydon, type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.earthquake, .stoneEdge, .megahorn], stamina: 210, attack: 222, defense: 206)
    static let chansey = Pokemon(pokedex: 113, species: .chansey, type: [.Normal], quickAttacks: [.pound, .zenHeadbutt], specialAttacks: [.dazzlingGleam, .hyperBeam, .psychic], stamina: 500, attack: 60, defense: 176)
    static let tangela = Pokemon(pokedex: 114, species: .tangela, type: [.Grass], quickAttacks: [.vineWhip, .infestation], specialAttacks: [.sludgeBomb, .solarBeam, .grassKnot], stamina: 130, attack: 183, defense: 205)
    static let kangaskhan = Pokemon(pokedex: 115, species: .kangaskhan, type: [.Normal], quickAttacks: [.lowKick, .mudSlap], specialAttacks: [.earthquake, .crunch, .outrage], stamina: 210, attack: 181, defense: 165)
    static let horsea = Pokemon(pokedex: 116, species: .horsea, type: [.Water], quickAttacks: [.waterGun, .bubble], specialAttacks: [.bubbleBeam, .dragonPulse, .flashCannon], stamina: 60, attack: 129, defense: 125)
    static let seadra = Pokemon(pokedex: 117, species: .seadra, type: [.Water], quickAttacks: [.waterGun, .dragonBreath], specialAttacks: [.hydroPump, .dragonPulse, .auroraBeam], stamina: 110, attack: 187, defense: 182)
    static let goldeen = Pokemon(pokedex: 118, species: .goldeen, type: [.Water], quickAttacks: [.mudShot, .peck], specialAttacks: [.aquaTail, .hornAttack, .waterPulse], stamina: 90, attack: 123, defense: 115)
    static let seaking = Pokemon(pokedex: 119, species: .seaking, type: [.Water], quickAttacks: [.poisonJab, .peck], specialAttacks: [.iceBeam, .megahorn, .waterPulse], stamina: 160, attack: 175, defense: 154)
    static let staryu = Pokemon(pokedex: 120, species: .staryu, type: [.Water], quickAttacks: [.waterGun, .tackle], specialAttacks: [.bubbleBeam, .powerGem, .swift], stamina: 60, attack: 137, defense: 112)
    static let starmie = Pokemon(pokedex: 121, species: .starmie, type: [.Water, .Psychic], quickAttacks: [.waterGun, .hiddenPower], specialAttacks: [.hydroPump, .powerGem, .psychic], stamina: 120, attack: 210, defense: 184)
    static let mrMime = Pokemon(pokedex: 122, species: .mrMime, type: [.Psychic, .Fairy], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.shadowBall, .psybeam, .psychic], stamina: 80, attack: 192, defense: 233)
    static let scyther = Pokemon(pokedex: 123, species: .scyther, type: [.Bug, .Flying], quickAttacks: [.airSlash, .furyCutter], specialAttacks: [.aerialAce, .xScissor, .nightSlash], stamina: 140, attack: 218, defense: 170)
    static let legacyScyther = Pokemon(pokedex: 123, species: .legacyScyther, type: [.Bug, .Flying], quickAttacks: [.airSlash, .steelWing, .furyCutter], specialAttacks: [.bugBuzz, .xScissor, .nightSlash, .aerialAce], stamina: 140, attack: 218, defense: 170, legacy: true)
    static let jynx = Pokemon(pokedex: 124, species: .jynx, type: [.Ice, .Psychic], quickAttacks: [.confusion, .frostBreath], specialAttacks: [.avalanche, .psyshock, .drainingKiss], stamina: 130, attack: 223, defense: 182)
    static let legacyJynx = Pokemon(pokedex: 124, species: .legacyJynx, type: [.Ice, .Psychic], quickAttacks: [.pound, .frostBreath, .confusion], specialAttacks: [.icePunch, .psyshock, .drainingKiss, .avalanche], stamina: 130, attack: 223, defense: 182, legacy: true)
    static let electabuzz = Pokemon(pokedex: 125, species: .electabuzz, type: [.Electric], quickAttacks: [.lowKick, .thunderShock], specialAttacks: [.thunderbolt, .thunder, .thunderPunch], stamina: 130, attack: 198, defense: 173)
    static let magmar = Pokemon(pokedex: 126, species: .magmar, type: [.Fire], quickAttacks: [.karateChop, .ember], specialAttacks: [.fireBlast, .flamethrower, .firePunch], stamina: 130, attack: 206, defense: 169)
    static let pinsir = Pokemon(pokedex: 127, species: .pinsir, type: [.Bug], quickAttacks: [.bugBite, .rockSmash], specialAttacks: [.closeCombat, .viceGrip, .xScissor], stamina: 130, attack: 238, defense: 197)
    static let tauros = Pokemon(pokedex: 128, species: .tauros, type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.earthquake, .ironHead, .hornAttack], stamina: 150, attack: 198, defense: 197)
    static let magikarp = Pokemon(pokedex: 129, species: .magikarp, type: [.Water], quickAttacks: [.splash], specialAttacks: [.struggle], stamina: 40, attack: 29, defense: 102)
    static let gyarados = Pokemon(pokedex: 130, species: .gyarados, type: [.Water, .Flying], quickAttacks: [.bite, .dragonTail], specialAttacks: [.crunch, .hydroPump, .outrage], stamina: 190, attack: 237, defense: 197)
    static let legacyGyarados = Pokemon(pokedex: 130, species: .legacyGyarados, type: [.Water, .Flying], quickAttacks: [.bite, .dragonBreath, .dragonTail], specialAttacks: [.twister, .hydroPump, .dragonPulse, .crunch, .outrage], stamina: 190, attack: 237, defense: 197, legacy: true)
    static let lapras = Pokemon(pokedex: 131, species: .lapras, type: [.Water, .Ice], quickAttacks: [.frostBreath, .waterGun], specialAttacks: [.hydroPump, .iceBeam, .blizzard], stamina: 260, attack: 165, defense: 180)
    static let legacyLapras = Pokemon(pokedex: 131, species: .legacyLapras, type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard, .waterGun], specialAttacks: [.dragonPulse, .iceBeam, .blizzard, .hydroPump], stamina: 260, attack: 165, defense: 180, legacy: true)
    static let eevee = Pokemon(pokedex: 133, species: .eevee, type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.dig, .swift], stamina: 110, attack: 104, defense: 121)
    static let vaporeon = Pokemon(pokedex: 134, species: .vaporeon, type: [.Water], quickAttacks: [.waterGun], specialAttacks: [.aquaTail, .waterPulse, .hydroPump], stamina: 260, attack: 205, defense: 177)
    static let jolteon = Pokemon(pokedex: 135, species: .jolteon, type: [.Electric], quickAttacks: [.thunderShock, .voltSwitch], specialAttacks: [.thunderbolt, .discharge, .thunder], stamina: 130, attack: 232, defense: 201)
    static let flareon = Pokemon(pokedex: 136, species: .flareon, type: [.Fire], quickAttacks: [.ember, .fireSpin], specialAttacks: [.flamethrower, .fireBlast, .overheat], stamina: 130, attack: 246, defense: 204)
    static let porygon = Pokemon(pokedex: 137, species: .porygon, type: [.Normal], quickAttacks: [.chargeBeam, .hiddenPower], specialAttacks: [.solarBeam, .hyperBeam, .zapCannon], stamina: 130, attack: 153, defense: 139)
    static let omanyte = Pokemon(pokedex: 138, species: .omanyte, type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.bubbleBeam, .ancientPower, .rockBlast], stamina: 70, attack: 155, defense: 174)
    static let omastar = Pokemon(pokedex: 139, species: .omastar, type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.rockBlast, .ancientPower, .hydroPump], stamina: 140, attack: 207, defense: 227)
    static let kabuto = Pokemon(pokedex: 140, species: .kabuto, type: [.Rock, .Water], quickAttacks: [.scratch, .mudShot], specialAttacks: [.aquaJet, .rockTomb, .ancientPower], stamina: 60, attack: 148, defense: 162)
    static let kabutops = Pokemon(pokedex: 141, species: .kabutops, type: [.Rock, .Water], quickAttacks: [.rockSmash, .mudShot], specialAttacks: [.waterPulse, .stoneEdge, .ancientPower], stamina: 120, attack: 220, defense: 203)
    static let aerodactyl = Pokemon(pokedex: 142, species: .aerodactyl, type: [.Rock, .Flying], quickAttacks: [.bite, .steelWing], specialAttacks: [.ironHead, .hyperBeam, .ancientPower], stamina: 160, attack: 221, defense: 164)
    static let snorlax = Pokemon(pokedex: 143, species: .snorlax, type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.heavySlam, .hyperBeam, .earthquake], stamina: 320, attack: 190, defense: 190)
    static let legacySnorlax = Pokemon(pokedex: 143, species: .legacySnorlax, type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.bodySlam, .hyperBeam, .earthquake, .heavySlam], stamina: 320, attack: 190, defense: 190, legacy: true)
    static let dratini = Pokemon(pokedex: 147, species: .dratini, type: [.Dragon], quickAttacks: [.dragonBreath, .ironTail], specialAttacks: [.wrap, .aquaTail, .twister], stamina: 82, attack: 119, defense: 94)
    static let dragonair = Pokemon(pokedex: 148, species: .dragonair, type: [.Dragon], quickAttacks: [.dragonBreath, .ironTail], specialAttacks: [.wrap, .aquaTail, .dragonPulse], stamina: 122, attack: 163, defense: 138)
    static let dragonite = Pokemon(pokedex: 149, species: .dragonite, type: [.Dragon, .Flying], quickAttacks: [.steelWing, .dragonTail], specialAttacks: [.hyperBeam, .hurricane, .outrage], stamina: 182, attack: 263, defense: 201)
    static let legacyDragonite = Pokemon(pokedex: 149, species: .legacyDragonite, type: [.Dragon, .Flying], quickAttacks: [.steelWing, .dragonBreath, .dragonTail], specialAttacks: [.hyperBeam, .dragonClaw, .dragonPulse, .hurricane, .outrage], stamina: 182, attack: 263, defense: 201, legacy: true)
    static let chikorita = Pokemon(pokedex: 152, species: .chikorita, type: [.Grass], quickAttacks: [.vineWhip, .tackle], specialAttacks: [.energyBall, .grassKnot, .bodySlam], stamina: 90, attack: 92, defense: 122)
    static let bayleef = Pokemon(pokedex: 153, species: .bayleef, type: [.Grass], quickAttacks: [.razorLeaf, .tackle], specialAttacks: [.energyBall, .grassKnot, .ancientPower], stamina: 120, attack: 122, defense: 155)
    static let meganium = Pokemon(pokedex: 154, species: .meganium, type: [.Grass], quickAttacks: [.razorLeaf, .vineWhip], specialAttacks: [.petalBlizzard, .solarBeam, .earthquake], stamina: 160, attack: 168, defense: 202)
    static let cyndaquil = Pokemon(pokedex: 155, species: .cyndaquil, type: [.Fire], quickAttacks: [.ember, .tackle], specialAttacks: [.flameCharge, .swift, .flamethrower], stamina: 78, attack: 116, defense: 96)
    static let quilava = Pokemon(pokedex: 156, species: .quilava, type: [.Fire], quickAttacks: [.ember, .tackle], specialAttacks: [.flameCharge, .dig, .flamethrower], stamina: 116, attack: 158, defense: 129)
    static let typhlosion = Pokemon(pokedex: 157, species: .typhlosion, type: [.Fire], quickAttacks: [.ember, .shadowClaw], specialAttacks: [.fireBlast, .overheat, .solarBeam], stamina: 156, attack: 223, defense: 176)
    static let totodile = Pokemon(pokedex: 158, species: .totodile, type: [.Water], quickAttacks: [.waterGun, .scratch], specialAttacks: [.crunch, .aquaJet, .waterPulse], stamina: 100, attack: 117, defense: 116)
    static let croconaw = Pokemon(pokedex: 159, species: .croconaw, type: [.Water], quickAttacks: [.waterGun, .scratch], specialAttacks: [.crunch, .icePunch, .waterPulse], stamina: 130, attack: 150, defense: 151)
    static let feraligatr = Pokemon(pokedex: 160, species: .feraligatr, type: [.Water], quickAttacks: [.waterGun, .bite], specialAttacks: [.crunch, .hydroPump, .iceBeam], stamina: 170, attack: 205, defense: 197)
    static let sentret = Pokemon(pokedex: 161, species: .sentret, type: [.Normal], quickAttacks: [.scratch, .quickAttack], specialAttacks: [.dig, .brickBreak, .grassKnot], stamina: 70, attack: 79, defense: 77)
    static let furret = Pokemon(pokedex: 162, species: .furret, type: [.Normal], quickAttacks: [.quickAttack, .suckerPunch], specialAttacks: [.dig, .brickBreak, .hyperBeam], stamina: 170, attack: 148, defense: 130)
    static let hoothoot = Pokemon(pokedex: 163, species: .hoothoot, type: [.Flying, .Normal], quickAttacks: [.feintAttack, .peck], specialAttacks: [.blizzard, .skyAttack], stamina: 120, attack: 67, defense: 101)
    static let noctowl = Pokemon(pokedex: 164, species: .noctowl, type: [.Flying, .Normal], quickAttacks: [.wingAttack, .extrasensory], specialAttacks: [.psychic, .skyAttack, .nightShade], stamina: 200, attack: 145, defense: 179)
    static let ledyba = Pokemon(pokedex: 165, species: .ledyba, type: [.Bug, .Flying], quickAttacks: [.tackle, .bugBite], specialAttacks: [.swift, .silverWind, .aerialAce], stamina: 80, attack: 72, defense: 142)
    static let ledian = Pokemon(pokedex: 166, species: .ledian, type: [.Bug, .Flying], quickAttacks: [.struggleBug, .bugBite], specialAttacks: [.bugBuzz, .silverWind, .aerialAce], stamina: 110, attack: 107, defense: 209)
    static let spinarak = Pokemon(pokedex: 167, species: .spinarak, type: [.Bug, .Poison], quickAttacks: [.poisonSting, .bugBite], specialAttacks: [.nightSlash, .signalBeam, .crossPoison], stamina: 80, attack: 105, defense: 73)
    static let ariados = Pokemon(pokedex: 168, species: .ariados, type: [.Bug, .Poison], quickAttacks: [.poisonSting, .infestation], specialAttacks: [.shadowSneak, .megahorn, .crossPoison], stamina: 140, attack: 161, defense: 128)
    static let crobat = Pokemon(pokedex: 169, species: .crobat, type: [.Flying, .Poison], quickAttacks: [.airSlash, .bite], specialAttacks: [.shadowBall, .airCutter, .sludgeBomb], stamina: 170, attack: 194, defense: 178)
    static let chinchou = Pokemon(pokedex: 170, species: .chinchou, type: [.Electric, .Water], quickAttacks: [.bubble, .spark], specialAttacks: [.waterPulse, .thunderbolt, .bubbleBeam], stamina: 150, attack: 106, defense: 106)
    static let lanturn = Pokemon(pokedex: 171, species: .lanturn, type: [.Electric, .Water], quickAttacks: [.waterGun, .chargeBeam], specialAttacks: [.hydroPump, .thunderbolt, .thunder], stamina: 250, attack: 146, defense: 146)
    static let pichu = Pokemon(pokedex: 172, species: .pichu, type: [.Electric], quickAttacks: [.thunderShock], specialAttacks: [.thunderbolt, .disarmingVoice, .thunderPunch], stamina: 40, attack: 77, defense: 63)
    static let cleffa = Pokemon(pokedex: 173, species: .cleffa, type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.signalBeam, .psyshock, .grassKnot], stamina: 100, attack: 75, defense: 91)
    static let igglybuff = Pokemon(pokedex: 174, species: .igglybuff, type: [.Fairy, .Normal], quickAttacks: [.pound, .feintAttack], specialAttacks: [.shadowBall, .wildCharge, .psychic], stamina: 180, attack: 69, defense: 34)
    static let togepi = Pokemon(pokedex: 175, species: .togepi, type: [.Fairy], quickAttacks: [.hiddenPower, .peck], specialAttacks: [.ancientPower, .psyshock, .dazzlingGleam], stamina: 70, attack: 67, defense: 116)
    static let togetic = Pokemon(pokedex: 176, species: .togetic, type: [.Fairy, .Flying], quickAttacks: [.extrasensory, .hiddenPower], specialAttacks: [.ancientPower, .dazzlingGleam, .aerialAce], stamina: 110, attack: 139, defense: 191)
    static let natu = Pokemon(pokedex: 177, species: .natu, type: [.Flying, .Psychic], quickAttacks: [.peck, .quickAttack], specialAttacks: [.nightShade, .psyshock, .drillPeck], stamina: 80, attack: 134, defense: 89)
    static let xatu = Pokemon(pokedex: 178, species: .xatu, type: [.Flying, .Psychic], quickAttacks: [.airSlash, .feintAttack], specialAttacks: [.ominousWind, .futuresight, .aerialAce], stamina: 130, attack: 192, defense: 146)
    static let mareep = Pokemon(pokedex: 179, species: .mareep, type: [.Electric], quickAttacks: [.tackle, .thunderShock], specialAttacks: [.bodySlam, .thunderbolt, .discharge], stamina: 110, attack: 114, defense: 82)
    static let flaaffy = Pokemon(pokedex: 180, species: .flaaffy, type: [.Electric], quickAttacks: [.tackle, .chargeBeam], specialAttacks: [.powerGem, .thunderbolt, .discharge], stamina: 140, attack: 145, defense: 112)
    static let ampharos = Pokemon(pokedex: 181, species: .ampharos, type: [.Electric], quickAttacks: [.chargeBeam, .voltSwitch], specialAttacks: [.zapCannon, .focusBlast, .thunder], stamina: 180, attack: 211, defense: 172)
    static let bellossom = Pokemon(pokedex: 182, species: .bellossom, type: [.Grass], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.leafBlade, .petalBlizzard, .dazzlingGleam], stamina: 150, attack: 169, defense: 189)
    static let marill = Pokemon(pokedex: 183, species: .marill, type: [.Fairy, .Water], quickAttacks: [.tackle, .bubble], specialAttacks: [.bubbleBeam, .aquaTail, .bodySlam], stamina: 140, attack: 37, defense: 93)
    static let azumarill = Pokemon(pokedex: 184, species: .azumarill, type: [.Fairy, .Water], quickAttacks: [.rockSmash, .bubble], specialAttacks: [.playRough, .hydroPump, .iceBeam], stamina: 200, attack: 112, defense: 152)
    static let sudowoodo = Pokemon(pokedex: 185, species: .sudowoodo, type: [.Rock], quickAttacks: [.rockThrow, .counter], specialAttacks: [.stoneEdge, .earthquake, .rockSlide], stamina: 140, attack: 167, defense: 198)
    static let politoed = Pokemon(pokedex: 186, species: .politoed, type: [.Water], quickAttacks: [.mudShot, .bubble], specialAttacks: [.hydroPump, .blizzard, .earthquake], stamina: 180, attack: 174, defense: 192)
    static let hoppip = Pokemon(pokedex: 187, species: .hoppip, type: [.Flying, .Grass], quickAttacks: [.tackle, .bulletSeed], specialAttacks: [.grassKnot, .dazzlingGleam, .seedBomb], stamina: 70, attack: 67, defense: 101)
    static let skiploom = Pokemon(pokedex: 188, species: .skiploom, type: [.Flying, .Grass], quickAttacks: [.tackle, .bulletSeed], specialAttacks: [.grassKnot, .dazzlingGleam, .energyBall], stamina: 110, attack: 91, defense: 127)
    static let jumpluff = Pokemon(pokedex: 189, species: .jumpluff, type: [.Flying, .Grass], quickAttacks: [.infestation, .bulletSeed], specialAttacks: [.energyBall, .dazzlingGleam, .solarBeam], stamina: 150, attack: 118, defense: 197)
    static let aipom = Pokemon(pokedex: 190, species: .aipom, type: [.Normal], quickAttacks: [.scratch, .astonish], specialAttacks: [.lowSweep, .swift, .aerialAce], stamina: 110, attack: 136, defense: 112)
    static let sunkern = Pokemon(pokedex: 191, species: .sunkern, type: [.Grass], quickAttacks: [.razorLeaf, .cut], specialAttacks: [.energyBall, .grassKnot, .seedBomb], stamina: 60, attack: 55, defense: 55)
    static let sunflora = Pokemon(pokedex: 192, species: .sunflora, type: [.Grass], quickAttacks: [.razorLeaf, .bulletSeed], specialAttacks: [.solarBeam, .petalBlizzard, .sludgeBomb], stamina: 150, attack: 185, defense: 148)
    static let yanma = Pokemon(pokedex: 193, species: .yanma, type: [.Bug, .Flying], quickAttacks: [.quickAttack, .wingAttack], specialAttacks: [.ancientPower, .aerialAce, .silverWind], stamina: 130, attack: 154, defense: 94)
    static let wooper = Pokemon(pokedex: 194, species: .wooper, type: [.Ground, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.mudBomb, .dig, .bodySlam], stamina: 110, attack: 75, defense: 75)
    static let quagsire = Pokemon(pokedex: 195, species: .quagsire, type: [.Ground, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.sludgeBomb, .earthquake, .stoneEdge], stamina: 190, attack: 152, defense: 152)
    static let espeon = Pokemon(pokedex: 196, species: .espeon, type: [.Psychic], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.psybeam, .psychic, .futuresight], stamina: 130, attack: 261, defense: 194)
    static let umbreon = Pokemon(pokedex: 197, species: .umbreon, type: [.Dark], quickAttacks: [.feintAttack, .snarl], specialAttacks: [.darkPulse, .foulPlay], stamina: 190, attack: 126, defense: 250)
    static let murkrow = Pokemon(pokedex: 198, species: .murkrow, type: [.Dark, .Flying], quickAttacks: [.peck, .feintAttack], specialAttacks: [.drillPeck, .foulPlay, .darkPulse], stamina: 120, attack: 175, defense: 87)
    static let slowking = Pokemon(pokedex: 199, species: .slowking, type: [.Psychic, .Water], quickAttacks: [.waterGun, .confusion], specialAttacks: [.blizzard, .psychic, .fireBlast], stamina: 190, attack: 177, defense: 194)
    static let misdreavus = Pokemon(pokedex: 200, species: .misdreavus, type: [.Ghost], quickAttacks: [.astonish, .hex], specialAttacks: [.darkPulse, .ominousWind], stamina: 120, attack: 167, defense: 167)
    static let unown = Pokemon(pokedex: 201, species: .unown, type: [.Psychic], quickAttacks: [.hiddenPower], specialAttacks: [.struggle], stamina: 96, attack: 136, defense: 91)
    static let wobbuffet = Pokemon(pokedex: 202, species: .wobbuffet, type: [.Psychic], quickAttacks: [.counter, .splash], specialAttacks: [.mirrorCoat], stamina: 380, attack: 60, defense: 106)
    static let girafarig = Pokemon(pokedex: 203, species: .girafarig, type: [.Psychic, .Normal], quickAttacks: [.tackle, .confusion], specialAttacks: [.psychic, .thunderbolt, .mirrorCoat], stamina: 140, attack: 182, defense: 133)
    static let pineco = Pokemon(pokedex: 204, species: .pineco, type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.gyroBall, .rockTomb, .sandTomb], stamina: 100, attack: 108, defense: 146)
    static let forretress = Pokemon(pokedex: 205, species: .forretress, type: [.Bug, .Steel], quickAttacks: [.bugBite, .struggleBug], specialAttacks: [.heavySlam, .earthquake, .rockTomb], stamina: 150, attack: 161, defense: 242)
    static let dunsparce = Pokemon(pokedex: 206, species: .dunsparce, type: [.Normal], quickAttacks: [.bite, .astonish], specialAttacks: [.dig, .rockSlide, .drillRun], stamina: 200, attack: 131, defense: 131)
    static let gligar = Pokemon(pokedex: 207, species: .gligar, type: [.Flying, .Ground], quickAttacks: [.furyCutter, .wingAttack], specialAttacks: [.dig, .aerialAce, .nightSlash], stamina: 130, attack: 143, defense: 204)
    static let steelix = Pokemon(pokedex: 208, species: .steelix, type: [.Ground, .Steel], quickAttacks: [.ironTail, .dragonTail], specialAttacks: [.earthquake, .heavySlam, .crunch], stamina: 150, attack: 148, defense: 333)
    static let snubbull = Pokemon(pokedex: 209, species: .snubbull, type: [.Fairy], quickAttacks: [.bite, .tackle], specialAttacks: [.brickBreak, .crunch, .dazzlingGleam], stamina: 120, attack: 137, defense: 89)
    static let granbull = Pokemon(pokedex: 210, species: .granbull, type: [.Fairy], quickAttacks: [.bite, .snarl], specialAttacks: [.crunch, .playRough, .closeCombat], stamina: 180, attack: 212, defense: 137)
    static let qwilfish = Pokemon(pokedex: 211, species: .qwilfish, type: [.Poison, .Water], quickAttacks: [.poisonSting, .waterGun], specialAttacks: [.aquaTail, .iceBeam, .sludgeWave], stamina: 130, attack: 184, defense: 148)
    static let scizor = Pokemon(pokedex: 212, species: .scizor, type: [.Bug, .Steel], quickAttacks: [.bulletPunch, .furyCutter], specialAttacks: [.xScissor, .ironHead, .nightSlash], stamina: 140, attack: 236, defense: 191)
    static let shuckle = Pokemon(pokedex: 213, species: .shuckle, type: [.Bug, .Rock], quickAttacks: [.struggleBug, .rockThrow], specialAttacks: [.rockBlast, .stoneEdge, .gyroBall], stamina: 40, attack: 17, defense: 396)
    static let heracross = Pokemon(pokedex: 214, species: .heracross, type: [.Bug, .Fight], quickAttacks: [.counter, .struggleBug], specialAttacks: [.megahorn, .closeCombat, .earthquake], stamina: 160, attack: 234, defense: 189)
    static let sneasel = Pokemon(pokedex: 215, species: .sneasel, type: [.Dark, .Ice], quickAttacks: [.iceShard, .feintAttack], specialAttacks: [.avalanche, .icePunch, .foulPlay], stamina: 110, attack: 189, defense: 157)
    static let teddiursa = Pokemon(pokedex: 216, species: .teddiursa, type: [.Normal], quickAttacks: [.scratch, .lick], specialAttacks: [.crossChop, .crunch, .playRough], stamina: 120, attack: 142, defense: 93)
    static let ursaring = Pokemon(pokedex: 217, species: .ursaring, type: [.Normal], quickAttacks: [.metalClaw, .counter], specialAttacks: [.closeCombat, .hyperBeam, .playRough], stamina: 180, attack: 236, defense: 144)
    static let slugma = Pokemon(pokedex: 218, species: .slugma, type: [.Fire], quickAttacks: [.ember, .rockThrow], specialAttacks: [.flameBurst, .flameCharge, .rockSlide], stamina: 80, attack: 118, defense: 71)
    static let magcargo = Pokemon(pokedex: 219, species: .magcargo, type: [.Fire, .Rock], quickAttacks: [.ember, .rockThrow], specialAttacks: [.heatWave, .overheat, .stoneEdge], stamina: 100, attack: 139, defense: 209)
    static let swinub = Pokemon(pokedex: 220, species: .swinub, type: [.Ground, .Ice], quickAttacks: [.tackle, .powderSnow], specialAttacks: [.icyWind, .bodySlam, .rockSlide], stamina: 100, attack: 90, defense: 74)
    static let piloswine = Pokemon(pokedex: 221, species: .piloswine, type: [.Ground, .Ice], quickAttacks: [.iceShard, .powderSnow], specialAttacks: [.avalanche, .bulldoze, .stoneEdge], stamina: 200, attack: 181, defense: 147)
    static let corsola = Pokemon(pokedex: 222, species: .corsola, type: [.Rock, .Water], quickAttacks: [.tackle, .bubble], specialAttacks: [.rockBlast, .powerGem, .bubbleBeam], stamina: 110, attack: 118, defense: 156)
    static let remoraid = Pokemon(pokedex: 223, species: .remoraid, type: [.Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.auroraBeam, .waterPulse, .rockBlast], stamina: 70, attack: 127, defense: 69)
    static let octillery = Pokemon(pokedex: 224, species: .octillery, type: [.Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.gunkShot, .waterPulse, .auroraBeam], stamina: 150, attack: 197, defense: 141)
    static let delibird = Pokemon(pokedex: 225, species: .delibird, type: [.Flying, .Ice], quickAttacks: [.iceShard, .quickAttack], specialAttacks: [.icePunch, .icyWind, .aerialAce], stamina: 90, attack: 128, defense: 90)
    static let mantine = Pokemon(pokedex: 226, species: .mantine, type: [.Flying, .Water], quickAttacks: [.bubble, .wingAttack], specialAttacks: [.waterPulse, .iceBeam, .aerialAce], stamina: 130, attack: 148, defense: 260)
    static let skarmory = Pokemon(pokedex: 227, species: .skarmory, type: [.Flying, .Steel], quickAttacks: [.steelWing, .airSlash], specialAttacks: [.braveBird, .skyAttack, .flashCannon], stamina: 130, attack: 148, defense: 260)
    static let houndour = Pokemon(pokedex: 228, species: .houndour, type: [.Dark, .Fire], quickAttacks: [.feintAttack, .ember], specialAttacks: [.crunch, .flamethrower, .darkPulse], stamina: 90, attack: 152, defense: 93)
    static let houndoom = Pokemon(pokedex: 229, species: .houndoom, type: [.Dark, .Fire], quickAttacks: [.snarl, .fireFang], specialAttacks: [.crunch, .fireBlast, .foulPlay], stamina: 150, attack: 224, defense: 159)
    static let kingdra = Pokemon(pokedex: 230, species: .kingdra, type: [.Dragon, .Water], quickAttacks: [.waterGun, .dragonBreath], specialAttacks: [.hydroPump, .blizzard, .outrage], stamina: 150, attack: 194, defense: 194)
    static let phanpy = Pokemon(pokedex: 231, species: .phanpy, type: [.Ground], quickAttacks: [.tackle, .rockSmash], specialAttacks: [.bulldoze, .rockSlide, .bodySlam], stamina: 180, attack: 107, defense: 107)
    static let donphan = Pokemon(pokedex: 232, species: .donphan, type: [.Ground], quickAttacks: [.tackle, .counter], specialAttacks: [.earthquake, .heavySlam, .playRough], stamina: 180, attack: 214, defense: 214)
    static let porygon2 = Pokemon(pokedex: 233, species: .porygon2, type: [.Normal], quickAttacks: [.hiddenPower, .chargeBeam], specialAttacks: [.solarBeam, .hyperBeam, .zapCannon], stamina: 170, attack: 198, defense: 183)
    static let stantler = Pokemon(pokedex: 234, species: .stantler, type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.stomp, .wildCharge, .megahorn], stamina: 146, attack: 192, defense: 132)
    static let smeargle = Pokemon(pokedex: 235, species: .smeargle, type: [.Normal], quickAttacks: [.tackle], specialAttacks: [.struggle], stamina: 110, attack: 40, defense: 88)
    static let tyrogue = Pokemon(pokedex: 236, species: .tyrogue, type: [.Fight], quickAttacks: [.rockSmash, .tackle], specialAttacks: [.brickBreak, .rockSlide, .lowSweep], stamina: 70, attack: 64, defense: 64)
    static let hitmontop = Pokemon(pokedex: 237, species: .hitmontop, type: [.Fight], quickAttacks: [.rockSmash, .counter], specialAttacks: [.closeCombat, .gyroBall, .stoneEdge], stamina: 100, attack: 173, defense: 214)
    static let smoochum = Pokemon(pokedex: 238, species: .smoochum, type: [.Ice, .Psychic], quickAttacks: [.powderSnow, .pound], specialAttacks: [.iceBeam, .icePunch, .psyshock], stamina: 90, attack: 153, defense: 116)
    static let elekid = Pokemon(pokedex: 239, species: .elekid, type: [.Electric], quickAttacks: [.thunderShock, .lowKick], specialAttacks: [.thunderPunch, .brickBreak, .discharge], stamina: 90, attack: 135, defense: 110)
    static let magby = Pokemon(pokedex: 240, species: .magby, type: [.Fire], quickAttacks: [.ember, .karateChop], specialAttacks: [.brickBreak, .firePunch, .flameBurst], stamina: 90, attack: 151, defense: 108)
    static let miltank = Pokemon(pokedex: 241, species: .miltank, type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.stomp, .bodySlam, .gyroBall], stamina: 190, attack: 157, defense: 211)
    static let blissey = Pokemon(pokedex: 242, species: .blissey, type: [.Normal], quickAttacks: [.pound, .zenHeadbutt], specialAttacks: [.dazzlingGleam, .hyperBeam, .psychic], stamina: 510, attack: 129, defense: 229)
//    static let raikou = Pokemon(pokedex: 243, species: .raikou, type: [.Electric], quickAttacks: [.thunderShock, .voltSwitch], specialAttacks: [.thunder, .thunderbolt, .wildCharge], stamina: 180, attack: 241, defense: 210)
//    static let entei = Pokemon(pokedex: 244, species: .entei, type: [.Fire], quickAttacks: [.fireSpin, .fireFang], specialAttacks: [.flamethrower, .fireBlast, .overheat], stamina: 230, attack: 235, defense: 180)
//    static let suicune = Pokemon(pokedex: 245, species: .suicune, type: [.Water], quickAttacks: [.extrasensory, .snarl], specialAttacks: [.hydroPump, .bubbleBeam, .waterPulse], stamina: 200, attack: 180, defense: 235)
    static let larvitar = Pokemon(pokedex: 246, species: .larvitar, type: [.Ground, .Rock], quickAttacks: [.bite, .rockSmash], specialAttacks: [.stomp, .crunch, .ancientPower], stamina: 100, attack: 115, defense: 93)
    static let pupitar = Pokemon(pokedex: 247, species: .pupitar, type: [.Ground, .Rock], quickAttacks: [.bite, .rockSmash], specialAttacks: [.dig, .crunch, .ancientPower], stamina: 140, attack: 155, defense: 133)
    static let tyranitar = Pokemon(pokedex: 248, species: .tyranitar, type: [.Dark, .Rock], quickAttacks: [.bite, .ironTail], specialAttacks: [.fireBlast, .crunch, .stoneEdge], stamina: 200, attack: 251, defense: 212)
    static let lugia = Pokemon(pokedex: 249, species: .lugia, type: [.Flying, .Psychic], quickAttacks: [.extrasensory, .dragonTail], specialAttacks: [.skyAttack, .hydroPump, .futuresight], stamina: 212, attack: 193, defense: 323)
    static let articuno = Pokemon(pokedex: 144, species: .articuno, type: [.Flying, .Ice], quickAttacks: [.frostBreath], specialAttacks: [.blizzard, .iceBeam, .icyWind], stamina: 180, attack: 192, defense: 249)
    static let moltres = Pokemon(pokedex: 146, species: .moltres, type: [.Flying, .Fire], quickAttacks: [.fireSpin, .ember], specialAttacks: [.overheat, .fireBlast, .flamethrower, .heatWave], stamina: 180, attack: 251, defense: 184)

//    static let hooh = Pokemon(pokedex: 250, species: .hooh, type: [.Fire, .Flying], quickAttacks: [.extrasensory, .steelWing], specialAttacks: [.braveBird, .fireBlast, .solarBeam], stamina: 212, attack: 263, defense: 301)
//    static let celebi = Pokemon(pokedex: 251, species: .celebi, type: [.Grass, .Psychic], quickAttacks: [.confusion, .chargeBeam], specialAttacks: [.hyperBeam, .psychic, .dazzlingGleam], stamina: 200, attack: 210, defense: 210)
    static func contenders() -> [Pokemon] {
        return [ // maybe just use attackers above a certain stat
            PokemonCollections.venusaur,
            PokemonCollections.charizard,
            PokemonCollections.blastoise,
            PokemonCollections.butterfree,
            PokemonCollections.beedrill,
            PokemonCollections.pidgeot,
            PokemonCollections.legacyPidgeot,
            PokemonCollections.raticate,
            PokemonCollections.fearow,
            PokemonCollections.arbok,
            PokemonCollections.raichu,
            PokemonCollections.sandslash,
            PokemonCollections.nidoqueen,
            PokemonCollections.nidoking,
            PokemonCollections.clefable,
            PokemonCollections.ninetales,
            PokemonCollections.wigglytuff,
            PokemonCollections.golbat,
            PokemonCollections.vileplume,
            PokemonCollections.parasect,
            PokemonCollections.legacyParasect,
            PokemonCollections.venomoth,
            PokemonCollections.dugtrio,
            PokemonCollections.persian,
            PokemonCollections.golduck,
            PokemonCollections.primeape,
            PokemonCollections.arcanine,
            PokemonCollections.legacyArcanine,
            PokemonCollections.poliwrath,
            PokemonCollections.alakazam,
            PokemonCollections.machamp,
            PokemonCollections.legacyMachamp,
            PokemonCollections.victreebel,
            PokemonCollections.tentacruel,
            PokemonCollections.golem,
            PokemonCollections.rapidash,
            PokemonCollections.slowbro,
            PokemonCollections.magneton,
            PokemonCollections.farfetchd,
            PokemonCollections.dodrio,
            PokemonCollections.dewgong,
            PokemonCollections.legacyDewgong,
            PokemonCollections.muk,
            PokemonCollections.cloyster,
            PokemonCollections.legacyCloyster,
            PokemonCollections.gengar,
            PokemonCollections.onix,
            PokemonCollections.drowzee,
            PokemonCollections.hypno,
            PokemonCollections.kingler,
            PokemonCollections.electrode,
            PokemonCollections.exeggutor,
            PokemonCollections.legacyExeggutor,
            PokemonCollections.marowak,
            PokemonCollections.hitmonlee,
            PokemonCollections.hitmonchan,
            PokemonCollections.lickitung,
            PokemonCollections.weezing,
            PokemonCollections.rhydon,
            PokemonCollections.chansey,
            PokemonCollections.tangela,
            PokemonCollections.kangaskhan,
            PokemonCollections.seadra,
            PokemonCollections.seaking,
            PokemonCollections.starmie,
            PokemonCollections.scyther,
            PokemonCollections.legacyScyther,
            PokemonCollections.jynx,
            PokemonCollections.legacyJynx,
            PokemonCollections.electabuzz,
            PokemonCollections.magmar,
            PokemonCollections.pinsir,
            PokemonCollections.tauros,
            PokemonCollections.gyarados,
            PokemonCollections.legacyGyarados,
            PokemonCollections.lapras,
            PokemonCollections.legacyLapras,
            PokemonCollections.vaporeon,
            PokemonCollections.jolteon,
            PokemonCollections.flareon,
            PokemonCollections.porygon,
            PokemonCollections.omastar,
            PokemonCollections.kabutops,
            PokemonCollections.aerodactyl,
            PokemonCollections.snorlax,
            PokemonCollections.legacySnorlax,
            PokemonCollections.dragonite,
            PokemonCollections.legacyDragonite,
            
            PokemonCollections.bayleef,
            PokemonCollections.meganium,
            PokemonCollections.typhlosion,
            PokemonCollections.feraligatr,
            PokemonCollections.furret,
            PokemonCollections.noctowl,
            PokemonCollections.ledian,
            PokemonCollections.ariados,
            PokemonCollections.crobat,
            PokemonCollections.lanturn,
            PokemonCollections.togetic,
            PokemonCollections.xatu,
            PokemonCollections.flaaffy,
            PokemonCollections.ampharos,
            PokemonCollections.bellossom,
            PokemonCollections.azumarill,
            PokemonCollections.sudowoodo,
            PokemonCollections.politoed,
            PokemonCollections.jumpluff,
            PokemonCollections.aipom,
            PokemonCollections.sunflora,
            PokemonCollections.yanma,
            PokemonCollections.quagsire,
            PokemonCollections.espeon,
            PokemonCollections.umbreon,
            PokemonCollections.murkrow,
            PokemonCollections.slowking,
            PokemonCollections.misdreavus,
            PokemonCollections.unown,
            PokemonCollections.wobbuffet,
            PokemonCollections.girafarig,
            PokemonCollections.forretress,
            PokemonCollections.dunsparce,
            PokemonCollections.gligar,
            PokemonCollections.steelix,
            PokemonCollections.granbull,
            PokemonCollections.qwilfish,
            PokemonCollections.scizor,
            PokemonCollections.shuckle,
            PokemonCollections.heracross,
            PokemonCollections.sneasel,
            PokemonCollections.ursaring,
            PokemonCollections.magcargo,
            PokemonCollections.piloswine,
            PokemonCollections.corsola,
            PokemonCollections.remoraid,
            PokemonCollections.octillery,
            PokemonCollections.delibird,
            PokemonCollections.mantine,
            PokemonCollections.skarmory,
            PokemonCollections.houndoom,
            PokemonCollections.kingdra,
            PokemonCollections.donphan,
            PokemonCollections.porygon2,
            PokemonCollections.stantler,
            PokemonCollections.smeargle,
//            PokemonCollections.tyrogue,
            PokemonCollections.hitmontop,
            PokemonCollections.miltank,
            PokemonCollections.blissey,
//            PokemonCollections.raikou,
//            PokemonCollections.entei,
//            PokemonCollections.suicune,
            PokemonCollections.tyranitar,
            PokemonCollections.lugia,
            PokemonCollections.articuno,
            PokemonCollections.moltres
//            PokemonCollections.hooh,
//            PokemonCollections.celebi

        ]
    }
    
    static func allPokemon() -> [Pokemon] {
        return [
            PokemonCollections.bulbasaur,
            PokemonCollections.ivysaur,
            PokemonCollections.venusaur,
            PokemonCollections.charmander,
            PokemonCollections.charmeleon,
            PokemonCollections.charizard,
            PokemonCollections.squirtle,
            PokemonCollections.wartortle,
            PokemonCollections.blastoise,
            PokemonCollections.caterpie,
            PokemonCollections.metapod,
            PokemonCollections.butterfree,
            PokemonCollections.weedle,
            PokemonCollections.kakuna,
            PokemonCollections.beedrill,
            PokemonCollections.pidgey,
            PokemonCollections.pidgeotto,
            PokemonCollections.pidgeot,
            PokemonCollections.legacyPidgeot,
            PokemonCollections.rattata,
            PokemonCollections.raticate,
            PokemonCollections.spearow,
            PokemonCollections.fearow,
            PokemonCollections.ekans,
            PokemonCollections.arbok,
            PokemonCollections.pikachu,
            PokemonCollections.raichu,
            PokemonCollections.sandshrew,
            PokemonCollections.sandslash,
            PokemonCollections.nidoranFemale,
            PokemonCollections.nidorina,
            PokemonCollections.nidoqueen,
            PokemonCollections.nidoranMale,
            PokemonCollections.nidorino,
            PokemonCollections.nidoking,
            PokemonCollections.clefairy,
            PokemonCollections.clefable,
            PokemonCollections.vulpix,
            PokemonCollections.ninetales,
            PokemonCollections.jigglypuff,
            PokemonCollections.wigglytuff,
            PokemonCollections.zubat,
            PokemonCollections.golbat,
            PokemonCollections.oddish,
            PokemonCollections.gloom,
            PokemonCollections.vileplume,
            PokemonCollections.paras,
            PokemonCollections.parasect,
            PokemonCollections.legacyParasect,
            PokemonCollections.venonat,
            PokemonCollections.venomoth,
            PokemonCollections.diglett,
            PokemonCollections.dugtrio,
            PokemonCollections.meowth,
            PokemonCollections.persian,
            PokemonCollections.psyduck,
            PokemonCollections.golduck,
            PokemonCollections.mankey,
            PokemonCollections.primeape,
            PokemonCollections.growlithe,
            PokemonCollections.arcanine,
            PokemonCollections.legacyArcanine,
            PokemonCollections.poliwag,
            PokemonCollections.poliwhirl,
            PokemonCollections.poliwrath,
            PokemonCollections.abra,
            PokemonCollections.kadabra,
            PokemonCollections.alakazam,
            PokemonCollections.machop,
            PokemonCollections.machoke,
            PokemonCollections.machamp,
            PokemonCollections.legacyMachamp,
            PokemonCollections.bellsprout,
            PokemonCollections.weepinbell,
            PokemonCollections.victreebel,
            PokemonCollections.tentacool,
            PokemonCollections.tentacruel,
            PokemonCollections.geodude,
            PokemonCollections.graveler,
            PokemonCollections.golem,
            PokemonCollections.ponyta,
            PokemonCollections.rapidash,
            PokemonCollections.slowpoke,
            PokemonCollections.slowbro,
            PokemonCollections.magnemite,
            PokemonCollections.magneton,
            PokemonCollections.farfetchd,
            PokemonCollections.doduo,
            PokemonCollections.dodrio,
            PokemonCollections.seel,
            PokemonCollections.dewgong,
            PokemonCollections.legacyDewgong,
            PokemonCollections.grimer,
            PokemonCollections.muk,
            PokemonCollections.shellder,
            PokemonCollections.cloyster,
            PokemonCollections.legacyCloyster,
            PokemonCollections.gastly,
            PokemonCollections.haunter,
            PokemonCollections.gengar,
            PokemonCollections.onix,
            PokemonCollections.drowzee,
            PokemonCollections.hypno,
            PokemonCollections.krabby,
            PokemonCollections.kingler,
            PokemonCollections.voltorb,
            PokemonCollections.electrode,
            PokemonCollections.exeggcute,
            PokemonCollections.exeggutor,
            PokemonCollections.legacyExeggutor,
            PokemonCollections.cubone,
            PokemonCollections.marowak,
            PokemonCollections.hitmonlee,
            PokemonCollections.hitmonchan,
            PokemonCollections.lickitung,
            PokemonCollections.koffing,
            PokemonCollections.weezing,
            PokemonCollections.rhyhorn,
            PokemonCollections.rhydon,
            PokemonCollections.chansey,
            PokemonCollections.tangela,
            PokemonCollections.kangaskhan,
            PokemonCollections.horsea,
            PokemonCollections.seadra,
            PokemonCollections.goldeen,
            PokemonCollections.seaking,
            PokemonCollections.staryu,
            PokemonCollections.starmie,
            PokemonCollections.mrMime,
            PokemonCollections.scyther,
            PokemonCollections.legacyScyther,
            PokemonCollections.jynx,
            PokemonCollections.legacyJynx,
            PokemonCollections.electabuzz,
            PokemonCollections.magmar,
            PokemonCollections.pinsir,
            PokemonCollections.tauros,
            PokemonCollections.magikarp,
            PokemonCollections.gyarados,
            PokemonCollections.legacyGyarados,
            PokemonCollections.lapras,
            PokemonCollections.legacyLapras,
            PokemonCollections.eevee,
            PokemonCollections.vaporeon,
            PokemonCollections.jolteon,
            PokemonCollections.flareon,
            PokemonCollections.porygon,
            PokemonCollections.omanyte,
            PokemonCollections.omastar,
            PokemonCollections.kabuto,
            PokemonCollections.kabutops,
            PokemonCollections.aerodactyl,
            PokemonCollections.snorlax,
            PokemonCollections.legacySnorlax,
            PokemonCollections.dratini,
            PokemonCollections.dragonair,
            PokemonCollections.dragonite,
            PokemonCollections.legacyDragonite,
            PokemonCollections.chikorita,
            PokemonCollections.bayleef,
            PokemonCollections.meganium,
            PokemonCollections.cyndaquil,
            PokemonCollections.quilava,
            PokemonCollections.typhlosion,
            PokemonCollections.totodile,
            PokemonCollections.croconaw,
            PokemonCollections.feraligatr,
            PokemonCollections.sentret,
            PokemonCollections.furret,
            PokemonCollections.hoothoot,
            PokemonCollections.noctowl,
            PokemonCollections.ledyba,
            PokemonCollections.ledian,
            PokemonCollections.spinarak,
            PokemonCollections.ariados,
            PokemonCollections.crobat,
            PokemonCollections.chinchou,
            PokemonCollections.lanturn,
            PokemonCollections.pichu,
            PokemonCollections.cleffa,
            PokemonCollections.igglybuff,
            PokemonCollections.togepi,
            PokemonCollections.togetic,
            PokemonCollections.natu,
            PokemonCollections.xatu,
            PokemonCollections.mareep,
            PokemonCollections.flaaffy,
            PokemonCollections.ampharos,
            PokemonCollections.bellossom,
            PokemonCollections.marill,
            PokemonCollections.azumarill,
            PokemonCollections.sudowoodo,
            PokemonCollections.politoed,
            PokemonCollections.hoppip,
            PokemonCollections.skiploom,
            PokemonCollections.jumpluff,
            PokemonCollections.aipom,
            PokemonCollections.sunkern,
            PokemonCollections.sunflora,
            PokemonCollections.yanma,
            PokemonCollections.wooper,
            PokemonCollections.quagsire,
            PokemonCollections.espeon,
            PokemonCollections.umbreon,
            PokemonCollections.murkrow,
            PokemonCollections.slowking,
            PokemonCollections.misdreavus,
            PokemonCollections.unown,
            PokemonCollections.wobbuffet,
            PokemonCollections.girafarig,
            PokemonCollections.pineco,
            PokemonCollections.forretress,
            PokemonCollections.dunsparce,
            PokemonCollections.gligar,
            PokemonCollections.steelix,
            PokemonCollections.snubbull,
            PokemonCollections.granbull,
            PokemonCollections.qwilfish,
            PokemonCollections.scizor,
            PokemonCollections.shuckle,
            PokemonCollections.heracross,
            PokemonCollections.sneasel,
            PokemonCollections.teddiursa,
            PokemonCollections.ursaring,
            PokemonCollections.slugma,
            PokemonCollections.magcargo,
            PokemonCollections.swinub,
            PokemonCollections.piloswine,
            PokemonCollections.corsola,
            PokemonCollections.remoraid,
            PokemonCollections.octillery,
            PokemonCollections.delibird,
            PokemonCollections.mantine,
            PokemonCollections.skarmory,
            PokemonCollections.houndour,
            PokemonCollections.houndoom,
            PokemonCollections.kingdra,
            PokemonCollections.phanpy,
            PokemonCollections.donphan,
            PokemonCollections.porygon2,
            PokemonCollections.stantler,
            PokemonCollections.smeargle,
            PokemonCollections.tyrogue,
            PokemonCollections.hitmontop,
            PokemonCollections.smoochum,
            PokemonCollections.elekid,
            PokemonCollections.magby,
            PokemonCollections.miltank,
            PokemonCollections.blissey,
//            PokemonCollections.raikou,
//            PokemonCollections.entei,
//            PokemonCollections.suicune,
            PokemonCollections.larvitar,
            PokemonCollections.pupitar,
            PokemonCollections.tyranitar,
            PokemonCollections.lugia,
            PokemonCollections.articuno,
            PokemonCollections.moltres
//            PokemonCollections.hooh,
//            PokemonCollections.celebi
        ]
    }
    
    static func gymLeaders() -> [Pokemon] {
        return [
            PokemonCollections.venusaur,
            PokemonCollections.rhydon,
            PokemonCollections.gyarados,
            PokemonCollections.legacyGyarados,
            PokemonCollections.lapras,
            PokemonCollections.legacyLapras,
            PokemonCollections.vaporeon,
            PokemonCollections.golem,
            PokemonCollections.exeggutor,
            PokemonCollections.legacyExeggutor,
            PokemonCollections.machamp,
            PokemonCollections.legacyMachamp,
            PokemonCollections.alakazam,
            PokemonCollections.arcanine,
            PokemonCollections.legacyArcanine,
            PokemonCollections.pinsir,
            PokemonCollections.jolteon,
            PokemonCollections.muk,
            PokemonCollections.kingler,
            PokemonCollections.flareon,
            PokemonCollections.snorlax,
            PokemonCollections.legacySnorlax,
            PokemonCollections.dragonite,
            PokemonCollections.legacyDragonite,
            PokemonCollections.blissey,
            PokemonCollections.tyranitar,
            PokemonCollections.donphan,
            PokemonCollections.espeon,
            PokemonCollections.heracross,
            PokemonCollections.scizor,
            PokemonCollections.ursaring,
            PokemonCollections.feraligatr,
            PokemonCollections.ampharos
        ]
    }
    
}
