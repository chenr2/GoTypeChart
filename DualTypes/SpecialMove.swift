//
//  SpecialMove.swift
//  DualTypes
//
//  Created by Robert Chen on 8/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

struct SpecialMove {
    let element: ElementType
    let specialAttack: SpecialAttack
    let power: Int
    let duration: Int
    var dps: CGFloat {
        let time = CGFloat(duration)/1000
        return CGFloat(power) / time
    }
    let maxSpecialMove: CGFloat = 242 * 24.4 * 1.25 // moltres fire blast
    func specialMovePercentage(baseAttack: CGFloat, stab: Bool) -> CGFloat {
        let bonus: CGFloat = stab ? 1.25 : 1
        let percentage = 100 * baseAttack * dps * bonus / maxSpecialMove
        let curve = 10 * sqrt(percentage)
        return min(curve, 100)
    }
    
}