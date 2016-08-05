//
//  GymLeaderDetail.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetail: UITableViewController {
    
    var pokemon: Pokemon? = nil {
        didSet {
            if let pokemon = pokemon {
                quadruple = getKeysOfValue(.quadruple, pokemon: pokemon)
                double = getKeysOfValue(.double, pokemon: pokemon)
                half = getKeysOfValue(.half, pokemon: pokemon)
                quarter = getKeysOfValue(.quarter, pokemon: pokemon)
                none = getKeysOfValue(.none, pokemon: pokemon)
            }
        }
    }
    
    var quadruple: [ElementType] = []
    var double: [ElementType] = []
    var half: [ElementType] = []
    var quarter: [ElementType] = []
    var none: [ElementType] = []

    func getKeysOfValue(damage: DamageType, pokemon: Pokemon) -> [ElementType] {
        var elements: [ElementType] = []
        for (key, value) in pokemon.vulnerabilitySet {
            if value == damage {
                elements.append(key)
            }
        }
        return elements
    }
    
}

extension GymLeaderDetail {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return quadruple.count
        case 2:
            return double.count
        case 3:
            return half.count
        case 4:
            return quarter.count
        case 5:
            return none.count
        default:
            return 0
        }
    }
    
}

extension GymLeaderDetail {

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let detailTypeCell = tableView.dequeueReusableCellWithIdentifier("GymLeaderDetailTypeCell") as! GymLeaderDetailTypeCell
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("GymLeaderDetailHeader") as! GymLeaderDetailHeader
            cell.textLabel?.text = pokemon?.name
            let elementArray = pokemon?.defense.map {
                return $0.rawValue
            }
            let elementString = elementArray?.joinWithSeparator(" / ")
            if let elementString = elementString {
                cell.detailTextLabel?.text = "Type:  \(elementString)"
            }
            return cell
        case 1:
            detailTypeCell.textLabel?.text = quadruple[indexPath.row].rawValue
        case 2:
            detailTypeCell.textLabel?.text = double[indexPath.row].rawValue
        case 3:
            detailTypeCell.textLabel?.text = half[indexPath.row].rawValue
        case 4:
            detailTypeCell.textLabel?.text = quarter[indexPath.row].rawValue
        case 5:
            detailTypeCell.textLabel?.text = none[indexPath.row].rawValue
        default:
            break
        }
        return detailTypeCell

    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "Elements that do 4x damage:"
        case 2:
            return "Elements that do 2x damage:"
        case 3:
            return "Elements that do 1/2x damage:"
        case 4:
            return "Elements that do 1/4x damage:"
        case 5:
            return "Elements that do no damage:"
        default:
            return ""
        }
    }

}