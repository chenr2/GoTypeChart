//
//  QuickMove.swift
//  DualTypes
//
//  Created by Robert Chen on 8/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

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
}