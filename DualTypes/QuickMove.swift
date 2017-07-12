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
    
    static func qmDoTBasedOnCm(qmDPS: CGFloat, bar: Int, cmDuration: Int, quickmoveEPS eps: CGFloat) -> CGFloat {
        /*
         *         100 energy
         *   -----------------------  =  14.3 seconds
         *     7 energy / second
         */
        let timeForChargingFullBar: CGFloat = 100 / eps

        /*
         *                 qm damage for a full bar
         *    ----------------------------------------------------------------
         *    time for charging full bar   +   cast duration over the full bar
         */
        let damageForFullBar: CGFloat = qmDPS * timeForChargingFullBar
        
        // 3 bars * 2_000 ms = 6_000ms
        let castDurationForFullBar: CGFloat = CGFloat(bar) * CGFloat(cmDuration) / 1000
        let qmDoT = damageForFullBar / (timeForChargingFullBar + castDurationForFullBar)
        return qmDoT
    }
    
    let maxQuickMove: CGFloat = 263 * 13.6 * 1.2 // dragonite dragon tail
    func quickMovePercentage(_ baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.2 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxQuickMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    static func moveForQuickAttack(_ quickAttack: QuickAttack) -> QuickMove {
        switch quickAttack {
        case .acid: return QuickMove(element: .Poison, quickAttack: quickAttack, power:9, duration:800, eps: 10.00)
        case .airSlash: return QuickMove(element: .Flying, quickAttack: quickAttack, power:14, duration:1200, eps: 8.33)
        case .astonish: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:8, duration:1100, eps: 12.73)
        case .bite: return QuickMove(element: .Dark, quickAttack: quickAttack, power:6, duration:500, eps: 8.00)
        case .bubble: return QuickMove(element: .Water, quickAttack: quickAttack, power:12, duration:1200, eps: 11.67)
        case .bugBite: return QuickMove(element: .Bug, quickAttack: quickAttack, power:5, duration:500, eps: 12.00)
        case .bulletPunch: return QuickMove(element: .Steel, quickAttack: quickAttack, power:9, duration:900, eps: 11.11)
        case .bulletSeed: return QuickMove(element: .Grass, quickAttack: quickAttack, power:8, duration:1100, eps: 12.73)
        case .chargeBeam: return QuickMove(element: .Electric, quickAttack: quickAttack, power:8, duration:1100, eps: 13.64)
        case .confusion: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:20, duration:1600, eps: 9.38)
        case .counter: return QuickMove(element: .Fight, quickAttack: quickAttack, power:5, duration:500, eps: 10.00)
        case .cut: return QuickMove(element: .Normal, quickAttack: quickAttack, power:12, duration:900, eps: 8.89)
        case .dragonBreath: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:6, duration:500, eps: 8.00)
        case .dragonTail: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:15, duration:1100, eps: 8.18)
        case .ember: return QuickMove(element: .Fire, quickAttack: quickAttack, power:10, duration:1000, eps: 10.00)
        case .extrasensory: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1100, eps: 10.91)
        case .feintAttack: return QuickMove(element: .Dark, quickAttack: quickAttack, power:10, duration:900, eps: 10.00)
        case .fireFang: return QuickMove(element: .Fire, quickAttack: quickAttack, power:11, duration:900, eps: 8.89)
        case .fireSpin: return QuickMove(element: .Fire, quickAttack: quickAttack, power:14, duration:1100, eps: 9.09)
        case .frostBreath: return QuickMove(element: .Ice, quickAttack: quickAttack, power:10, duration:900, eps: 8.89)
        case .furyCutter: return QuickMove(element: .Bug, quickAttack: quickAttack, power:3, duration:400, eps: 15.00)
        case .hex: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:10, duration:1200, eps: 12.50)
        case .hiddenPower: return QuickMove(element: .Normal, quickAttack: quickAttack, power:15, duration:1500, eps: 10.00)
        case .iceShard: return QuickMove(element: .Ice, quickAttack: quickAttack, power:12, duration:1200, eps: 10.00)
        case .infestation: return QuickMove(element: .Bug, quickAttack: quickAttack, power:10, duration:1100, eps: 12.73)
        case .ironTail: return QuickMove(element: .Steel, quickAttack: quickAttack, power:15, duration:1100, eps: 6.36)
        case .karateChop: return QuickMove(element: .Fight, quickAttack: quickAttack, power:8, duration:800, eps: 12.50)
        case .lick: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:5, duration:500, eps: 12.00)
        case .lowKick: return QuickMove(element: .Fight, quickAttack: quickAttack, power:6, duration:600, eps: 10.00)
        case .metalClaw: return QuickMove(element: .Steel, quickAttack: quickAttack, power:8, duration:700, eps: 10.00)
        case .mudShot: return QuickMove(element: .Ground, quickAttack: quickAttack, power:5, duration:600, eps: 11.67)
        case .mudSlap: return QuickMove(element: .Ground, quickAttack: quickAttack, power:15, duration:1400, eps: 8.57)
        case .peck: return QuickMove(element: .Flying, quickAttack: quickAttack, power:10, duration:1000, eps: 10.00)
        case .poisonJab: return QuickMove(element: .Poison, quickAttack: quickAttack, power:10, duration:800, eps: 8.75)
        case .poisonSting: return QuickMove(element: .Poison, quickAttack: quickAttack, power:5, duration:600, eps: 11.67)
        case .pound: return QuickMove(element: .Normal, quickAttack: quickAttack, power:7, duration:600, eps: 10.00)
        case .powderSnow: return QuickMove(element: .Ice, quickAttack: quickAttack, power:6, duration:1000, eps: 15.00)
        case .psychoCut: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:5, duration:600, eps: 13.33)
        case .quickAttack: return QuickMove(element: .Normal, quickAttack: quickAttack, power:8, duration:800, eps: 12.50)
        case .razorLeaf: return QuickMove(element: .Grass, quickAttack: quickAttack, power:13, duration:1000, eps: 7.00)
        case .rockSmash: return QuickMove(element: .Fight, quickAttack: quickAttack, power:15, duration:1300, eps: 7.69)
        case .rockThrow: return QuickMove(element: .Rock, quickAttack: quickAttack, power:12, duration:900, eps: 7.78)
        case .scratch: return QuickMove(element: .Normal, quickAttack: quickAttack, power:6, duration:500, eps: 8.00)
        case .shadowClaw: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:9, duration:700, eps: 8.57)
        case .snarl: return QuickMove(element: .Dark, quickAttack: quickAttack, power:12, duration:1100, eps: 10.91)
        case .spark: return QuickMove(element: .Electric, quickAttack: quickAttack, power:6, duration:700, eps: 12.86)
        case .splash: return QuickMove(element: .Water, quickAttack: quickAttack, power:0, duration:1730, eps: 11.56)
        case .steelWing: return QuickMove(element: .Steel, quickAttack: quickAttack, power:11, duration:800, eps: 7.50)
        case .struggleBug: return QuickMove(element: .Bug, quickAttack: quickAttack, power:15, duration:1500, eps: 10.00)
        case .suckerPunch: return QuickMove(element: .Dark, quickAttack: quickAttack, power:7, duration:700, eps: 11.43)
        case .tackle: return QuickMove(element: .Normal, quickAttack: quickAttack, power:5, duration:500, eps: 10.00)
        case .thunderShock: return QuickMove(element: .Electric, quickAttack: quickAttack, power:5, duration:600, eps: 13.33)
        case .transform: return QuickMove(element: .Normal, quickAttack: quickAttack, power:0, duration:2230, eps: 0.00)
        case .vineWhip: return QuickMove(element: .Grass, quickAttack: quickAttack, power:7, duration:600, eps: 10.00)
        case .voltSwitch: return QuickMove(element: .Electric, quickAttack: quickAttack, power:20, duration:2300, eps: 10.87)
        case .waterGun: return QuickMove(element: .Water, quickAttack: quickAttack, power:5, duration:500, eps: 10.00)
        case .wingAttack: return QuickMove(element: .Flying, quickAttack: quickAttack, power:8, duration:800, eps: 11.25)
        case .zenHeadbutt: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1100, eps: 9.09)
        }
    }
}
