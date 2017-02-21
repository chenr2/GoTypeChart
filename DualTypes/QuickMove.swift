//
//  QuickMove.swift
//  DualTypes
//
//  Created by Robert Chen on 8/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

enum QuickAttack: String {
    case
    acid = "Acid",
    bite = "Bite",
    bubble = "Bubble",
    bugBite = "Bug Bite",
    bulletPunch = "Bullet Punch",
    confusion = "Confusion",
    cut = "Cut",
    dragonBreath = "Dragon Breath",
    ember = "Ember",
    feintAttack = "Feint Attack",
    fireFang = "Fire Fang",
    frostBreath = "Frost Breath",
    furyCutter = "Fury Cutter",
    iceShard = "Ice Shard",
    karateChop = "Karate Chop",
    lick = "Lick",
    lowKick = "Low Kick",
    metalClaw = "Metal Claw",
    mudShot = "Mud Shot",
    mudSlap = "Mud Slap",
    peck = "Peck",
    poisonJab = "Poison Jab",
    poisonSting = "Poison Sting",
    pound = "Pound",
    psychoCut = "Psycho Cut",
    quickAttack = "Quick Attack",
    razorLeaf = "Razor Leaf",
    rockSmash = "Rock Smash",
    rockThrow = "Rock Throw",
    scratch = "Scratch",
    shadowClaw = "Shadow Claw",
    spark = "Spark",
    splash = "Splash",
    steelWing = "Steel Wing",
    suckerPunch = "Sucker Punch",
    tackle = "Tackle",
    thunderShock = "Thunder Shock",
    vineWhip = "Vine Whip",
    waterGun = "Water Gun",
    wingAttack = "Wing Attack",
    zenHeadbutt = "Zen Headbutt",
    
    airSlash = "Air Slash",
    astonish = "Astonish",
    bulletSeed = "Bullet Seed",
    chargeBeam = "Charge Beam",
    counter = "Counter",
    dragonTail = "Dragon Tail",
    extrasensory = "Extrasensory",
    fireSpin = "Fire Spin",
    hex = "Hex",
    hiddenPower = "Hidden Power",
    infestation = "infestation",
    ironTail = "Iron Tail",
    powderSnow = "Powder Snow",
    snarl = "Snarl",
    struggleBug = "Struggle Bug",
    transform = "Transform",
    voltSwitch = "Volt Switch"
    
    static let allValues = [
        acid,
        bite,
        bubble,
        bugBite,
        bulletPunch,
        confusion,
        cut,
        dragonBreath,
        ember,
        feintAttack,
        fireFang,
        frostBreath,
        furyCutter,
        iceShard,
        karateChop,
        lick,
        lowKick,
        metalClaw,
        mudShot,
        mudSlap,
        peck,
        poisonJab,
        poisonSting,
        pound,
        psychoCut,
        quickAttack,
        razorLeaf,
        rockSmash,
        rockThrow,
        scratch,
        shadowClaw,
        spark,
        splash,
        steelWing,
        suckerPunch,
        tackle,
        thunderShock,
        vineWhip,
        waterGun,
        wingAttack,
        zenHeadbutt,
        
        airSlash,
        astonish,
        bulletSeed,
        chargeBeam,
        counter,
        dragonTail,
        extrasensory,
        fireSpin,
        hex,
        hiddenPower,
        infestation,
        ironTail,
        powderSnow,
        snarl,
        struggleBug,
        transform,
        voltSwitch
    ]
}

struct QuickMove {
    let element: ElementType
    let quickAttack: QuickAttack
    let power: Int
    let duration: Int
    let eps: CGFloat
    var dps: CGFloat {
        let time = CGFloat(duration)/1000
        return CGFloat(power) / time
    }
    let maxQuickMove: CGFloat = 263 * 12 * 1.25 // dragonite legacy dragon breath
    func quickMovePercentage(_ baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxQuickMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    static func moveForQuickAttack(_ quickAttack: QuickAttack) -> QuickMove {
        switch quickAttack {
        case .acid: return QuickMove(element: .Poison, quickAttack: quickAttack, power:10, duration:1300, eps: 6.92)
        case .airSlash: return QuickMove(element: .Flying, quickAttack: quickAttack, power:12, duration:1200, eps: 8.33)
        case .astonish: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:8, duration:1050, eps: 11.43)
        case .bite: return QuickMove(element: .Dark, quickAttack: quickAttack, power:10, duration:1000, eps: 6)
        case .bubble: return QuickMove(element: .Water, quickAttack: quickAttack, power:15, duration:1700, eps: 7.06)
        case .bugBite: return QuickMove(element: .Bug, quickAttack: quickAttack, power:5, duration:950, eps: 6.32)
        case .bulletPunch: return QuickMove(element: .Steel, quickAttack: quickAttack, power:12, duration:1400, eps: 7.14)
        case .bulletSeed: return QuickMove(element: .Grass, quickAttack: quickAttack, power:8, duration:1550, eps: 7.74)
        case .chargeBeam: return QuickMove(element: .Electric, quickAttack: quickAttack, power:8, duration:1550, eps: 9.68)
        case .confusion: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:20, duration:2100, eps: 4.76)
        case .counter: return QuickMove(element: .Fight, quickAttack: quickAttack, power:10, duration:900, eps: 8.89)
        case .cut: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1000, eps: 5)
        case .dragonBreath: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:12, duration:1000, eps: 5)
        case .dragonTail: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:15, duration:1550, eps: 3.87)
        case .ember: return QuickMove(element: .Fire, quickAttack: quickAttack, power:10, duration:1500, eps: 6.67)
        case .extrasensory: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1550, eps: 7.74)
        case .feintAttack: return QuickMove(element: .Dark, quickAttack: quickAttack, power:12, duration:1400, eps: 7.14)
        case .fireFang: return QuickMove(element: .Fire, quickAttack: quickAttack, power:12, duration:1340, eps: 7.46)
        case .fireSpin: return QuickMove(element: .Fire, quickAttack: quickAttack, power:15, duration:1550, eps: 6.45)
        case .frostBreath: return QuickMove(element: .Ice, quickAttack: quickAttack, power:10, duration:1400, eps: 5)
        case .furyCutter: return QuickMove(element: .Bug, quickAttack: quickAttack, power:3, duration:900, eps: 6.67)
        case .hex: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:10, duration:1200, eps: 12.5)
        case .hiddenPower: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1500, eps: 10)
        case .iceShard: return QuickMove(element: .Ice, quickAttack: quickAttack, power:12, duration:1700, eps: 7.06)
        case .infestation: return QuickMove(element: .Bug, quickAttack: quickAttack, power:10, duration:1550, eps: 9.03)
        case .ironTail: return QuickMove(element: .Steel, quickAttack: quickAttack, power:15, duration:1550, eps: 3.87)
        case .karateChop: return QuickMove(element: .Fight, quickAttack: quickAttack, power:8, duration:1300, eps: 7.69)
        case .lick: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:5, duration:1000, eps: 6)
        case .lowKick: return QuickMove(element: .Fight, quickAttack: quickAttack, power:6, duration:1100, eps: 7.27)
        case .metalClaw: return QuickMove(element: .Steel, quickAttack: quickAttack, power:8, duration:1130, eps: 6.19)
        case .mudShot: return QuickMove(element: .Ground, quickAttack: quickAttack, power:9, duration:1050, eps: 6.67)
        case .mudSlap: return QuickMove(element: .Ground, quickAttack: quickAttack, power:15, duration:1850, eps: 6.49)
        case .peck: return QuickMove(element: .Flying, quickAttack: quickAttack, power:10, duration:1500, eps: 6.67)
        case .poisonJab: return QuickMove(element: .Poison, quickAttack: quickAttack, power:12, duration:1300, eps: 6.15)
        case .poisonSting: return QuickMove(element: .Poison, quickAttack: quickAttack, power:6, duration:1075, eps: 7.44)
        case .pound: return QuickMove(element: .Normal, quickAttack: quickAttack, power:8, duration:1040, eps: 6.73)
        case .powderSnow: return QuickMove(element: .Ice, quickAttack: quickAttack, power:6, duration:1000, eps: 15)
        case .psychoCut: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:8, duration:1070, eps: 7.48)
        case .quickAttack: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1250, eps: 6.4)
        case .razorLeaf: return QuickMove(element: .Grass, quickAttack: quickAttack, power:15, duration:1500, eps: 5.33)
        case .rockSmash: return QuickMove(element: .Fight, quickAttack: quickAttack, power:15, duration:1700, eps: 5.88)
        case .rockThrow: return QuickMove(element: .Rock, quickAttack: quickAttack, power:12, duration:1400, eps: 7.14)
        case .scratch: return QuickMove(element: .Normal, quickAttack: quickAttack, power:12, duration:1000, eps: 7)
        case .shadowClaw: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:12, duration:1200, eps: 5)
        case .snarl: return QuickMove(element: .Dark, quickAttack: quickAttack, power:12, duration:1550, eps: 7.74)
        case .spark: return QuickMove(element: .Electric, quickAttack: quickAttack, power:7, duration:1200, eps: 6.67)
        case .splash: return QuickMove(element: .Water, quickAttack: quickAttack, power:0, duration:1730, eps: 0)
        case .steelWing: return QuickMove(element: .Steel, quickAttack: quickAttack, power:12, duration:1300, eps: 6.15)
        case .struggleBug: return QuickMove(element: .Bug, quickAttack: quickAttack, power:6, duration:1500, eps: 8)
        case .suckerPunch: return QuickMove(element: .Dark, quickAttack: quickAttack, power:8, duration:1200, eps: 7.5)
        case .tackle: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1000, eps: 5)
        case .thunderShock: return QuickMove(element: .Electric, quickAttack: quickAttack, power:6, duration:1100, eps: 8.18)
        case .transform: return QuickMove(element: .Normal, quickAttack: quickAttack, power:0, duration:2230, eps: 0)
        case .vineWhip: return QuickMove(element: .Grass, quickAttack: quickAttack, power:8, duration:1100, eps: 6.36)
        case .voltSwitch: return QuickMove(element: .Electric, quickAttack: quickAttack, power:12, duration:2300, eps: 8.7)
        case .waterGun: return QuickMove(element: .Water, quickAttack: quickAttack, power:10, duration:1000, eps: 6)
        case .wingAttack: return QuickMove(element: .Flying, quickAttack: quickAttack, power:10, duration:1250, eps: 8)
        case .zenHeadbutt: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1550, eps: 6.45)
        }
    }
}
