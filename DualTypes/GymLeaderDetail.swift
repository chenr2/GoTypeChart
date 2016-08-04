//
//  GymLeaderDetail.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetail: UITableViewController {
    
    var pokemon: Pokemon? = nil 
    
    override func viewDidAppear(animated: Bool) {
        print(pokemon?.name)
    }
}

extension GymLeaderDetail {
    
}
