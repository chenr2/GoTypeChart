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
    static let charmeleon = Pokemon(pokedex: 5, species: .charmeleon, type: [.Fire], quickAttacks: [.scratch, .ember], specialAttacks: [.flameBurst, .flamethrower, .firePunch], stamina: 116, attack: 158, defense: 129)
    static let charizard = Pokemon(pokedex: 6, species: .charizard, type: [.Fire, .Flying], quickAttacks: [.wingAttack, .ember, .dragonBreath], specialAttacks: [.dragonClaw, .flamethrower, .fireBlast], stamina: 156, attack: 223, defense: 176)
    static let squirtle = Pokemon(pokedex: 7, species: .squirtle, type: [.Water], quickAttacks: [.tackle, .bubble], specialAttacks: [.aquaJet, .aquaTail, .waterPulse], stamina: 88, attack: 94, defense: 122)
    static let wartortle = Pokemon(pokedex: 8, species: .wartortle, type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.aquaJet, .hydroPump, .iceBeam], stamina: 118, attack: 126, defense: 155)
    static let blastoise = Pokemon(pokedex: 9, species: .blastoise, type: [.Water], quickAttacks: [.bite, .waterGun], specialAttacks: [.iceBeam, .hydroPump, .flashCannon], stamina: 158, attack: 171, defense: 210)
    static let caterpie = Pokemon(pokedex: 10, species: .caterpie, type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 90, attack: 55, defense: 62)
    static let metapod = Pokemon(pokedex: 11, species: .metapod, type: [.Bug], quickAttacks: [.tackle, .bugBite], specialAttacks: [.struggle], stamina: 100, attack: 45, defense: 64)
    static let butterfree = Pokemon(pokedex: 12, species: .butterfree, type: [.Bug, .Flying], quickAttacks: [.confusion, .bugBite], specialAttacks: [.psychic, .bugBuzz, .signalBeam], stamina: 120, attack: 167, defense: 151)
    static let weedle = Pokemon(pokedex: 13, species: .weedle, type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 80, attack: 63, defense: 55)
    static let kakuna = Pokemon(pokedex: 14, species: .kakuna, type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonSting], specialAttacks: [.struggle], stamina: 90, attack: 46, defense: 86)
    static let beedrill = Pokemon(pokedex: 15, species: .beedrill, type: [.Bug, .Poison], quickAttacks: [.bugBite, .poisonJab], specialAttacks: [.aerialAce, .sludgeBomb, .xScissor], stamina: 130, attack: 169, defense: 150)
    static let pidgey = Pokemon(pokedex: 16, species: .pidgey, type: [.Normal, .Flying], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 80, attack: 85, defense: 76)
    static let pidgeotto = Pokemon(pokedex: 17, species: .pidgeotto, type: [.Normal, .Flying], quickAttacks: [.wingAttack, .steelWing], specialAttacks: [.twister, .aerialAce, .airCutter], stamina: 126, attack: 117, defense: 108)
    static let pidgeot = Pokemon(pokedex: 18, species: .pidgeot, type: [.Normal, .Flying], quickAttacks: [.wingAttack, .steelWing], specialAttacks: [.hurricane, .aerialAce, .airCutter], stamina: 166, attack: 166, defense: 157)
    static let rattata = Pokemon(pokedex: 19, species: .rattata, type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.dig, .hyperFang, .bodySlam], stamina: 60, attack: 103, defense: 70)
    static let raticate = Pokemon(pokedex: 20, species: .raticate, type: [.Normal], quickAttacks: [.bite, .quickAttack], specialAttacks: [.dig, .hyperFang, .hyperBeam], stamina: 110, attack: 161, defense: 144)
    static let spearow = Pokemon(pokedex: 21, species: .spearow, type: [.Normal, .Flying], quickAttacks: [.quickAttack, .peck], specialAttacks: [.aerialAce, .twister, .drillPeck], stamina: 80, attack: 112, defense: 61)
    static let fearow = Pokemon(pokedex: 22, species: .fearow, type: [.Normal, .Flying], quickAttacks: [.steelWing, .peck], specialAttacks: [.aerialAce, .twister, .drillRun], stamina: 130, attack: 182, defense: 135)
    static let ekans = Pokemon(pokedex: 23, species: .ekans, type: [.Poison], quickAttacks: [.acid, .poisonSting], specialAttacks: [.gunkShot, .sludgeBomb, .wrap], stamina: 70, attack: 110, defense: 102)
    static let arbok = Pokemon(pokedex: 24, species: .arbok, type: [.Poison], quickAttacks: [.acid, .bite], specialAttacks: [.gunkShot, .sludgeWave, .darkPulse], stamina: 120, attack: 167, defense: 158)
    static let pikachu = Pokemon(pokedex: 25, species: .pikachu, type: [.Electric], quickAttacks: [.thunderShock, .quickAttack], specialAttacks: [.thunderbolt, .discharge, .thunder], stamina: 70, attack: 112, defense: 101)
    static let raichu = Pokemon(pokedex: 26, species: .raichu, type: [.Electric], quickAttacks: [.thunderShock, .spark], specialAttacks: [.brickBreak, .thunderPunch, .thunder], stamina: 120, attack: 193, defense: 165)
    static let sandshrew = Pokemon(pokedex: 27, species: .sandshrew, type: [.Ground], quickAttacks: [.scratch, .mudShot], specialAttacks: [.dig, .rockSlide, .rockTomb], stamina: 100, attack: 126, defense: 145)
    static let sandslash = Pokemon(pokedex: 28, species: .sandslash, type: [.Ground], quickAttacks: [.metalClaw, .mudShot], specialAttacks: [.rockTomb, .bulldoze, .earthquake], stamina: 150, attack: 182, defense: 202)
    static let nidoranFemale = Pokemon(pokedex: 29, species: .nidoranFemale, type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .bodySlam], stamina: 110, attack: 86, defense: 94)
    static let nidorina = Pokemon(pokedex: 30, species: .nidorina, type: [.Poison], quickAttacks: [.poisonSting, .bite], specialAttacks: [.poisonFang, .sludgeBomb, .dig], stamina: 140, attack: 117, defense: 126)
    static let nidoqueen = Pokemon(pokedex: 31, species: .nidoqueen, type: [.Poison, .Ground], quickAttacks: [.poisonJab, .bite], specialAttacks: [.stoneEdge, .sludgeWave, .earthquake], stamina: 180, attack: 180, defense: 174)
    static let nidoranMale = Pokemon(pokedex: 32, species: .nidoranMale, type: [.Poison], quickAttacks: [.poisonSting, .peck], specialAttacks: [.hornAttack, .bodySlam, .sludgeBomb], stamina: 92, attack: 105, defense: 76)
    static let nidorino = Pokemon(pokedex: 33, species: .nidorino, type: [.Poison], quickAttacks: [.poisonSting, .poisonJab], specialAttacks: [.hornAttack, .dig, .sludgeBomb], stamina: 122, attack: 137, defense: 112)
    static let nidoking = Pokemon(pokedex: 34, species: .nidoking, type: [.Poison, .Ground], quickAttacks: [.poisonJab, .furyCutter], specialAttacks: [.megahorn, .earthquake, .sludgeWave], stamina: 162, attack: 204, defense: 157)
    static let clefairy = Pokemon(pokedex: 35, species: .clefairy, type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.bodySlam, .disarmingVoice, .moonblast], stamina: 140, attack: 107, defense: 116)
    static let clefable = Pokemon(pokedex: 36, species: .clefable, type: [.Fairy], quickAttacks: [.zenHeadbutt, .pound], specialAttacks: [.psychic, .dazzlingGleam, .moonblast], stamina: 190, attack: 178, defense: 171)
    static let vulpix = Pokemon(pokedex: 37, species: .vulpix, type: [.Fire], quickAttacks: [.quickAttack, .ember], specialAttacks: [.flamethrower, .bodySlam, .flameCharge], stamina: 76, attack: 96, defense: 122)
    static let ninetales = Pokemon(pokedex: 38, species: .ninetales, type: [.Fire], quickAttacks: [.feintAttack, .ember], specialAttacks: [.heatWave, .fireBlast, .flamethrower], stamina: 146, attack: 169, defense: 204)
    static let jigglypuff = Pokemon(pokedex: 39, species: .jigglypuff, type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.disarmingVoice, .bodySlam, .dazzlingGleam, .playRough], stamina: 230, attack: 80, defense: 44)
    static let wigglytuff = Pokemon(pokedex: 40, species: .wigglytuff, type: [.Normal, .Fairy], quickAttacks: [.feintAttack, .pound], specialAttacks: [.dazzlingGleam, .hyperBeam, .playRough], stamina: 280, attack: 156, defense: 93)
    static let zubat = Pokemon(pokedex: 41, species: .zubat, type: [.Poison, .Flying], quickAttacks: [.bite, .quickAttack], specialAttacks: [.sludgeBomb, .poisonFang, .airCutter], stamina: 80, attack: 83, defense: 76)
    static let golbat = Pokemon(pokedex: 42, species: .golbat, type: [.Poison, .Flying], quickAttacks: [.bite, .wingAttack], specialAttacks: [.ominousWind, .poisonFang, .airCutter], stamina: 150, attack: 161, defense: 153)
    static let oddish = Pokemon(pokedex: 43, species: .oddish, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .seedBomb, .sludgeBomb], stamina: 90, attack: 131, defense: 116)
    static let gloom = Pokemon(pokedex: 44, species: .gloom, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .sludgeBomb], stamina: 120, attack: 153, defense: 139)
    static let vileplume = Pokemon(pokedex: 45, species: .vileplume, type: [.Grass, .Poison], quickAttacks: [.razorLeaf, .acid], specialAttacks: [.moonblast, .petalBlizzard, .solarBeam], stamina: 150, attack: 202, defense: 170)
    static let paras = Pokemon(pokedex: 46, species: .paras, type: [.Bug, .Grass], quickAttacks: [.bugBite, .scratch], specialAttacks: [.seedBomb, .xScissor, .crossPoison], stamina: 70, attack: 121, defense: 99)
    static let parasect = Pokemon(pokedex: 47, species: .parasect, type: [.Bug, .Grass], quickAttacks: [.bugBite, .furyCutter], specialAttacks: [.solarBeam, .xScissor, .crossPoison], stamina: 120, attack: 165, defense: 146)
    static let venonat = Pokemon(pokedex: 48, species: .venonat, type: [.Bug, .Poison], quickAttacks: [.confusion, .bugBite], specialAttacks: [.signalBeam, .poisonFang, .psybeam], stamina: 120, attack: 100, defense: 102)
    static let venomoth = Pokemon(pokedex: 49, species: .venomoth, type: [.Bug, .Poison], quickAttacks: [.confusion, .bugBite], specialAttacks: [.bugBuzz, .poisonFang, .psychic], stamina: 140, attack: 179, defense: 150)
    static let diglett = Pokemon(pokedex: 50, species: .diglett, type: [.Ground], quickAttacks: [.scratch, .mudSlap, .mudShot], specialAttacks: [.rockTomb, .dig, .mudBomb], stamina: 20, attack: 109, defense: 88)
    static let dugtrio = Pokemon(pokedex: 51, species: .dugtrio, type: [.Ground], quickAttacks: [.suckerPunch, .mudSlap, .mudShot], specialAttacks: [.stoneEdge, .earthquake, .mudBomb], stamina: 70, attack: 167, defense: 147)
    static let meowth = Pokemon(pokedex: 52, species: .meowth, type: [.Normal], quickAttacks: [.scratch, .bite], specialAttacks: [.darkPulse, .nightSlash, .bodySlam], stamina: 80, attack: 92, defense: 81)
    static let persian = Pokemon(pokedex: 53, species: .persian, type: [.Normal], quickAttacks: [.scratch, .feintAttack], specialAttacks: [.playRough, .powerGem, .nightSlash], stamina: 130, attack: 150, defense: 139)
    static let psyduck = Pokemon(pokedex: 54, species: .psyduck, type: [.Water], quickAttacks: [.zenHeadbutt, .waterGun], specialAttacks: [.aquaTail, .crossChop, .psybeam], stamina: 100, attack: 122, defense: 96)
    static let golduck = Pokemon(pokedex: 55, species: .golduck, type: [.Water], quickAttacks: [.confusion, .waterGun], specialAttacks: [.hydroPump, .iceBeam, .psychic], stamina: 160, attack: 191, defense: 163)
    static let mankey = Pokemon(pokedex: 56, species: .mankey, type: [.Fight], quickAttacks: [.karateChop, .scratch], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 80, attack: 148, defense: 87)
    static let primeape = Pokemon(pokedex: 57, species: .primeape, type: [.Fight], quickAttacks: [.karateChop, .lowKick], specialAttacks: [.nightSlash, .crossChop, .lowSweep], stamina: 130, attack: 207, defense: 144)
    static let growlithe = Pokemon(pokedex: 58, species: .growlithe, type: [.Fire], quickAttacks: [.ember, .bite], specialAttacks: [.flameWheel, .bodySlam, .flamethrower], stamina: 110, attack: 136, defense: 96)
    static let arcanine = Pokemon(pokedex: 59, species: .arcanine, type: [.Fire], quickAttacks: [.fireFang, .bite], specialAttacks: [.fireBlast, .bulldoze, .flamethrower], stamina: 180, attack: 227, defense: 166)
    static let poliwag = Pokemon(pokedex: 60, species: .poliwag, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.bodySlam, .bubbleBeam, .mudBomb], stamina: 80, attack: 101, defense: 82)
    static let poliwhirl = Pokemon(pokedex: 61, species: .poliwhirl, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.scald, .bubbleBeam, .mudBomb], stamina: 130, attack: 130, defense: 130)
    static let poliwrath = Pokemon(pokedex: 62, species: .poliwrath, type: [.Water, .Fight], quickAttacks: [.bubble, .mudShot], specialAttacks: [.icePunch, .hydroPump, .submission], stamina: 180, attack: 182, defense: 187)
    static let abra = Pokemon(pokedex: 63, species: .abra, type: [.Psychic], quickAttacks: [.zenHeadbutt], specialAttacks: [.shadowBall, .signalBeam, .psyshock], stamina: 50, attack: 195, defense: 103)
    static let kadabra = Pokemon(pokedex: 64, species: .kadabra, type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .dazzlingGleam, .psybeam], stamina: 80, attack: 232, defense: 138)
    static let alakazam = Pokemon(pokedex: 65, species: .alakazam, type: [.Psychic], quickAttacks: [.confusion, .psychoCut], specialAttacks: [.shadowBall, .dazzlingGleam, .psychic], stamina: 110, attack: 271, defense: 194)
    static let machop = Pokemon(pokedex: 66, species: .machop, type: [.Fight], quickAttacks: [.lowKick, .karateChop], specialAttacks: [.brickBreak, .crossChop, .lowSweep], stamina: 140, attack: 137, defense: 88)
    static let machoke = Pokemon(pokedex: 67, species: .machoke, type: [.Fight], quickAttacks: [.lowKick, .karateChop], specialAttacks: [.brickBreak, .crossChop, .submission], stamina: 160, attack: 177, defense: 130)
    static let machamp = Pokemon(pokedex: 68, species: .machamp, type: [.Fight], quickAttacks: [.bulletPunch, .karateChop], specialAttacks: [.stoneEdge, .crossChop, .submission], stamina: 180, attack: 234, defense: 162)
    static let bellsprout = Pokemon(pokedex: 69, species: .bellsprout, type: [.Grass, .Poison], quickAttacks: [.acid, .vineWhip], specialAttacks: [.sludgeBomb, .powerWhip, .wrap], stamina: 100, attack: 139, defense: 64)
    static let weepinbell = Pokemon(pokedex: 70, species: .weepinbell, type: [.Grass, .Poison], quickAttacks: [.acid, .razorLeaf], specialAttacks: [.sludgeBomb, .powerWhip, .seedBomb], stamina: 130, attack: 172, defense: 95)
    static let victreebel = Pokemon(pokedex: 71, species: .victreebel, type: [.Grass, .Poison], quickAttacks: [.acid, .razorLeaf], specialAttacks: [.sludgeBomb, .leafBlade, .solarBeam], stamina: 160, attack: 207, defense: 138)
    static let tentacool = Pokemon(pokedex: 72, species: .tentacool, type: [.Water, .Poison], quickAttacks: [.bubble, .poisonSting], specialAttacks: [.bubbleBeam, .waterPulse, .wrap], stamina: 80, attack: 97, defense: 182)
    static let tentacruel = Pokemon(pokedex: 73, species: .tentacruel, type: [.Water, .Poison], quickAttacks: [.acid, .poisonJab], specialAttacks: [.blizzard, .hydroPump, .sludgeWave], stamina: 160, attack: 166, defense: 237)
    static let geodude = Pokemon(pokedex: 74, species: .geodude, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.rockSlide, .dig, .rockTomb], stamina: 80, attack: 132, defense: 163)
    static let graveler = Pokemon(pokedex: 75, species: .graveler, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap, .mudShot], specialAttacks: [.rockSlide, .dig, .stoneEdge], stamina: 110, attack: 164, defense: 196)
    static let golem = Pokemon(pokedex: 76, species: .golem, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .mudSlap, .mudShot], specialAttacks: [.ancientPower, .earthquake, .stoneEdge], stamina: 160, attack: 211, defense: 229)
    static let ponyta = Pokemon(pokedex: 77, species: .ponyta, type: [.Fire], quickAttacks: [.tackle, .ember], specialAttacks: [.flameWheel, .fireBlast, .flameCharge], stamina: 100, attack: 170, defense: 132)
    static let rapidash = Pokemon(pokedex: 78, species: .rapidash, type: [.Fire], quickAttacks: [.lowKick, .ember], specialAttacks: [.heatWave, .fireBlast, .drillRun], stamina: 130, attack: 207, defense: 167)
    static let slowpoke = Pokemon(pokedex: 79, species: .slowpoke, type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .psyshock], stamina: 180, attack: 109, defense: 109)
    static let slowbro = Pokemon(pokedex: 80, species: .slowbro, type: [.Water, .Psychic], quickAttacks: [.waterGun, .confusion], specialAttacks: [.psychic, .waterPulse, .iceBeam], stamina: 190, attack: 177, defense: 194)
    static let magnemite = Pokemon(pokedex: 81, species: .magnemite, type: [.Electric, .Steel], quickAttacks: [.spark, .thunderShock], specialAttacks: [.magnetBomb, .discharge, .thunderbolt], stamina: 50, attack: 165, defense: 128)
    static let magneton = Pokemon(pokedex: 82, species: .magneton, type: [.Electric, .Steel], quickAttacks: [.spark, .thunderShock], specialAttacks: [.magnetBomb, .discharge, .flashCannon], stamina: 100, attack: 223, defense: 182)
    static let farfetchd = Pokemon(pokedex: 83, species: .farfetchd, type: [.Normal, .Flying], quickAttacks: [.furyCutter, .cut], specialAttacks: [.airCutter, .aerialAce, .leafBlade], stamina: 104, attack: 124, defense: 118)
    static let doduo = Pokemon(pokedex: 84, species: .doduo, type: [.Normal, .Flying], quickAttacks: [.peck, .quickAttack], specialAttacks: [.swift, .aerialAce, .drillPeck], stamina: 70, attack: 158, defense: 88)
    static let dodrio = Pokemon(pokedex: 85, species: .dodrio, type: [.Normal, .Flying], quickAttacks: [.steelWing, .feintAttack], specialAttacks: [.drillPeck, .aerialAce, .airCutter], stamina: 120, attack: 218, defense: 145)
    static let seel = Pokemon(pokedex: 86, species: .seel, type: [.Water], quickAttacks: [.lick, .iceShard, .waterGun], specialAttacks: [.aquaJet, .icyWind, .aquaTail], stamina: 130, attack: 85, defense: 128)
    static let dewgong = Pokemon(pokedex: 87, species: .dewgong, type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard], specialAttacks: [.aquaJet, .icyWind, .blizzard], stamina: 180, attack: 139, defense: 184)
    static let grimer = Pokemon(pokedex: 88, species: .grimer, type: [.Poison], quickAttacks: [.mudSlap, .poisonJab, .acid], specialAttacks: [.sludge, .sludgeBomb, .mudBomb], stamina: 160, attack: 135, defense: 90)
    static let muk = Pokemon(pokedex: 89, species: .muk, type: [.Poison], quickAttacks: [.poisonJab, .lick, .acid], specialAttacks: [.gunkShot, .sludgeWave, .darkPulse], stamina: 210, attack: 190, defense: 184)
    static let shellder = Pokemon(pokedex: 90, species: .shellder, type: [.Water], quickAttacks: [.iceShard, .tackle], specialAttacks: [.icyWind, .waterPulse, .bubbleBeam], stamina: 60, attack: 116, defense: 168)
    static let cloyster = Pokemon(pokedex: 91, species: .cloyster, type: [.Water, .Ice], quickAttacks: [.iceShard, .frostBreath], specialAttacks: [.icyWind, .blizzard, .hydroPump], stamina: 100, attack: 186, defense: 323)
    static let gastly = Pokemon(pokedex: 92, species: .gastly, type: [.Ghost, .Poison], quickAttacks: [.lick, .suckerPunch], specialAttacks: [.darkPulse, .sludgeBomb, .ominousWind], stamina: 60, attack: 186, defense: 70)
    static let haunter = Pokemon(pokedex: 93, species: .haunter, type: [.Ghost, .Poison], quickAttacks: [.lick, .shadowClaw], specialAttacks: [.darkPulse, .sludgeBomb, .shadowBall], stamina: 90, attack: 223, defense: 112)
    static let gengar = Pokemon(pokedex: 94, species: .gengar, type: [.Ghost, .Poison], quickAttacks: [.shadowClaw, .suckerPunch], specialAttacks: [.darkPulse, .sludgeBomb, .shadowBall, .sludgeWave], stamina: 120, attack: 261, defense: 156)
    static let onix = Pokemon(pokedex: 95, species: .onix, type: [.Rock, .Ground], quickAttacks: [.rockThrow, .tackle], specialAttacks: [.rockSlide, .stoneEdge, .ironHead], stamina: 70, attack: 85, defense: 288)
    static let drowzee = Pokemon(pokedex: 96, species: .drowzee, type: [.Psychic], quickAttacks: [.pound, .confusion], specialAttacks: [.psychic, .psyshock, .psybeam], stamina: 120, attack: 89, defense: 158)
    static let hypno = Pokemon(pokedex: 97, species: .hypno, type: [.Psychic], quickAttacks: [.zenHeadbutt, .confusion], specialAttacks: [.psychic, .psyshock, .shadowBall], stamina: 170, attack: 144, defense: 215)
    static let krabby = Pokemon(pokedex: 98, species: .krabby, type: [.Water], quickAttacks: [.bubble, .mudShot], specialAttacks: [.viceGrip, .waterPulse, .bubbleBeam], stamina: 60, attack: 181, defense: 156)
    static let kingler = Pokemon(pokedex: 99, species: .kingler, type: [.Water], quickAttacks: [.metalClaw, .mudShot], specialAttacks: [.viceGrip, .waterPulse, .xScissor], stamina: 110, attack: 240, defense: 214)
    static let voltorb = Pokemon(pokedex: 100, species: .voltorb, type: [.Electric], quickAttacks: [.tackle, .spark], specialAttacks: [.thunderbolt, .discharge, .signalBeam], stamina: 80, attack: 109, defense: 114)
    static let electrode = Pokemon(pokedex: 101, species: .electrode, type: [.Electric], quickAttacks: [.tackle, .spark], specialAttacks: [.thunderbolt, .discharge, .hyperBeam], stamina: 120, attack: 173, defense: 179)
    static let exeggcute = Pokemon(pokedex: 102, species: .exeggcute, type: [.Grass, .Psychic], quickAttacks: [.confusion], specialAttacks: [.psychic, .seedBomb, .ancientPower], stamina: 120, attack: 107, defense: 140)
    static let exeggutor = Pokemon(pokedex: 103, species: .exeggutor, type: [.Grass, .Psychic], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.psychic, .seedBomb, .solarBeam], stamina: 190, attack: 233, defense: 158)
    static let cubone = Pokemon(pokedex: 104, species: .cubone, type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .bulldoze], stamina: 100, attack: 90, defense: 165)
    static let marowak = Pokemon(pokedex: 105, species: .marowak, type: [.Ground], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.boneClub, .dig, .earthquake], stamina: 120, attack: 144, defense: 200)
    static let hitmonlee = Pokemon(pokedex: 106, species: .hitmonlee, type: [.Fight], quickAttacks: [.lowKick, .rockSmash], specialAttacks: [.lowSweep, .stoneEdge, .brickBreak, .stomp], stamina: 100, attack: 224, defense: 211)
    static let hitmonchan = Pokemon(pokedex: 107, species: .hitmonchan, type: [.Fight], quickAttacks: [.bulletPunch, .rockSmash], specialAttacks: [.firePunch, .icePunch, .thunderPunch, .brickBreak], stamina: 100, attack: 193, defense: 212)
    static let lickitung = Pokemon(pokedex: 108, species: .lickitung, type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.hyperBeam, .stomp, .powerWhip], stamina: 180, attack: 108, defense: 137)
    static let koffing = Pokemon(pokedex: 109, species: .koffing, type: [.Poison], quickAttacks: [.tackle, .acid], specialAttacks: [.darkPulse, .sludge, .sludgeBomb], stamina: 80, attack: 119, defense: 164)
    static let weezing = Pokemon(pokedex: 110, species: .weezing, type: [.Poison], quickAttacks: [.tackle, .acid], specialAttacks: [.darkPulse, .shadowBall, .sludgeBomb], stamina: 130, attack: 174, defense: 221)
    static let rhyhorn = Pokemon(pokedex: 111, species: .rhyhorn, type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.bulldoze, .stomp, .hornAttack], stamina: 160, attack: 140, defense: 157)
    static let rhydon = Pokemon(pokedex: 112, species: .rhydon, type: [.Ground, .Rock], quickAttacks: [.rockSmash, .mudSlap], specialAttacks: [.earthquake, .stoneEdge, .megahorn], stamina: 210, attack: 222, defense: 206)
    static let chansey = Pokemon(pokedex: 113, species: .chansey, type: [.Normal], quickAttacks: [.pound, .zenHeadbutt], specialAttacks: [.dazzlingGleam, .hyperBeam, .psychic, .psybeam], stamina: 500, attack: 60, defense: 176)
    static let tangela = Pokemon(pokedex: 114, species: .tangela, type: [.Grass], quickAttacks: [.vineWhip], specialAttacks: [.sludgeBomb, .solarBeam, .powerWhip], stamina: 130, attack: 183, defense: 205)
    static let kangaskhan = Pokemon(pokedex: 115, species: .kangaskhan, type: [.Normal], quickAttacks: [.lowKick, .mudSlap], specialAttacks: [.earthquake, .brickBreak, .stomp], stamina: 210, attack: 181, defense: 165)
    static let horsea = Pokemon(pokedex: 116, species: .horsea, type: [.Water], quickAttacks: [.waterGun, .bubble], specialAttacks: [.bubbleBeam, .dragonPulse, .flashCannon], stamina: 60, attack: 129, defense: 125)
    static let seadra = Pokemon(pokedex: 117, species: .seadra, type: [.Water], quickAttacks: [.waterGun, .dragonBreath], specialAttacks: [.hydroPump, .dragonPulse, .blizzard], stamina: 110, attack: 187, defense: 182)
    static let goldeen = Pokemon(pokedex: 118, species: .goldeen, type: [.Water], quickAttacks: [.mudShot, .peck], specialAttacks: [.aquaTail, .hornAttack, .waterPulse], stamina: 90, attack: 123, defense: 115)
    static let seaking = Pokemon(pokedex: 119, species: .seaking, type: [.Water], quickAttacks: [.poisonJab, .peck], specialAttacks: [.drillRun, .megahorn, .icyWind], stamina: 160, attack: 175, defense: 154)
    static let staryu = Pokemon(pokedex: 120, species: .staryu, type: [.Water], quickAttacks: [.waterGun, .tackle, .quickAttack], specialAttacks: [.bubbleBeam, .powerGem, .swift], stamina: 60, attack: 137, defense: 112)
    static let starmie = Pokemon(pokedex: 121, species: .starmie, type: [.Water, .Psychic], quickAttacks: [.waterGun, .tackle, .quickAttack], specialAttacks: [.hydroPump, .powerGem, .psybeam, .psychic], stamina: 120, attack: 210, defense: 184)
    static let mrMime = Pokemon(pokedex: 122, species: .mrMime, type: [.Psychic, .Fairy], quickAttacks: [.confusion, .zenHeadbutt], specialAttacks: [.shadowBall, .psybeam, .psychic], stamina: 80, attack: 192, defense: 233)
    static let scyther = Pokemon(pokedex: 123, species: .scyther, type: [.Bug, .Flying], quickAttacks: [.steelWing, .furyCutter], specialAttacks: [.bugBuzz, .xScissor, .nightSlash], stamina: 140, attack: 218, defense: 170)
    static let jynx = Pokemon(pokedex: 124, species: .jynx, type: [.Ice, .Psychic], quickAttacks: [.pound, .frostBreath], specialAttacks: [.psyshock, .icePunch, .drainingKiss], stamina: 130, attack: 223, defense: 182)
    static let electabuzz = Pokemon(pokedex: 125, species: .electabuzz, type: [.Electric], quickAttacks: [.lowKick, .thunderShock], specialAttacks: [.thunderbolt, .thunder, .thunderPunch], stamina: 130, attack: 198, defense: 173)
    static let magmar = Pokemon(pokedex: 126, species: .magmar, type: [.Fire], quickAttacks: [.karateChop, .ember], specialAttacks: [.fireBlast, .flamethrower, .firePunch], stamina: 130, attack: 206, defense: 169)
    static let pinsir = Pokemon(pokedex: 127, species: .pinsir, type: [.Bug], quickAttacks: [.furyCutter, .rockSmash], specialAttacks: [.submission, .viceGrip, .xScissor], stamina: 130, attack: 238, defense: 197)
    static let tauros = Pokemon(pokedex: 128, species: .tauros, type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt], specialAttacks: [.earthquake, .ironHead, .hornAttack], stamina: 150, attack: 198, defense: 197)
    static let magikarp = Pokemon(pokedex: 129, species: .magikarp, type: [.Water], quickAttacks: [.splash], specialAttacks: [.struggle], stamina: 40, attack: 29, defense: 102)
    static let gyarados = Pokemon(pokedex: 130, species: .gyarados, type: [.Water, .Flying], quickAttacks: [.bite, .dragonBreath], specialAttacks: [.twister, .hydroPump, .dragonPulse], stamina: 190, attack: 237, defense: 197)
    static let lapras = Pokemon(pokedex: 131, species: .lapras, type: [.Water, .Ice], quickAttacks: [.frostBreath, .iceShard], specialAttacks: [.iceBeam, .dragonPulse, .blizzard], stamina: 260, attack: 186, defense: 190)
    static let eevee = Pokemon(pokedex: 133, species: .eevee, type: [.Normal], quickAttacks: [.tackle, .quickAttack], specialAttacks: [.bodySlam, .dig, .swift], stamina: 110, attack: 104, defense: 121)
    static let vaporeon = Pokemon(pokedex: 134, species: .vaporeon, type: [.Water], quickAttacks: [.waterGun], specialAttacks: [.aquaTail, .waterPulse, .hydroPump], stamina: 260, attack: 205, defense: 177)
    static let jolteon = Pokemon(pokedex: 135, species: .jolteon, type: [.Electric], quickAttacks: [.thunderShock], specialAttacks: [.thunderbolt, .discharge, .thunder], stamina: 130, attack: 232, defense: 201)
    static let flareon = Pokemon(pokedex: 136, species: .flareon, type: [.Fire], quickAttacks: [.ember], specialAttacks: [.flamethrower, .fireBlast, .heatWave], stamina: 130, attack: 246, defense: 204)
    static let porygon = Pokemon(pokedex: 137, species: .porygon, type: [.Normal], quickAttacks: [.tackle, .zenHeadbutt, .quickAttack], specialAttacks: [.discharge, .psybeam, .signalBeam], stamina: 130, attack: 153, defense: 139)
    static let omanyte = Pokemon(pokedex: 138, species: .omanyte, type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot], specialAttacks: [.rockTomb, .ancientPower, .brine], stamina: 70, attack: 155, defense: 174)
    static let omastar = Pokemon(pokedex: 139, species: .omastar, type: [.Rock, .Water], quickAttacks: [.waterGun, .mudShot, .rockThrow], specialAttacks: [.rockSlide, .ancientPower, .hydroPump], stamina: 140, attack: 207, defense: 227)
    static let kabuto = Pokemon(pokedex: 140, species: .kabuto, type: [.Rock, .Water], quickAttacks: [.scratch, .mudShot], specialAttacks: [.aquaJet, .rockTomb, .ancientPower], stamina: 60, attack: 148, defense: 162)
    static let kabutops = Pokemon(pokedex: 141, species: .kabutops, type: [.Rock, .Water], quickAttacks: [.furyCutter, .mudShot], specialAttacks: [.waterPulse, .stoneEdge, .ancientPower], stamina: 120, attack: 220, defense: 203)
    static let aerodactyl = Pokemon(pokedex: 142, species: .aerodactyl, type: [.Rock, .Flying], quickAttacks: [.bite, .steelWing], specialAttacks: [.ironHead, .hyperBeam, .ancientPower], stamina: 160, attack: 221, defense: 164)
    static let snorlax = Pokemon(pokedex: 143, species: .snorlax, type: [.Normal], quickAttacks: [.lick, .zenHeadbutt], specialAttacks: [.hyperBeam, .earthquake, .bodySlam], stamina: 320, attack: 190, defense: 190)
    static let dratini = Pokemon(pokedex: 147, species: .dratini, type: [.Dragon], quickAttacks: [.dragonBreath], specialAttacks: [.wrap, .aquaTail, .twister], stamina: 82, attack: 119, defense: 94)
    static let dragonair = Pokemon(pokedex: 148, species: .dragonair, type: [.Dragon], quickAttacks: [.dragonBreath], specialAttacks: [.wrap, .aquaTail, .dragonPulse], stamina: 122, attack: 163, defense: 138)
    static let dragonite = Pokemon(pokedex: 149, species: .dragonite, type: [.Dragon, .Flying], quickAttacks: [.dragonBreath, .steelWing], specialAttacks: [.hyperBeam, .dragonClaw, .dragonPulse], stamina: 182, attack: 263, defense: 201)
    
    static func contenders() -> [Pokemon] {
        return [
            PokemonCollections.venusaur,
            PokemonCollections.charizard,
            PokemonCollections.blastoise,
            PokemonCollections.butterfree,
            PokemonCollections.beedrill,
            PokemonCollections.pidgeot,
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
            PokemonCollections.venomoth,
            PokemonCollections.dugtrio,
            PokemonCollections.persian,
            PokemonCollections.golduck,
            PokemonCollections.primeape,
            PokemonCollections.arcanine,
            PokemonCollections.poliwrath,
            PokemonCollections.alakazam,
            PokemonCollections.machamp,
            PokemonCollections.victreebel,
            PokemonCollections.tentacruel,
            PokemonCollections.golem,
            PokemonCollections.rapidash,
            PokemonCollections.slowbro,
            PokemonCollections.magneton,
            PokemonCollections.farfetchd,
            PokemonCollections.dodrio,
            PokemonCollections.dewgong,
            PokemonCollections.muk,
            PokemonCollections.cloyster,
            PokemonCollections.gastly,
            PokemonCollections.gengar,
            PokemonCollections.onix,
            PokemonCollections.drowzee,
            PokemonCollections.hypno,
            PokemonCollections.kingler,
            PokemonCollections.electrode,
            PokemonCollections.exeggutor,
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
            PokemonCollections.jynx,
            PokemonCollections.electabuzz,
            PokemonCollections.magmar,
            PokemonCollections.pinsir,
            PokemonCollections.tauros,
            PokemonCollections.gyarados,
            PokemonCollections.lapras,
            PokemonCollections.vaporeon,
            PokemonCollections.jolteon,
            PokemonCollections.flareon,
            PokemonCollections.porygon,
            PokemonCollections.omastar,
            PokemonCollections.kabutops,
            PokemonCollections.aerodactyl,
            PokemonCollections.snorlax,
            PokemonCollections.dragonite
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
            PokemonCollections.poliwag,
            PokemonCollections.poliwhirl,
            PokemonCollections.poliwrath,
            PokemonCollections.abra,
            PokemonCollections.kadabra,
            PokemonCollections.alakazam,
            PokemonCollections.machop,
            PokemonCollections.machoke,
            PokemonCollections.machamp,
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
            PokemonCollections.grimer,
            PokemonCollections.muk,
            PokemonCollections.shellder,
            PokemonCollections.cloyster,
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
            PokemonCollections.jynx,
            PokemonCollections.electabuzz,
            PokemonCollections.magmar,
            PokemonCollections.pinsir,
            PokemonCollections.tauros,
            PokemonCollections.magikarp,
            PokemonCollections.gyarados,
            PokemonCollections.lapras,
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
            PokemonCollections.dratini,
            PokemonCollections.dragonair,
            PokemonCollections.dragonite
        ]
    }
    
    static func gymLeaders() -> [Pokemon] {
        return [
            PokemonCollections.venusaur,
            PokemonCollections.rhydon,
            PokemonCollections.gyarados,
            PokemonCollections.lapras,
            PokemonCollections.vaporeon,
            PokemonCollections.golem,
            PokemonCollections.exeggutor,
            PokemonCollections.machamp,
            PokemonCollections.alakazam,
            PokemonCollections.arcanine,
            PokemonCollections.pinsir,
            PokemonCollections.jolteon,
            PokemonCollections.muk,
            PokemonCollections.kingler,
            PokemonCollections.flareon,
            PokemonCollections.snorlax,
            PokemonCollections.dragonite
        ]
    }
    
}
