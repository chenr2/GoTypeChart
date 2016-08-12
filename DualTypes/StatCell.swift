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
    @IBOutlet weak var statIcon: UIImageView!
    
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
            statIcon.image = UIImage.init(named: "punch")
        case .defense:
            sortLabel.text = "\(pokemon.defense)"
            statIcon.image = UIImage.init(named: "shield")
        case .stamina:
            sortLabel.text = "\(pokemon.stamina)"
            statIcon.image = UIImage.init(named: "energy")
        default:
            sortLabel.text = ""
        }
    }
}
