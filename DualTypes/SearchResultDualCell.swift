//
//  SearchResultDualCell.swift
//  DualTypes
//
//  Created by Robert Chen on 8/15/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class SearchResultDualCell: FlexibleCollectionCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var secondElementName: UILabel!
    @IBOutlet weak var firstElementView: UIView!
    @IBOutlet weak var secondElementView: UIView!
    
    var pokemon: Pokemon? = nil
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        pokemonName?.text = pokemon.name
        if let firstElement = pokemon.type.first {
            elementName?.text = firstElement.rawValue
            firstElementView?.backgroundColor = Colors.colorForElement(firstElement)
            elementName?.textColor = (firstElement == .Electric) ? .grayColor() : .whiteColor()
        }
        if let lastElement = pokemon.type.last {
            secondElementName?.text = lastElement.rawValue
            secondElementView?.backgroundColor = Colors.colorForElement(lastElement)
            secondElementName?.textColor = (lastElement == .Electric) ? .grayColor() : .whiteColor()
        }
    }
    
}