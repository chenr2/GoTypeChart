//
//  GymLeaderDetail.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetail: UIViewController {
    
    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemon: Pokemon? = nil 
    
    override func viewWillAppear(animated: Bool) {
        if let pokemon = pokemon {
            pokemonName?.text = pokemon.name
        }
    }
    
}
