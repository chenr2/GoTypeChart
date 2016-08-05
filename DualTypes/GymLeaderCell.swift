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
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokedexNumber: UILabel!
    
    var pokemon: Pokemon? = nil {
        didSet {
            if let pokemon = pokemon {
                pokedexNumber?.text = "\(pokemon.pokedex)"
                pokemonName?.text = pokemon.name
                let elementArray = pokemon.defense.map {
                    return $0.rawValue
                }
                pokemonType?.text = elementArray.joinWithSeparator(" / ")
            }
        }
    }
}
