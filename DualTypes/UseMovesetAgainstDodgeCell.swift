//
//  UseMovesetAgainstDodgeCell.swift
//  DualTypes
//
//  Created by Robert Chen on 3/8/17.
//  Copyright © 2017 Robert Chen. All rights reserved.
//

import UIKit

class UseMovesetAgainstDodgeCell: UITableViewCell {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    func setSegmentedControlState(state: Dodge){
        switch state {
        case .none:
            segmentedControl.selectedSegmentIndex = 0
        case .charge:
            segmentedControl.selectedSegmentIndex = 1
        case .both:
            segmentedControl.selectedSegmentIndex = 2
        }
    }
}
