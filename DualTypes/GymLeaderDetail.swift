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
                quickAttacks = pokemon.quickAttacks.sort { attackA, attackB in
                    let baseAttack = CGFloat(pokemon.attack)
                    let moveA = QuickMove.moveForQuickAttack(attackA)
                    let stabA = pokemon.type.contains(moveA.element)
                    let statA = moveA.quickMovePercentage(baseAttack, stab: stabA)
                    let moveB = QuickMove.moveForQuickAttack(attackB)
                    let stabB = pokemon.type.contains(moveB.element)
                    let statB = moveB.quickMovePercentage(baseAttack, stab: stabB)
                    return statA > statB
                }
                specialAttacks = pokemon.specialAttacks.sort { attackA, attackB in
                    let baseAttack = CGFloat(pokemon.attack)
                    let moveA = SpecialMove.moveForSpecialAttack(attackA)
                    let stabA = pokemon.type.contains(moveA.element)
                    let statA = moveA.specialMovePercentage(baseAttack, stab: stabA)
                    let moveB = SpecialMove.moveForSpecialAttack(attackB)
                    let stabB = pokemon.type.contains(moveB.element)
                    let statB = moveB.specialMovePercentage(baseAttack, stab: stabB)
                    return statA > statB
                }
            }
        }
    }
    
    var quickAttacks: [QuickAttack] = []
    var specialAttacks: [SpecialAttack] = []
    
    var selectedQuickAttack = 0
    var selectedSpecialAttack = 0
    
    var double: [ElementType] = []
    var half: [ElementType] = []
    
    var filterJump: FilterJump? = nil
    
    var directCounters: [TypeResult] = []
    
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
    
    func recalculateDirectCounters(){
        guard let pokemon = pokemon else { return }

        directCounters = Pokemon.calculateTypeCounters(
            pokemon,
            quickAttack: quickAttacks[selectedQuickAttack],
            specialAttack: specialAttacks[selectedSpecialAttack]
        )
        let sections = NSIndexSet(index: 1)
        collectionView?.reloadSections(sections)
    }
    
    override func viewDidLoad() {
        if let pokemon = pokemon {
            let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
            title = "#\(pokemon.pokedex) \(pokemonName)"
            
            directCounters = Pokemon.calculateTypeCounters(
                pokemon,
                quickAttack: quickAttacks.first!,
                specialAttack: specialAttacks.first!
            )
            let quickMoveIndexPath = NSIndexPath(forItem: 0, inSection: 2)
            let chargeMoveIndexPath = NSIndexPath(forItem: 0, inSection: 3)
            collectionView(collectionView!, didSelectItemAtIndexPath: quickMoveIndexPath)
            collectionView(collectionView!, didSelectItemAtIndexPath: chargeMoveIndexPath)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? GymLeaderPokemonCounter,
            let counterPokemon = cell.typeResult?.opponent,
            let destination = segue.destinationViewController as? GymLeaderDetail {
            destination.pokemon = counterPokemon
            // pop to root
            destination.filterJump = filterJump
        }
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
        case 1:
            return directCounters.count
        case 2:
            return quickAttacks.count
        case 3:
            return specialAttacks.count
        case 4: // stats
            return 3
        case 5:
            return double.count
        case 6:
            return half.count
        default:
            return 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let detailTypeCell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailTypeCell), forIndexPath: indexPath) as! GymLeaderDetailTypeCell
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailHeader), forIndexPath: indexPath) as! GymLeaderDetailHeader
            cell.configureCell(pokemon!.type)
            return cell
        case 1:
            let selectedItem = directCounters[indexPath.row]
            let pokemonCounterCell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderPokemonCounter), forIndexPath: indexPath) as! GymLeaderPokemonCounter
            pokemonCounterCell.configureCell(selectedItem)
            return pokemonCounterCell
        case 2:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailQuickMoveCell), forIndexPath: indexPath) as! GymLeaderDetailQuickMoveCell
            let cellSelected = indexPath.row == selectedQuickAttack
            cell.configureCell(quickAttacks[indexPath.row], pokemon: pokemon!, cellSelected: cellSelected)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailQuickMoveCell), forIndexPath: indexPath) as! GymLeaderDetailQuickMoveCell
            let cellSelected = indexPath.row == selectedSpecialAttack
            cell.configureCellSpecial(specialAttacks[indexPath.row], pokemon: pokemon!, cellSelected: cellSelected)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailStatCell), forIndexPath: indexPath) as! GymLeaderDetailStatCell
            switch indexPath.row {
            case 0:
                cell.configureCell(pokemon, statType: .attack)
            case 1:
                cell.configureCell(pokemon, statType: .defense)
            case 2:
                cell.configureCell(pokemon, statType: .stamina)
            default:
                break
            }
            return cell
        case 5:
            detailTypeCell.configureCell(double[indexPath.row])
        case 6:
            detailTypeCell.configureCell(half[indexPath.row])
        default:
            break
        }
        return detailTypeCell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: String(GymLeaderDetailSectionHeader), forIndexPath: indexPath) as! GymLeaderDetailSectionHeader
        if let pokemon = pokemon {
            let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
            var text = ""
            switch indexPath.section {
            case 0:
                text = "\(NSLocalizedString("Type", comment: "")):"
            case 1:
                text = "\(NSLocalizedString("RECOMMENDED_AGAINST", comment: "")) \(pokemonName):"
            case 2:
                text = "\(NSLocalizedString("QUICK_MOVES", comment: "")):"
            case 3:
                text = "\(NSLocalizedString("SPECIAL_MOVES", comment: "")):"
            case 4:
                text = "\(NSLocalizedString("STATS", comment: "")):"
            case 5:
                text = "\(NSLocalizedString("SUPER_EFFECTIVE_AGAINST", comment: "")) \(pokemonName):"
            case 6:
                text = "\(NSLocalizedString("NOT_VERY_EFFECTIVE_AGAINST", comment: "")) \(pokemonName):"
            default:
                break
            }
            cell.configureCell(text)
        }
        return cell
    }
    
}

extension GymLeaderDetail: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 40)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var cellsPerRow:CGFloat = 4
        switch indexPath.section {
        case 0, 2, 3, 4, 1:
            cellsPerRow = 3
        default:
            break
        }
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        // subtracting 1, because on the 6+ it's off by 1
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch indexPath.section {
        case 2, 3:
            // move sets
            return CGSize(width: eachSide, height:eachSide + 58)
        default:
            return CGSize(width: eachSide, height:eachSide)            
        }
    }

}

extension GymLeaderDetail {
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var moveElement: ElementType? = nil
        switch indexPath.section {
        case 0:
            if let pokemon = pokemon {
                let elements = pokemon.type
                filterJump?.setFilters(elements)
            }
        case 2:
            selectedQuickAttack = indexPath.row
            recalculateDirectCounters()
            for (index, _) in quickAttacks.enumerate() {
                let otherIndexPath = NSIndexPath(forRow: index, inSection: indexPath.section)
                if let cell = collectionView.cellForItemAtIndexPath(otherIndexPath) as? GymLeaderDetailQuickMoveCell {
                    cell.changeSelection(false)
                }
            }
            if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? GymLeaderDetailQuickMoveCell {
                cell.changeSelection(true)
            }
        case 3:
            selectedSpecialAttack = indexPath.row
            recalculateDirectCounters()
            for (index, _) in specialAttacks.enumerate() {
                let otherIndexPath = NSIndexPath(forRow: index, inSection: indexPath.section)
                if let cell = collectionView.cellForItemAtIndexPath(otherIndexPath) as? GymLeaderDetailQuickMoveCell {
                    cell.changeSelection(false)
                }
            }
            if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? GymLeaderDetailQuickMoveCell {
                cell.changeSelection(true)
            }
        case 5:
            moveElement = double[indexPath.row]
        case 6:
            moveElement = half[indexPath.row]
        default:
            return
        }
        if let moveElement = moveElement {
            filterJump?.setMoveFilter(moveElement)
        }
    }
    
}
