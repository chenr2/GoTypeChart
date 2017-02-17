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
    var dps: CGFloat {
        let time = CGFloat(duration)/1000
        return CGFloat(power) / time
    }
    let maxQuickMove: CGFloat = 284 * 12.28 * 1.25 // mewtwo psycho cut
    func quickMovePercentage(_ baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxQuickMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    static func moveForQuickAttack(_ quickAttack: QuickAttack) -> QuickMove {
        switch quickAttack {
        case .acid: return QuickMove(element: .Poison, quickAttack: quickAttack, power:10, duration:1300)
        case .airSlash: return QuickMove(element: .Flying, quickAttack: quickAttack, power:12, duration:1200)
        case .astonish: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:8, duration:1050)
        case .bite: return QuickMove(element: .Dark, quickAttack: quickAttack, power:10, duration:1000)
        case .bubble: return QuickMove(element: .Water, quickAttack: quickAttack, power:15, duration:1700)
        case .bugBite: return QuickMove(element: .Bug, quickAttack: quickAttack, power:5, duration:950)
        case .bulletPunch: return QuickMove(element: .Steel, quickAttack: quickAttack, power:12, duration:1400)
        case .bulletSeed: return QuickMove(element: .Grass, quickAttack: quickAttack, power:8, duration:1550)
        case .chargeBeam: return QuickMove(element: .Electric, quickAttack: quickAttack, power:8, duration:1550)
        case .confusion: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:20, duration:2100)
        case .counter: return QuickMove(element: .Fight, quickAttack: quickAttack, power:10, duration:900)
        case .cut: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1000)
        case .dragonBreath: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:12, duration:1000)
        case .dragonTail: return QuickMove(element: .Dragon, quickAttack: quickAttack, power:15, duration:1550)
        case .ember: return QuickMove(element: .Fire, quickAttack: quickAttack, power:10, duration:1500)
        case .extrasensory: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1550)
        case .feintAttack: return QuickMove(element: .Dark, quickAttack: quickAttack, power:12, duration:1400)
        case .fireFang: return QuickMove(element: .Fire, quickAttack: quickAttack, power:12, duration:1340)
        case .fireSpin: return QuickMove(element: .Fire, quickAttack: quickAttack, power:15, duration:1550)
        case .frostBreath: return QuickMove(element: .Ice, quickAttack: quickAttack, power:10, duration:1400)
        case .furyCutter: return QuickMove(element: .Bug, quickAttack: quickAttack, power:3, duration:900)
        case .hex: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:10, duration:1200)
        case .hiddenPower: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1500)
        case .iceShard: return QuickMove(element: .Ice, quickAttack: quickAttack, power:12, duration:1700)
        case .infestation: return QuickMove(element: .Bug, quickAttack: quickAttack, power:10, duration:1550)
        case .ironTail: return QuickMove(element: .Steel, quickAttack: quickAttack, power:15, duration:1550)
        case .karateChop: return QuickMove(element: .Fight, quickAttack: quickAttack, power:8, duration:1300)
        case .lick: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:5, duration:1000)
        case .lowKick: return QuickMove(element: .Fight, quickAttack: quickAttack, power:6, duration:1100)
        case .metalClaw: return QuickMove(element: .Steel, quickAttack: quickAttack, power:8, duration:1130)
        case .mudShot: return QuickMove(element: .Ground, quickAttack: quickAttack, power:9, duration:1050)
        case .mudSlap: return QuickMove(element: .Ground, quickAttack: quickAttack, power:15, duration:1850)
        case .peck: return QuickMove(element: .Flying, quickAttack: quickAttack, power:10, duration:1500)
        case .poisonJab: return QuickMove(element: .Poison, quickAttack: quickAttack, power:12, duration:1300)
        case .poisonSting: return QuickMove(element: .Poison, quickAttack: quickAttack, power:6, duration:1075)
        case .pound: return QuickMove(element: .Normal, quickAttack: quickAttack, power:8, duration:1040)
        case .powderSnow: return QuickMove(element: .Ice, quickAttack: quickAttack, power:6, duration:1000)
        case .psychoCut: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:8, duration:1070)
        case .quickAttack: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1250)
        case .razorLeaf: return QuickMove(element: .Grass, quickAttack: quickAttack, power:15, duration:1500)
        case .rockSmash: return QuickMove(element: .Fight, quickAttack: quickAttack, power:15, duration:1700)
        case .rockThrow: return QuickMove(element: .Rock, quickAttack: quickAttack, power:12, duration:1400)
        case .scratch: return QuickMove(element: .Normal, quickAttack: quickAttack, power:12, duration:1000)
        case .shadowClaw: return QuickMove(element: .Ghost, quickAttack: quickAttack, power:12, duration:1200)
        case .snarl: return QuickMove(element: .Dark, quickAttack: quickAttack, power:12, duration:1550)
        case .spark: return QuickMove(element: .Electric, quickAttack: quickAttack, power:8, duration:1200)
        case .splash: return QuickMove(element: .Water, quickAttack: quickAttack, power:0, duration:1730)
        case .steelWing: return QuickMove(element: .Steel, quickAttack: quickAttack, power:12, duration:1300)
        case .struggleBug: return QuickMove(element: .Bug, quickAttack: quickAttack, power:6, duration:1500)
        case .suckerPunch: return QuickMove(element: .Dark, quickAttack: quickAttack, power:8, duration:1200)
        case .tackle: return QuickMove(element: .Normal, quickAttack: quickAttack, power:10, duration:1000)
        case .thunderShock: return QuickMove(element: .Electric, quickAttack: quickAttack, power:6, duration:1100)
        case .transform: return QuickMove(element: .Normal, quickAttack: quickAttack, power:0, duration:2230)
        case .vineWhip: return QuickMove(element: .Grass, quickAttack: quickAttack, power:8, duration:1100)
        case .voltSwitch: return QuickMove(element: .Electric, quickAttack: quickAttack, power:12, duration:2300)
        case .waterGun: return QuickMove(element: .Water, quickAttack: quickAttack, power:10, duration:1000)
        case .wingAttack: return QuickMove(element: .Flying, quickAttack: quickAttack, power:10, duration:1250)
        case .zenHeadbutt: return QuickMove(element: .Psychic, quickAttack: quickAttack, power:12, duration:1550)
        }
    }
}
