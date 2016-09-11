//
//  ElementType.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

enum ElementType: String {
    case
        Normal = "NormalType",
        Fight = "FightingType",
        Flying = "FlyingType",
        Poison = "PoisonType",
        Ground = "GroundType",
        Rock = "RockType",
        Bug = "BugType",
        Ghost = "GhostType",
        Steel = "SteelType",
        Fire = "FireType",
        Water = "WaterType",
        Grass = "GrassType",
        Electric = "ElectricType",
        Psychic = "PsychicType",
        Ice = "IceType",
        Dragon = "DragonType",
        Dark = "DarkType",
        Fairy = "FairyType"
    static let allValues = [Normal, Fight, Flying, Poison, Ground, Rock, Bug, Ghost, Steel, Fire, Water, Grass, Electric, Psychic, Ice, Dragon, Dark, Fairy]
}