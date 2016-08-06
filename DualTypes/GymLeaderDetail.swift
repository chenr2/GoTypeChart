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
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "GymLeaderDetailSectionHeader", forIndexPath: indexPath) as! GymLeaderDetailSectionHeader
        switch indexPath.section {
        case 1:
            cell.sectionHeaderText = "Super effective against \(pokemon!.name):"
        case 2:
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
        case 0:
            return CGSizeZero
        default:
            return CGSize(width: 0, height: 50)            
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellPadding:CGFloat = 10
        let cellsPerRow:CGFloat = 3
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        switch indexPath.section {
        case 0:
            return CGSize(width: eachSide, height:eachSide + 30)
        default:
            return CGSize(width: eachSide, height:eachSide)
        }
    }

}