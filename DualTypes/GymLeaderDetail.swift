//
//  GymLeaderDetail.swift
//  DualTypes
//
//  Created by Robert Chen on 8/4/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaderDetail: UICollectionViewController {
    
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
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let detailTypeCell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderDetailTypeCell", forIndexPath: indexPath) as! GymLeaderDetailTypeCell
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderDetailHeader", forIndexPath: indexPath) as! GymLeaderDetailHeader
            cell.defense = pokemon!.defense            
            return cell
        case 1:
            detailTypeCell.element = double[indexPath.row]
        case 2:
            detailTypeCell.element = half[indexPath.row]
        default:
            break
        }
        return detailTypeCell
    }
    
}

extension GymLeaderDetail {
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 1:
//            return "Super effective against \(pokemon!.name)"
//        case 2:
//            return "Not very effective against \(pokemon!.name)"
//        default:
//            return ""
//        }
//    }

}