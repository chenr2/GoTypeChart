//
//  GymLeaderCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderCell: GridCell {
    
    @IBOutlet var pokemonName: UILabel!

    @IBOutlet weak var indexNumber: UILabel!
        
    func configureCell(_ pokemon: Pokemon, sortType: SortType){
        self.pokemon = pokemon
        pokemonName?.text = NSLocalizedString(pokemon.species.rawValue, comment: "") 
        indexNumber?.text = "#\(pokemon.pokedex)"
        backgroundColor = Colors.purple
    }
}
