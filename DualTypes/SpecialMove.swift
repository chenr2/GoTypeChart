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
    blizzard = "Blizzard",
    bodySlam = "Body Slam",
    boneClub = "Bone Club",
    brickBreak = "Brick Break",
    brine = "Brine",
    bubbleBeam = "Bubble Beam",
    bugBuzz = "Bug Buzz",
    bulldoze = "Bulldoze",
    crossChop = "Cross Chop",
    crossPoison = "Cross Poison",
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
    earthquake = "Earthquake",
    fireBlast = "Fire Blast",
    firePunch = "Fire Punch",
    flameBurst = "Flame Burst",
    flameCharge = "Flame Charge",
    flameWheel = "Flame Wheel",
    flamethrower = "Flamethrower",
    flashCannon = "Flash Cannon",
    gunkShot = "Gunk Shot",
    heatWave = "Heat Wave",
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
    megahorn = "Megahorn",
    moonblast = "Moonblast",
    mudBomb = "Mud Bomb",
    nightSlash = "Night Slash",
    ominousWind = "Ominous Wind",
    petalBlizzard = "Petal Blizzard",
    playRough = "Play Rough",
    poisonFang = "Poison Fang",
    powerGem = "Power Gem",
    powerWhip = "Power Whip",
    psybeam = "Psybeam",
    psychic = "Psychic",
    psyshock = "Psyshock",
    rockSlide = "Rock Slide",
    rockTomb = "Rock Tomb",
    scald = "Scald",
    seedBomb = "Seed Bomb",
    shadowBall = "Shadow Ball",
    signalBeam = "Signal Beam",
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
    wrap = "Wrap",
    xScissor = "X-Scissor"
    static let allValues = [
        aerialAce,
        airCutter,
        ancientPower,
        aquaJet,
        aquaTail,
        blizzard,
        bodySlam,
        boneClub,
        brickBreak,
        brine,
        bubbleBeam,
        bugBuzz,
        bulldoze,
        crossChop,
        crossPoison,
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
        earthquake,
        fireBlast,
        firePunch,
        flameBurst,
        flameCharge,
        flamethrower,
        flameWheel,
        flashCannon,
        gunkShot,
        heatWave,
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
        megahorn,
        moonblast,
        mudBomb,
        nightSlash,
        ominousWind,
        petalBlizzard,
        playRough,
        poisonFang,
        powerGem,
        powerWhip,
        psybeam,
        psychic,
        psyshock,
        rockSlide,
        rockTomb,
        scald,
        seedBomb,
        shadowBall,
        signalBeam,
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
        wrap,
        xScissor
    ]
}

struct SpecialMove {
    let element: ElementType
    let specialAttack: SpecialAttack
    let power: Int
    let duration: Int
    var dps: CGFloat {
        let time = CGFloat(duration)/1000
        return CGFloat(power) / time
    }
    let maxSpecialMove: CGFloat = 198 * 30 * 1.25 // machamp cross chop
    func specialMovePercentage(_ baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxSpecialMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    
    static func elementForSpecialAttack(_ specialAttack: SpecialAttack) -> ElementType {
        switch specialAttack {
        case .megahorn, .bugBuzz, .xScissor, .signalBeam:
            return .Bug
        case .darkPulse, .nightSlash:
            return .Dark
        case .dragonClaw, .dragonPulse, .twister:
            return .Dragon
        case .thunder, .thunderbolt, .thunderPunch, .discharge:
            return .Electric
        case .moonblast, .playRough, .dazzlingGleam, .drainingKiss, .disarmingVoice:
            return .Fairy
        case .crossChop, .brickBreak, .submission, .lowSweep:
            return .Fight
        case .fireBlast, .heatWave, .flamethrower, .firePunch, .flameBurst, .flameWheel, .flameCharge:
            return .Fire
        case .hurricane, .drillPeck, .aerialAce, .airCutter:
            return .Flying
        case .shadowBall, .ominousWind:
            return .Ghost
        case .solarBeam, .powerWhip, .leafBlade, .petalBlizzard, .seedBomb:
            return .Grass
        case .earthquake, .drillRun, .boneClub, .dig, .mudBomb, .bulldoze:
            return .Ground
        case .blizzard, .iceBeam, .icePunch, .icyWind:
            return .Ice
        case .bodySlam, .hyperBeam, .hyperFang, .stomp, .viceGrip,
             .hornAttack, .swift, .struggle, .wrap:
            return .Normal
        case .gunkShot, .sludgeBomb, .sludgeWave, .crossPoison, .sludge, .poisonFang:
            return .Poison
        case .psychic, .psyshock, .psybeam:
            return .Psychic
        case .stoneEdge, .rockSlide, .powerGem, .ancientPower, .rockTomb:
            return .Rock
        case .flashCannon, .ironHead, .magnetBomb:
            return .Steel
        case .hydroPump, .aquaTail, .scald, .aquaJet, .waterPulse, .brine, .bubbleBeam:
            return .Water
        }
    }
    
    static func moveForSpecialAttack(_ specialAttack: SpecialAttack) -> SpecialMove {
        switch specialAttack {
        case .crossChop: return SpecialMove(element: .Fight, specialAttack: specialAttack, power: 60, duration: 2_000)
        case .stoneEdge: return SpecialMove(element: .Rock, specialAttack: specialAttack, power: 80, duration: 3_100)
        case .blizzard: return SpecialMove(element: .Ice, specialAttack: specialAttack, power: 100, duration: 3_900)
        case .bodySlam: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 40, duration: 1_560)
        case .powerWhip: return SpecialMove(element: .Grass, specialAttack: specialAttack, power: 70, duration: 2_800)
        case .hurricane: return SpecialMove(element: .Flying, specialAttack: specialAttack, power: 80, duration: 3_200)
        case .megahorn: return SpecialMove(element: .Bug, specialAttack: specialAttack, power: 80, duration: 3_200)
        case .solarBeam: return SpecialMove(element: .Grass, specialAttack: specialAttack, power: 120, duration: 4_900)
        case .fireBlast: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 100, duration: 4_100)
        case .hyperBeam: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 120, duration: 5_000)
        case .earthquake: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 100, duration: 4_200)
        case .hydroPump: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 90, duration: 3_800)
        case .dragonClaw: return SpecialMove(element: .Dragon, specialAttack: specialAttack, power: 35, duration: 1_500)
        case .thunder: return SpecialMove(element: .Electric, specialAttack: specialAttack, power: 100, duration: 4_300)
        case .gunkShot: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 65, duration: 3_000)
        case .sludgeBomb: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 55, duration: 2_600)
        case .heatWave: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 80, duration: 3_800)
        case .moonblast: return SpecialMove(element: .Fairy, specialAttack: specialAttack, power: 85, duration: 4_100)
        case .sludgeWave: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 70, duration: 3_400)
        case .thunderbolt: return SpecialMove(element: .Electric, specialAttack: specialAttack, power: 55, duration: 2_700)
        case .petalBlizzard: return SpecialMove(element: .Grass, specialAttack: specialAttack, power: 65, duration: 3_200)
        case .leafBlade: return SpecialMove(element: .Grass, specialAttack: specialAttack, power: 55, duration: 2_800)
        case .psychic: return SpecialMove(element: .Psychic, specialAttack: specialAttack, power: 55, duration: 2_800)
        case .aquaTail: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 45, duration: 2_350)
        case .flamethrower: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 55, duration: 2_900)
        case .playRough: return SpecialMove(element: .Fairy, specialAttack: specialAttack, power: 55, duration: 2_900)
        case .brickBreak: return SpecialMove(element: .Fight, specialAttack: specialAttack, power: 30, duration: 1_600)
        case .dragonPulse: return SpecialMove(element: .Dragon, specialAttack: specialAttack, power: 65, duration: 3_600)
        case .iceBeam: return SpecialMove(element: .Ice, specialAttack: specialAttack, power: 65, duration: 3_650)
        case .bugBuzz: return SpecialMove(element: .Bug, specialAttack: specialAttack, power: 75, duration: 4_250)
        case .thunderPunch: return SpecialMove(element: .Electric, specialAttack: specialAttack, power: 40, duration: 2_400)
        case .seedBomb: return SpecialMove(element: .Grass, specialAttack: specialAttack, power: 40, duration: 2_400)
        case .crossPoison: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 25, duration: 1_500)
        case .xScissor: return SpecialMove(element: .Bug, specialAttack: specialAttack, power: 35, duration: 2_100)
        case .hyperFang: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 35, duration: 2_100)
        case .boneClub: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 25, duration: 1_600)
        case .rockSlide: return SpecialMove(element: .Rock, specialAttack: specialAttack, power: 50, duration: 3_200)
        case .flashCannon: return SpecialMove(element: .Steel, specialAttack: specialAttack, power: 60, duration: 3_900)
        case .ironHead: return SpecialMove(element: .Steel, specialAttack: specialAttack, power: 30, duration: 2_000)
        case .drillPeck: return SpecialMove(element: .Flying, specialAttack: specialAttack, power: 40, duration: 2_700)
        case .psyshock: return SpecialMove(element: .Psychic, specialAttack: specialAttack, power: 40, duration: 2_700)
        case .drillRun: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 50, duration: 3_400)
        case .shadowBall: return SpecialMove(element: .Ghost, specialAttack: specialAttack, power: 45, duration: 3_080)
        case .signalBeam: return SpecialMove(element: .Bug, specialAttack: specialAttack, power: 45, duration: 3_100)
        case .flameBurst: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 30, duration: 2_100)
        case .stomp: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 30, duration: 2_100)
        case .firePunch: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 40, duration: 2_800)
        case .submission: return SpecialMove(element: .Fight, specialAttack: specialAttack, power: 30, duration: 2_100)
        case .discharge: return SpecialMove(element: .Electric, specialAttack: specialAttack, power: 35, duration: 2_500)
        case .powerGem: return SpecialMove(element: .Rock, specialAttack: specialAttack, power: 40, duration: 2_900)
        case .scald: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 55, duration: 4_000)
        case .lowSweep: return SpecialMove(element: .Fight, specialAttack: specialAttack, power: 30, duration: 2_250)
        case .dazzlingGleam: return SpecialMove(element: .Fairy, specialAttack: specialAttack, power: 55, duration: 4_200)
        case .icePunch: return SpecialMove(element: .Ice, specialAttack: specialAttack, power: 45, duration: 3_500)
        case .darkPulse: return SpecialMove(element: .Dark, specialAttack: specialAttack, power: 45, duration: 3_500)
        case .dig: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 70, duration: 5_800)
        case .viceGrip: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 25, duration: 2_100)
        case .sludge: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 30, duration: 2_600)
        case .mudBomb: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 30, duration: 2_600)
        case .hornAttack: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 25, duration: 2_200)
        case .nightSlash: return SpecialMove(element: .Dark, specialAttack: specialAttack, power: 30, duration: 2_700)
        case .magnetBomb: return SpecialMove(element: .Steel, specialAttack: specialAttack, power: 30, duration: 2_800)
        case .aquaJet: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 25, duration: 2_350)
        case .waterPulse: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 35, duration: 3_300)
        case .psybeam: return SpecialMove(element: .Psychic, specialAttack: specialAttack, power: 40, duration: 3_800)
        case .poisonFang: return SpecialMove(element: .Poison, specialAttack: specialAttack, power: 25, duration: 2_400)
        case .brine: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 25, duration: 2_400)
        case .bubbleBeam: return SpecialMove(element: .Water, specialAttack: specialAttack, power: 30, duration: 2_900)
        case .aerialAce: return SpecialMove(element: .Flying, specialAttack: specialAttack, power: 30, duration: 2_900)
        case .bulldoze: return SpecialMove(element: .Ground, specialAttack: specialAttack, power: 35, duration: 3_400)
        case .swift: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 30, duration: 3_000)
        case .ancientPower: return SpecialMove(element: .Rock, specialAttack: specialAttack, power: 35, duration: 3_600)
        case .ominousWind: return SpecialMove(element: .Ghost, specialAttack: specialAttack, power: 30, duration: 3_100)
        case .twister: return SpecialMove(element: .Dragon, specialAttack: specialAttack, power: 25, duration: 2_700)
        case .airCutter: return SpecialMove(element: .Flying, specialAttack: specialAttack, power: 30, duration: 3_300)
        case .drainingKiss: return SpecialMove(element: .Fairy, specialAttack: specialAttack, power: 25, duration: 2_800)
        case .struggle: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 15, duration: 1_695)
        case .rockTomb: return SpecialMove(element: .Rock, specialAttack: specialAttack, power: 30, duration: 3_400)
        case .flameWheel: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 40, duration: 4_600)
        case .flameCharge: return SpecialMove(element: .Fire, specialAttack: specialAttack, power: 25, duration: 3_100)
        case .icyWind: return SpecialMove(element: .Ice, specialAttack: specialAttack, power: 25, duration: 3_800)
        case .disarmingVoice: return SpecialMove(element: .Fairy, specialAttack: specialAttack, power: 25, duration: 3_900)
        case .wrap: return SpecialMove(element: .Normal, specialAttack: specialAttack, power: 25, duration: 4_000)
        }
    }
}
