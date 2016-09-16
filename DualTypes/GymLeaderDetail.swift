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
    
    var double: [ElementType] = []
    var half: [ElementType] = []
    
    var filterJump: FilterJump? = nil
    
    var directCounters: [Any] = []
    
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
        if let pokemon = pokemon {
            let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
            title = "#\(pokemon.pokedex) \(pokemonName)"
            let counterPokemon: [Any] = PokemonCounter.hardCounters(pokemon.pokedex).map {
                return $0 as Any
            }
            directCounters += counterPokemon
            let counterTypes: [Any] = pokemon.bestCounter.map {
                return $0 as Any
            }
            directCounters += counterTypes
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        guard let cell = sender as? GymLeaderPokemonCounter,
            let counterPokemon = cell.pokemonCounter,
            let _ = Pokemon.pokemonForSpecies(counterPokemon.species)
        else { return false }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? GymLeaderPokemonCounter,
            let counterPokemon = cell.pokemonCounter,
            let pokemonInstance = Pokemon.pokemonForSpecies(counterPokemon.species),
            let destination = segue.destinationViewController as? GymLeaderDetail {
            destination.pokemon = pokemonInstance
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
            return double.count
        case 3:
            return half.count
        case 4:
            return quickAttacks.count
        case 5:
            return specialAttacks.count
        case 6: // stats
            return 3
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
            if let elementCounter = selectedItem as? ElementType {
                detailTypeCell.configureCell(elementCounter)
            } else if let pokemonCounter = selectedItem as? PokemonCounter {
                let pokemonCounterCell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderPokemonCounter), forIndexPath: indexPath) as! GymLeaderPokemonCounter
                pokemonCounterCell.configureCell(pokemonCounter)
                return pokemonCounterCell
            }
        case 2:
            detailTypeCell.configureCell(double[indexPath.row])
        case 3:
            detailTypeCell.configureCell(half[indexPath.row])
        case 4:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailQuickMoveCell), forIndexPath: indexPath) as! GymLeaderDetailQuickMoveCell
            cell.configureCell(quickAttacks[indexPath.row], pokemon: pokemon!)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderDetailQuickMoveCell), forIndexPath: indexPath) as! GymLeaderDetailQuickMoveCell
            cell.configureCellSpecial(specialAttacks[indexPath.row], pokemon: pokemon!)
            return cell
        case 6:
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
                text = "\(NSLocalizedString("SUPER_EFFECTIVE_AGAINST", comment: "")) \(pokemonName):"
            case 3:
                text = "\(NSLocalizedString("NOT_VERY_EFFECTIVE_AGAINST", comment: "")) \(pokemonName):"
            case 4:
                text = "\(NSLocalizedString("QUICK_MOVES", comment: "")):"
            case 5:
                text = "\(NSLocalizedString("SPECIAL_MOVES", comment: "")):"
            case 6:
                text = "\(NSLocalizedString("STATS", comment: "")):"
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
        switch section {
        case 1:
            if directCounters.isEmpty {
                return CGSizeZero
            }
        default:
            break
        }
        return CGSize(width: 0, height: 40)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var cellsPerRow:CGFloat = 4
        switch indexPath.section {
        case 0, 4, 5, 6, 1:
            cellsPerRow = 3
        default:
            break
        }
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        // subtracting 1, because on the 6+ it's off by 1
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch indexPath.section {
        case 4, 5:
            // move sets
            return CGSize(width: eachSide, height:eachSide + 50)
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
            let elements = pokemon!.type
            filterJump?.setFilters(elements)
        case 1:
            if let moveElement = directCounters[indexPath.row] as? ElementType {
                filterJump?.setMoveFilter(moveElement)
            }
        case 2:
            moveElement = double[indexPath.row]
        case 3:
            moveElement = half[indexPath.row]
        default:
            return
        }
        if let moveElement = moveElement {
            filterJump?.setMoveFilter(moveElement)
        }
    }
}
