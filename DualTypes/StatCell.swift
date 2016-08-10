//
//  StatCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/10/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class StatCell: UICollectionViewCell {
    
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokedexNumber: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    
    var pokemon: Pokemon? = nil
    
    func configureCell(pokemon: Pokemon, sortType: SortType){
        self.pokemon = pokemon
        pokedexNumber?.text = "#\(pokemon.pokedex)"
        pokemonName?.text = pokemon.name
        let elementArray = pokemon.type.map {
            return $0.rawValue
        }
        pokemonType?.text = elementArray.joinWithSeparator(" / ")
        switch sortType {
        case .attack:
            sortLabel.text = "\(pokemon.attack)"
        case .defense:
            sortLabel.text = "\(pokemon.defense)"
        case .stamina:
            sortLabel.text = "\(pokemon.stamina)"
        default:
            sortLabel.text = ""
        }
    }
}
