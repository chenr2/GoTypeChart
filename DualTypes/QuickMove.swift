//
//  QuickMove.swift
//  DualTypes
//
//  Created by Robert Chen on 8/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import Foundation

struct QuickMove {
    let element: ElementType
    let quickAttack: QuickAttack
    let power: Int
    let duration: Int
    var dps: Float {
        return Float(power) / Float(duration)
    }
}