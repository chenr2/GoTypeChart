//
//  PokemonSearchTableResult.swift
//  DualTypes
//
//  Created by Robert Chen on 8/24/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class PokemonSearchTableResult: UITableViewCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var secondElementName: UILabel!
    @IBOutlet weak var firstElementView: UIView!
    @IBOutlet weak var secondElementView: UIView!

    var pokemon: Pokemon? = nil
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = "#\(pokemon.pokedex) \(pokemon.name)" 
        if let firstElement = pokemon.type.first {
            elementName?.text = NSLocalizedString(firstElement.rawValue, comment: "")
            firstElementView?.backgroundColor = Colors.colorForElement(firstElement)
            elementName?.textColor = Colors.textColorForElement(firstElement)
        }
        if pokemon.type.count == 2 {
            if let lastElement = pokemon.type.last {
                secondElementName?.text = NSLocalizedString(lastElement.rawValue, comment: "")
                secondElementView?.backgroundColor = Colors.colorForElement(lastElement)
                secondElementName?.textColor = Colors.textColorForElement(lastElement)
            }
        } else {
            secondElementName?.text = ""
            secondElementView?.backgroundColor = UIColor.clearColor()
            secondElementName?.textColor = UIColor.clearColor()
        }
    }
}
