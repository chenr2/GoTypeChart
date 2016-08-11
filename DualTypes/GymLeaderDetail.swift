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
        return elements.sort { elementA, elementB in
            return elementA.rawValue < elementB.rawValue
        }
    }
    
    override func viewDidLoad() {
        title = pokemon!.name
    }
    
}

extension GymLeaderDetail {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 7
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1: // stats
            return 3
        case 2:
            return pokemon!.quickAttacks.count
        case 3:
            return pokemon!.specialAttacks.count
        case 4:
            return pokemon!.bestCounter.count
        case 5:
            return double.count
        case 6:
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
            cell.defense = pokemon!.type
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderDetailStatCell", forIndexPath: indexPath) as! GymLeaderDetailStatCell
            cell.pokemon = pokemon
            switch indexPath.row {
            case 0:
                cell.statType = .attack
            case 1:
                cell.statType = .defense
            case 2:
                cell.statType = .stamina
            default:
                break 
            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderDetailQuickMoveCell", forIndexPath: indexPath) as! GymLeaderDetailQuickMoveCell
            cell.quickMove = pokemon!.quickAttacks[indexPath.row]
            return cell

        case 3:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderDetailSpecialMoveCell", forIndexPath: indexPath) as! GymLeaderDetailSpecialMoveCell
            cell.specialMove = pokemon!.specialAttacks[indexPath.row]
            return cell

        case 4:
            detailTypeCell.element = pokemon!.bestCounter[indexPath.row]
        case 5:
            detailTypeCell.element = double[indexPath.row]
        case 6:
            detailTypeCell.element = half[indexPath.row]
        default:
            break
        }
        return detailTypeCell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "GymLeaderDetailSectionHeader", forIndexPath: indexPath) as! GymLeaderDetailSectionHeader
        switch indexPath.section {
        case 0:
            cell.sectionHeaderText = "Type:"            
        case 1:
            cell.sectionHeaderText = "Stats:"
        case 2:
            cell.sectionHeaderText = "Quick Moves:"
        case 3:
            cell.sectionHeaderText = "Special Moves:"
        case 4:
            cell.sectionHeaderText = "Recommended against \(pokemon!.name):"
        case 5:
            cell.sectionHeaderText = "Super effective against \(pokemon!.name):"
        case 6:
            cell.sectionHeaderText = "Not very effective against \(pokemon!.name):"
        default:
            break
        }        
        return cell
    }
    
}

extension GymLeaderDetail: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 2:
            if pokemon!.bestCounter.isEmpty {
                return CGSizeZero
            }
        default:
            break
        }
        return CGSize(width: 0, height: 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var cellsPerRow:CGFloat = 4
        switch indexPath.section {
        case 0, 1, 2, 3, 4:
            cellsPerRow = 3
        default:
            break
        }
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        return CGSize(width: eachSide, height:eachSide)
    }

}