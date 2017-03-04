//
//  Colors.swift
//  DualTypes
//
//  Created by Robert Chen on 8/5/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

struct Colors {
    
    static let blue = UIColor(red: 0.024, green: 0.467, blue: 0.941, alpha: 1.0)
    static let red = UIColor(red: 0.753, green: 0.141, blue: 0.192, alpha: 1.0)
    static let orange = UIColor(red: 0.957, green: 0.537, blue: 0.255, alpha: 1.0)
    static let purple = UIColor(red: 0.545, green: 0.537, blue: 0.725, alpha: 1.0)
    static let gray = UIColor(red: 0.545, green: 0.545, blue: 0.545, alpha: 1.0)

    static let normal = UIColor(colorLiteralRed: 0.757, green: 0.757, blue: 0.757, alpha: 1)
    static let fight = UIColor(colorLiteralRed: 0.929, green: 0.647, blue: 0.502, alpha: 1)
    static let flying = UIColor(colorLiteralRed: 0.055, green: 0.439, blue: 0.467, alpha: 1)
    static let poison = UIColor(colorLiteralRed: 0.659, green: 0.624, blue: 0.843, alpha: 1)
    static let ground = UIColor(colorLiteralRed: 0.545, green: 0.341, blue: 0.165, alpha: 1)
    static let rock = UIColor(colorLiteralRed: 0.475, green: 0.400, blue: 0.373, alpha: 1)
    static let bug = UIColor(colorLiteralRed: 0.400, green: 0.435, blue: 0.239, alpha: 1)
    static let ghost = UIColor(colorLiteralRed: 0.353, green: 0.329, blue: 0.525, alpha: 1)
    static let steel = UIColor(colorLiteralRed: 0.627, green: 0.667, blue: 0.725, alpha: 1)
    static let fire = UIColor(colorLiteralRed: 0.816, green: 0.008, blue: 0.106, alpha: 1)
    static let water = UIColor(colorLiteralRed: 0.286, green: 0.675, blue: 0.804, alpha: 1)
    static let grass = UIColor(colorLiteralRed: 0.427, green: 0.725, blue: 0.200, alpha: 1)
    static let electric = UIColor(colorLiteralRed: 0.980, green: 0.851, blue: 0.373, alpha: 1)
    static let psychic = UIColor(colorLiteralRed: 0.871, green: 0.573, blue: 0.643, alpha: 1)
    static let ice = UIColor(colorLiteralRed: 0.439, green: 0.831, blue: 0.996, alpha: 1)
    static let dragon = UIColor(colorLiteralRed: 0.059, green: 0.318, blue: 0.055, alpha: 1)
    static let dark = UIColor(colorLiteralRed: 0.059, green: 0.059, blue: 0.059, alpha: 1)
    static let fairy = UIColor(colorLiteralRed: 0.925, green: 0.635, blue: 0.937, alpha: 1)
    
    static func colorForElement(_ elementType: ElementType) -> UIColor {
        switch elementType {
        case .Normal:
            return Colors.normal
        case .Fight:
            return Colors.fight
        case .Flying:
            return Colors.flying
        case .Poison:
            return Colors.poison
        case .Ground:
            return Colors.ground
        case .Rock:
            return Colors.rock
        case .Bug:
            return Colors.bug
        case .Ghost:
            return Colors.ghost
        case .Steel:
            return Colors.steel
        case .Fire:
            return Colors.fire
        case .Water:
            return Colors.water
        case .Grass:
            return Colors.grass
        case .Electric:
            return Colors.electric
        case .Psychic:
            return Colors.psychic
        case .Ice:
            return Colors.ice
        case .Dragon:
            return Colors.dragon
        case .Dark:
            return Colors.dark
        case .Fairy:
            return Colors.fairy
        }
    }
    
    static func textColorForElement(_ elementType: ElementType) -> UIColor {
        switch elementType {
        case .Electric:
            return .gray
        case .Normal:
            return .darkGray
        default:
            return .white
        }
    }
}
