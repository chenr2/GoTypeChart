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
    zenHeadbutt = "Zen Headbutt"
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
        zenHeadbutt
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
    func quickMovePercentage(baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxQuickMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    static func moveForQuickAttack(quickAttack: QuickAttack) -> QuickMove {
        switch quickAttack {
        case .pound: return QuickMove(element: .Normal, quickAttack: quickAttack, power: 7, duration: 540)
        case .metalClaw: return QuickMove(element: .Steel, quickAttack: quickAttack, power: 8, duration: 630)
        case .psychoCut: return QuickMove(element: .Psychic, quickAttack: quickAttack, power: 7, duration: 570)
        case .scratch: return QuickMove(element: .Normal, quickAttack: quickAttack, power: 6, duration: 500)
        case .waterGun: return QuickMove(element: .Water, quickAttack: quickAttack, power: 6, duration: 500)
        case .wingAttack: return QuickMove(element: .Flying, quickAttack: quickAttack, power: 9, duration: 750)
        case .bite: return QuickMove(element: .Dark, quickAttack: quickAttack, power: 6, duration: 500)
        case .dragonBreath: return QuickMove(element: .Dragon, quickAttack: quickAttack, power: 6, duration: 500)
        case .fireFang: return QuickMove(element: .Fire, quickAttack: quickAttack, power: 10, duration: 840)
        case .shadowClaw: return QuickMove(element: .Ghost, quickAttack: quickAttack, power: 11, duration: 950)
        case .feintAttack: return QuickMove(element: .Dark, quickAttack: quickAttack, power: 12, duration: 1_040)
        case .poisonJab: return QuickMove(element: .Poison, quickAttack: quickAttack, power: 12, duration: 1_050)
        case .zenHeadbutt: return QuickMove(element: .Psychic, quickAttack: quickAttack, power: 12, duration: 1_050)
        case .steelWing: return QuickMove(element: .Steel, quickAttack: quickAttack, power: 15, duration: 1_330)
        case .frostBreath: return QuickMove(element: .Ice, quickAttack: quickAttack, power: 9, duration: 810)
        case .bugBite: return QuickMove(element: .Bug, quickAttack: quickAttack, power: 5, duration: 450)
        case .mudSlap: return QuickMove(element: .Ground, quickAttack: quickAttack, power: 15, duration: 1_350)
        case .tackle: return QuickMove(element: .Normal, quickAttack: quickAttack, power: 12, duration: 1_100)
        case .mudShot: return QuickMove(element: .Ground, quickAttack: quickAttack, power: 6, duration: 550)
        case .bubble: return QuickMove(element: .Water, quickAttack: quickAttack, power: 25, duration: 2_300)
        case .vineWhip: return QuickMove(element: .Grass, quickAttack: quickAttack, power: 7, duration: 650)
        case .iceShard: return QuickMove(element: .Ice, quickAttack: quickAttack, power: 15, duration: 1_400)
        case .rockSmash: return QuickMove(element: .Fight, quickAttack: quickAttack, power: 15, duration: 1_410)
        case .cut: return QuickMove(element: .Normal, quickAttack: quickAttack, power: 12, duration: 1_130)
        case .poisonSting: return QuickMove(element: .Poison, quickAttack: quickAttack, power: 6, duration: 575)
        case .razorLeaf: return QuickMove(element: .Grass, quickAttack: quickAttack, power: 15, duration: 1_450)
        case .lick: return QuickMove(element: .Ghost, quickAttack: quickAttack, power: 5, duration: 500)
        case .suckerPunch: return QuickMove(element: .Dark, quickAttack: quickAttack, power: 7, duration: 700)
        case .spark: return QuickMove(element: .Electric, quickAttack: quickAttack, power: 7, duration: 700)
        case .confusion: return QuickMove(element: .Psychic, quickAttack: quickAttack, power: 15, duration: 1_510)
        case .acid: return QuickMove(element: .Poison, quickAttack: quickAttack, power: 10, duration: 1_050)
        case .ember: return QuickMove(element: .Fire, quickAttack: quickAttack, power: 10, duration: 1_050)
        case .rockThrow: return QuickMove(element: .Rock, quickAttack: quickAttack, power: 12, duration: 1_360)
        case .peck: return QuickMove(element: .Flying, quickAttack: quickAttack, power: 10, duration: 1_150)
        case .thunderShock: return QuickMove(element: .Electric, quickAttack: quickAttack, power: 5, duration: 600)
        case .bulletPunch: return QuickMove(element: .Steel, quickAttack: quickAttack, power: 10, duration: 1_200)
        case .lowKick: return QuickMove(element: .Fight, quickAttack: quickAttack, power: 5, duration: 600)
        case .quickAttack: return QuickMove(element: .Normal, quickAttack: quickAttack, power: 10, duration: 1_330)
        case .karateChop: return QuickMove(element: .Fight, quickAttack: quickAttack, power: 6, duration: 800)
        case .furyCutter: return QuickMove(element: .Bug, quickAttack: quickAttack, power: 3, duration: 400)
        case .splash: return QuickMove(element: .Water, quickAttack: quickAttack, power: 0, duration: 1_230)
        }
    }
}