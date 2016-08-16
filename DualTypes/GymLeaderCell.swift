//
//  GymLeaderCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderCell: UICollectionViewCell {
    
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    
    var pokemon: Pokemon? = nil
    
    func configureCell(pokemon: Pokemon, sortType: SortType){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
    }
}
