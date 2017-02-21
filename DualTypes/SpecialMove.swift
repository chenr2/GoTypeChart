//
//  SpecialMove.swift
//  DualTypes
//
//  Created by Robert Chen on 8/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

enum SpecialAttack: String {
    case
    aerialAce = "Aerial Ace",
    airCutter = "Air Cutter",
    ancientPower = "Ancient Power",
    aquaJet = "Aqua Jet",
    aquaTail = "Aqua Tail",
    auroraBeam = "Aurora Beam",
    avalanche = "Avalanche",
    blizzard = "Blizzard",
    bodySlam = "Body Slam",
    boneClub = "Bone Club",
    braveBird = "Brave Bird",
    brickBreak = "Brick Break",
    brine = "Brine",
    bubbleBeam = "Bubble Beam",
    bugBuzz = "Bug Buzz",
    bulldoze = "Bulldoze",
    closeCombat = "Close Combat",
    crossChop = "Cross Chop",
    crossPoison = "Cross Poison",
    crunch = "Crunch",
    darkPulse = "Dark Pulse",
    dazzlingGleam = "Dazzling Gleam",
    dig = "Dig",
    disarmingVoice = "Disarming Voice",
    discharge = "Discharge",
    dragonClaw = "Dragon Claw",
    dragonPulse = "Dragon Pulse",
    drainingKiss = "Draining Kiss",
    drillPeck = "Drill Peck",
    drillRun = "Drill Run",
    dynamicPunch = "Dynamic Punch",
    earthquake = "Earthquake",
    energyBall = "Energy Ball",
    fireBlast = "Fire Blast",
    firePunch = "Fire Punch",
    flameBurst = "Flame Burst",
    flameCharge = "Flame Charge",
    flamethrower = "Flamethrower",
    flameWheel = "Flame Wheel",
    flashCannon = "Flash Cannon",
    focusBlast = "Focus Blast",
    foulPlay = "Foul Play",
    futuresight = "Futuresight",
    grassKnot = "Grass Knot",
    gunkShot = "Gunk Shot",
    gyroBall = "Gyro Ball",
    heartStamp = "Heart Stamp",
    heatWave = "Heat Wave",
    heavySlam = "Heavy Slam",
    hornAttack = "Horn Attack",
    hurricane = "Hurricane",
    hydroPump = "Hydro Pump",
    hyperBeam = "Hyper Beam",
    hyperFang = "Hyper Fang",
    iceBeam = "Ice Beam",
    icePunch = "Ice Punch",
    icyWind = "Icy Wind",
    ironHead = "Iron Head",
    leafBlade = "Leaf Blade",
    lowSweep = "Low Sweep",
    magnetBomb = "Magnet Bomb",
    megaDrain = "Mega Drain",
    megahorn = "Megahorn",
    mirrorCoat = "Mirror Coat",
    moonblast = "Moonblast",
    mudBomb = "Mud Bomb",
    nightShade = "Night Shade",
    nightSlash = "Night Slash",
    ominousWind = "Ominous Wind",
    outrage = "Outrage",
    overheat = "Overheat",
    parabolicCharge = "Parabolic Charge",
    petalBlizzard = "Petal Blizzard",
    playRough = "Play Rough",
    poisonFang = "Poison Fang",
    powerGem = "Power Gem",
    powerWhip = "Power Whip",
    psybeam = "Psybeam",
    psychic = "Psychic",
    psyshock = "Psyshock",
    psystrike = "Psystrike",
    rest = "Rest",
    rockBlast = "Rock Blast",
    rockSlide = "Rock Slide",
    rockTomb = "Rock Tomb",
    sandTomb = "Sand Tomb",
    scald = "Scald",
    seedBomb = "Seed Bomb",
    shadowBall = "Shadow Ball",
    shadowPunch = "Shadow Punch",
    shadowSneak = "Shadow Sneak",
    signalBeam = "Signal Beam",
    silverWind = "Silver Wind",
    skyAttack = "Sky Attack",
    sludge = "Sludge",
    sludgeBomb = "Sludge Bomb",
    sludgeWave = "Sludge Wave",
    solarBeam = "Solar Beam",
    stomp = "Stomp",
    stoneEdge = "Stone Edge",
    struggle = "Struggle",
    submission = "Submission",
    swift = "Swift",
    thunder = "Thunder",
    thunderbolt = "Thunderbolt",
    thunderPunch = "Thunder Punch",
    twister = "Twister",
    viceGrip = "Vice Grip",
    waterPulse = "Water Pulse",
    wildCharge = "Wild Charge",
    wrap = "Wrap",
    wrapGreen = "Wrap Green",
    wrapPink = "Wrap Pink",
    xScissor = "X-Scissor",
    zapCannon = "Zap Cannon"
    
    static let allValues = [
        airCutter,
        ancientPower,
        aquaJet,
        aquaTail,
        auroraBeam,
        avalanche,
        blizzard,
        bodySlam,
        boneClub,
        braveBird,
        brickBreak,
        brine,
        bubbleBeam,
        bugBuzz,
        bulldoze,
        closeCombat,
        crossChop,
        crossPoison,
        crunch,
        darkPulse,
        dazzlingGleam,
        dig,
        disarmingVoice,
        discharge,
        dragonClaw,
        dragonPulse,
        drainingKiss,
        drillPeck,
        drillRun,
        dynamicPunch,
        earthquake,
        energyBall,
        fireBlast,
        firePunch,
        flameBurst,
        flameCharge,
        flamethrower,
        flameWheel,
        flashCannon,
        focusBlast,
        foulPlay,
        futuresight,
        grassKnot,
        gunkShot,
        gyroBall,
        heartStamp,
        heatWave,
        heavySlam,
        hornAttack,
        hurricane,
        hydroPump,
        hyperBeam,
        hyperFang,
        iceBeam,
        icePunch,
        icyWind,
        ironHead,
        leafBlade,
        lowSweep,
        magnetBomb,
        megaDrain,
        megahorn,
        mirrorCoat,
        moonblast,
        mudBomb,
        nightShade,
        nightSlash,
        ominousWind,
        outrage,
        overheat,
        parabolicCharge,
        petalBlizzard,
        playRough,
        poisonFang,
        powerGem,
        powerWhip,
        psybeam,
        psychic,
        psyshock,
        psystrike,
        rest,
        rockBlast,
        rockSlide,
        rockTomb,
        sandTomb,
        scald,
        seedBomb,
        shadowBall,
        shadowPunch,
        shadowSneak,
        signalBeam,
        silverWind,
        skyAttack,
        sludge,
        sludgeBomb,
        sludgeWave,
        solarBeam,
        stomp,
        stoneEdge,
        struggle,
        submission,
        swift,
        thunder,
        thunderbolt,
        thunderPunch,
        twister,
        viceGrip,
        waterPulse,
        wildCharge,
        wrap,
        wrapGreen,
        wrapPink,
        xScissor,
        zapCannon
    ]
}

struct SpecialMove {
    let element: ElementType
    let specialAttack: SpecialAttack
    let power: Int
    let bar: Int
    let duration: Int  // TODO
    var simpleDPS: CGFloat {
        return CGFloat(power) * CGFloat(bar) * 0.07
    }
    static func cmDPSBasedOnQm(cmPower: Int, bar: Int, duration: Int, quickmoveEPS eps: CGFloat) -> CGFloat {
        /*
         *                 damage for a full bar
         *    ----------------------------------------------------------------
         *    time for charging full bar   +   cast duration over the full bar
         */
        let damageForFullBar: CGFloat = CGFloat(cmPower) * CGFloat(bar)
        /*
         *         100 energy
         *   -----------------------  =  14.3 seconds
         *     7 energy / second
         */
        let timeForChargingFullBar: CGFloat = 100 / eps
        // 3 bars * 2_000 ms = 6_000ms
        let castDurationForFullBar: CGFloat = CGFloat(bar) * CGFloat(duration) / 1000
        let cmDPS = damageForFullBar / (timeForChargingFullBar + castDurationForFullBar)
        return cmDPS
    }
    let maxSpecialMove: CGFloat = 3190 // machamp
    func specialMovePercentage(_ baseAttack: CGFloat, stab: Bool, dps: CGFloat) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxSpecialMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    
    static func elementForSpecialAttack(_ specialAttack: SpecialAttack) -> ElementType {
        switch specialAttack {
            
        case .bugBuzz,
             .megahorn,
             .signalBeam,
             .silverWind,
             .xScissor:
            return .Bug
        case .crunch,
             .darkPulse,
             .foulPlay,
             .nightSlash:
            return .Dark
        case .dragonClaw, .dragonPulse, .outrage, .twister:
            return .Dragon
        case .thunder, .thunderbolt, .thunderPunch, .discharge,
             .parabolicCharge,
             .wildCharge,
             .zapCannon:
            return .Electric
        case .moonblast, .playRough, .dazzlingGleam, .drainingKiss, .disarmingVoice:
            return .Fairy
        case .crossChop, .brickBreak, .submission, .lowSweep,
             .closeCombat, .dynamicPunch, .focusBlast:
            return .Fight
        case .fireBlast,
             .heatWave,
             .flamethrower,
             .firePunch,
             .flameBurst,
             .flameWheel,
             .flameCharge,
             .overheat:
            return .Fire
        case .hurricane, .drillPeck, .aerialAce, .airCutter,
             .braveBird,
             .skyAttack:
            return .Flying
        case .shadowBall, .ominousWind,
             .nightShade,
             .shadowPunch,
             .shadowSneak:
            return .Ghost
        case .solarBeam, .powerWhip, .leafBlade, .petalBlizzard, .seedBomb,
             .energyBall,
             .grassKnot,
             .megaDrain:
            return .Grass
        case .earthquake, .drillRun, .boneClub, .dig, .mudBomb, .bulldoze,
             .sandTomb:
            return .Ground
        case .blizzard, .iceBeam, .icePunch, .icyWind,
             .auroraBeam,
             .avalanche:
            return .Ice
        case .bodySlam, .hyperBeam, .hyperFang, .stomp, .viceGrip,
             .hornAttack, .swift, .struggle, .wrap,
             .rest,
             .wrapGreen,
             .wrapPink:
            return .Normal
        case .gunkShot, .sludgeBomb, .sludgeWave, .crossPoison, .sludge, .poisonFang:
            return .Poison
        case .psychic, .psyshock, .psybeam,
             .futuresight,
             .heartStamp,
             .mirrorCoat,
             .psystrike:
            return .Psychic
        case .stoneEdge, .rockSlide, .powerGem, .ancientPower, .rockTomb,
             .rockBlast:
            return .Rock
        case .flashCannon, .ironHead, .magnetBomb,
             .gyroBall,
             .heavySlam:
            return .Steel
        case .hydroPump, .aquaTail, .scald, .aquaJet, .waterPulse, .brine, .bubbleBeam:
            return .Water
        }
    }
    
    static func moveForSpecialAttack(_ specialAttack: SpecialAttack) -> SpecialMove {
        switch specialAttack {
        case .aerialAce: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:55, bar: 3, duration: 2400)
        case .airCutter: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:60, bar: 2, duration: 2700)
        case .ancientPower: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:70, bar: 3, duration: 3500)
        case .aquaJet: return SpecialMove(element: .Water , specialAttack: specialAttack, power:45, bar: 3, duration: 2600)
        case .aquaTail: return SpecialMove(element: .Water , specialAttack: specialAttack, power:50, bar: 3, duration: 1900)
        case .auroraBeam: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:80, bar: 2, duration: 3550)
        case .avalanche: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:90, bar: 2, duration: 2700)
        case .blizzard: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:130, bar: 1, duration: 3100)
        case .bodySlam: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:50, bar: 3, duration: 1900)
        case .boneClub: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:40, bar: 3, duration: 1600)
        case .braveBird: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:90, bar: 1, duration: 2000)
        case .brickBreak: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:40, bar: 3, duration: 1600)
        case .brine: return SpecialMove(element: .Water , specialAttack: specialAttack, power:60, bar: 2, duration: 2300)
        case .bubbleBeam: return SpecialMove(element: .Water , specialAttack: specialAttack, power:45, bar: 3, duration: 1900)
        case .bugBuzz: return SpecialMove(element: .Bug , specialAttack: specialAttack, power:90, bar: 2, duration: 3700)
        case .bulldoze: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:80, bar: 2, duration: 3500)
        case .closeCombat: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:100, bar: 1, duration: 2300)
        case .crossChop: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:50, bar: 2, duration: 1500)
        case .crossPoison: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:40, bar: 3, duration: 1500)
        case .crunch: return SpecialMove(element: .Dark , specialAttack: specialAttack, power:70, bar: 3, duration: 3200)
        case .darkPulse: return SpecialMove(element: .Dark , specialAttack: specialAttack, power:80, bar: 2, duration: 3000)
        case .dazzlingGleam: return SpecialMove(element: .Fairy , specialAttack: specialAttack, power:100, bar: 2, duration: 3500)
        case .dig: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:100, bar: 2, duration: 4700)
        case .disarmingVoice: return SpecialMove(element: .Fairy , specialAttack: specialAttack, power:70, bar: 3, duration: 3900)
        case .discharge: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:65, bar: 3, duration: 2500)
        case .dragonClaw: return SpecialMove(element: .Dragon , specialAttack: specialAttack, power:50, bar: 3, duration: 1700)
        case .dragonPulse: return SpecialMove(element: .Dragon , specialAttack: specialAttack, power:90, bar: 2, duration: 3600)
        case .drainingKiss: return SpecialMove(element: .Fairy , specialAttack: specialAttack, power:60, bar: 2, duration: 2600)
        case .drillPeck: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:60, bar: 3, duration: 2300)
        case .drillRun: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:80, bar: 2, duration: 2800)
        case .dynamicPunch: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:90, bar: 2, duration: 2700)
        case .earthquake: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:120, bar: 1, duration: 3600)
        case .energyBall: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:90, bar: 2, duration: 3900)
        case .fireBlast: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:140, bar: 1, duration: 4200)
        case .firePunch: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:55, bar: 3, duration: 2200)
        case .flameBurst: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:70, bar: 2, duration: 2600)
        case .flameCharge: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:70, bar: 3, duration: 3800)
        case .flamethrower: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:70, bar: 2, duration: 2700)
        case .flameWheel: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:60, bar: 2, duration: 2200)
        case .flashCannon: return SpecialMove(element: .Steel , specialAttack: specialAttack, power:100, bar: 1, duration: 2700)
        case .focusBlast: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:140, bar: 1, duration: 3500)
        case .foulPlay: return SpecialMove(element: .Dark , specialAttack: specialAttack, power:70, bar: 2, duration: 2000)
        case .futuresight: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:120, bar: 1, duration: 2700)
        case .grassKnot: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:90, bar: 2, duration: 2600)
        case .gunkShot: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:130, bar: 1, duration: 3100)
        case .gyroBall: return SpecialMove(element: .Steel , specialAttack: specialAttack, power:80, bar: 2, duration: 3300)
        case .heartStamp: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:40, bar: 3, duration: 1900)
        case .heatWave: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:95, bar: 1, duration: 3000)
        case .heavySlam: return SpecialMove(element: .Steel , specialAttack: specialAttack, power:70, bar: 2, duration: 2100)
        case .hornAttack: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:40, bar: 3, duration: 1850)
        case .hurricane: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:110, bar: 1, duration: 2700)
        case .hydroPump: return SpecialMove(element: .Water , specialAttack: specialAttack, power:130, bar: 1, duration: 3300)
        case .hyperBeam: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:150, bar: 1, duration: 3800)
        case .hyperFang: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:80, bar: 2, duration: 2500)
        case .iceBeam: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:90, bar: 1, duration: 3300)
        case .icePunch: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:50, bar: 3, duration: 1900)
        case .icyWind: return SpecialMove(element: .Ice , specialAttack: specialAttack, power:60, bar: 3, duration: 3300)
        case .ironHead: return SpecialMove(element: .Steel , specialAttack: specialAttack, power:60, bar: 2, duration: 1900)
        case .leafBlade: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:70, bar: 3, duration: 2400)
        case .lowSweep: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:40, bar: 3, duration: 1900)
        case .magnetBomb: return SpecialMove(element: .Steel , specialAttack: specialAttack, power:70, bar: 3, duration: 2800)
        case .megaDrain: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:25, bar: 2, duration: 2600)
        case .megahorn: return SpecialMove(element: .Bug , specialAttack: specialAttack, power:90, bar: 1, duration: 2200)
        case .mirrorCoat: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:60, bar: 2, duration: 2600)
        case .moonblast: return SpecialMove(element: .Fairy , specialAttack: specialAttack, power:130, bar: 1, duration: 3900)
        case .mudBomb: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:55, bar: 3, duration: 2300)
        case .nightShade: return SpecialMove(element: .Ghost , specialAttack: specialAttack, power:60, bar: 2, duration: 2600)
        case .nightSlash: return SpecialMove(element: .Dark , specialAttack: specialAttack, power:50, bar: 3, duration: 2200)
        case .ominousWind: return SpecialMove(element: .Ghost , specialAttack: specialAttack, power:50, bar: 3, duration: 2300)
        case .outrage: return SpecialMove(element: .Dragon , specialAttack: specialAttack, power:110, bar: 2, duration: 3900)
        case .overheat: return SpecialMove(element: .Fire , specialAttack: specialAttack, power:160, bar: 1, duration: 4000)
        case .parabolicCharge: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:25, bar: 2, duration: 2800)
        case .petalBlizzard: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:110, bar: 1, duration: 2600)
        case .playRough: return SpecialMove(element: .Fairy , specialAttack: specialAttack, power:90, bar: 2, duration: 2900)
        case .poisonFang: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:35, bar: 3, duration: 1700)
        case .powerGem: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:80, bar: 2, duration: 2900)
        case .powerWhip: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:90, bar: 2, duration: 2600)
        case .psybeam: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:70, bar: 2, duration: 3200)
        case .psychic: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:100, bar: 1, duration: 2800)
        case .psyshock: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:65, bar: 3, duration: 2700)
        case .psystrike: return SpecialMove(element: .Psychic , specialAttack: specialAttack, power:100, bar: 2, duration: 4400)
        case .rest: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:50, bar: 3, duration: 1900)
        case .rockBlast: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:50, bar: 3, duration: 2100)
        case .rockSlide: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:80, bar: 2, duration: 2700)
        case .rockTomb: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:70, bar: 2, duration: 3200)
        case .sandTomb: return SpecialMove(element: .Ground , specialAttack: specialAttack, power:80, bar: 2, duration: 4000)
        case .scald: return SpecialMove(element: .Water , specialAttack: specialAttack, power:80, bar: 2, duration: 3700)
        case .seedBomb: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:55, bar: 3, duration: 2100)
        case .shadowBall: return SpecialMove(element: .Ghost , specialAttack: specialAttack, power:100, bar: 2, duration: 3000)
        case .shadowPunch: return SpecialMove(element: .Ghost , specialAttack: specialAttack, power:40, bar: 3, duration: 1700)
        case .shadowSneak: return SpecialMove(element: .Ghost , specialAttack: specialAttack, power:50, bar: 3, duration: 2900)
        case .signalBeam: return SpecialMove(element: .Bug , specialAttack: specialAttack, power:75, bar: 2, duration: 2900)
        case .silverWind: return SpecialMove(element: .Bug , specialAttack: specialAttack, power:70, bar: 3, duration: 3700)
        case .skyAttack: return SpecialMove(element: .Flying , specialAttack: specialAttack, power:70, bar: 2, duration: 2000)
        case .sludge: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:50, bar: 3, duration: 2100)
        case .sludgeBomb: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:80, bar: 2, duration: 2300)
        case .sludgeWave: return SpecialMove(element: .Poison , specialAttack: specialAttack, power:110, bar: 1, duration: 3200)
        case .solarBeam: return SpecialMove(element: .Grass , specialAttack: specialAttack, power:180, bar: 1, duration: 4900)
        case .stomp: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:55, bar: 2, duration: 1700)
        case .stoneEdge: return SpecialMove(element: .Rock , specialAttack: specialAttack, power:100, bar: 1, duration: 2300)
        case .struggle: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:35, bar: 3, duration: 2200)
        case .submission: return SpecialMove(element: .Fight , specialAttack: specialAttack, power:60, bar: 2, duration: 2200)
        case .swift: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:60, bar: 2, duration: 2800)
        case .thunder: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:100, bar: 1, duration: 2400)
        case .thunderbolt: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:80, bar: 2, duration: 1800)
        case .thunderPunch: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:45, bar: 2, duration: 2500)
        case .twister: return SpecialMove(element: .Dragon , specialAttack: specialAttack, power:45, bar: 3, duration: 2800)
        case .viceGrip: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:35, bar: 3, duration: 1900)
        case .waterPulse: return SpecialMove(element: .Water , specialAttack: specialAttack, power:70, bar: 2, duration: 3200)
        case .wildCharge: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:90, bar: 2, duration: 2600)
        case .wrap: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:60, bar: 3, duration: 2900)
        case .wrapGreen: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:25, bar: 3, duration: 2900)
        case .wrapPink: return SpecialMove(element: .Normal , specialAttack: specialAttack, power:25, bar: 3, duration: 2900)
        case .xScissor: return SpecialMove(element: .Bug , specialAttack: specialAttack, power:45, bar: 3, duration: 1600)
        case .zapCannon: return SpecialMove(element: .Electric , specialAttack: specialAttack, power:140, bar: 1, duration: 3700)
        }
    }
}
