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
                double = getKeysOfValue(.double, pokemon: pokemon)
                half = getKeysOfValue(.half, pokemon: pokemon)
            }
        }
    }
    
    var double: [ElementType] = []
    var half: [ElementType] = []

    func getKeysOfValue(damage: DamageType, pokemon: Pokemon) -> [ElementType] {
        var elements: [ElementType] = []
        for (key, value) in pokemon.vulnerabilitySet {
            if value == damage {
                elements.append(key)
            }
        }
        return elements
    }
    
    override func viewDidLoad() {
        title = pokemon!.name
    }
    
}

extension GymLeaderDetail {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return double.count
        case 2:
            return half.count
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
            cell.textLabel?.text = "Type"
            let elementArray = pokemon?.defense.map {
                return $0.rawValue
            }
            let elementString = elementArray?.joinWithSeparator(" / ")
            if let elementString = elementString {
                cell.detailTextLabel?.text = elementString
            }
            return cell
        case 1:
            detailTypeCell.textLabel?.text = double[indexPath.row].rawValue
        case 2:
            detailTypeCell.textLabel?.text = half[indexPath.row].rawValue
        default:
            break
        }
        return detailTypeCell

    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Super effective against \(pokemon!.name)"
        case 2:
            return "Not very effective against \(pokemon!.name)"
        default:
            return ""
        }
    }

}