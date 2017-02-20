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
                quickAttacks = pokemon.quickAttacks.sorted { attackA, attackB in
                    let baseAttack = CGFloat(pokemon.attack)
                    let moveA = QuickMove.moveForQuickAttack(attackA)
                    let stabA = pokemon.type.contains(moveA.element)
                    let statA = moveA.quickMovePercentage(baseAttack, stab: stabA)
                    let moveB = QuickMove.moveForQuickAttack(attackB)
                    let stabB = pokemon.type.contains(moveB.element)
                    let statB = moveB.quickMovePercentage(baseAttack, stab: stabB)
                    return statA > statB
                }
                specialAttacks = pokemon.specialAttacks.sorted { attackA, attackB in
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
    
    var bestOptions: [AverageMon] = []
    
    func getKeysOfValue(_ damage: DamageType, pokemon: Pokemon) -> [ElementType] {
        var elements: [ElementType] = []
        for (key, value) in pokemon.vulnerabilitySet {
            if value == damage {
                elements.append(key)
            }
        }
        return elements.sorted { elementA, elementB in
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
        bestOptions = Pokemon.calculatePotentialTargetsFor(
            pokemon,
            quickAttack: quickAttacks[selectedQuickAttack],
            specialAttack: specialAttacks[selectedSpecialAttack]
        )
        let sections = IndexSet(integersIn: 3...4)
        collectionView?.reloadSections(sections)
        if let titleControl = Bundle.main.loadNibNamed("DetailTitleControl", owner: nil, options: nil)![0] as? DetailTitleControl {
            titleControl.configureTitleControl(pokemon, quickAttack: quickAttacks[selectedQuickAttack], specialAttack: specialAttacks[selectedSpecialAttack])
            navigationItem.titleView = titleControl
        }
    }
    
    override func viewDidLoad() {
        let quickMoveIndexPath = IndexPath(item: 0, section: 2)
        let chargeMoveIndexPath = IndexPath(item: 0, section: 3)
        collectionView(collectionView!, didSelectItemAt: quickMoveIndexPath)
        collectionView(collectionView!, didSelectItemAt: chargeMoveIndexPath)
        recalculateDirectCounters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? GymLeaderPokemonCounter,
            let counterPokemon = cell.typeResult?.opponent,
            let destination = segue.destination as? GymLeaderDetail {
            destination.pokemon = counterPokemon
            // pop to root
            destination.filterJump = filterJump
        } else if let cell = sender as? CounterOption,
            let averageMon = cell.averageMon,
            let destination = segue.destination as? GymLeaderDetail {
            destination.pokemon = averageMon.opponent
            // pop to root
            destination.filterJump = filterJump
        }
    }
    
}

extension GymLeaderDetail {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return quickAttacks.count
        case 2:
            return specialAttacks.count
        case 3:
            return directCounters.count
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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let detailTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderDetailTypeCell", for: indexPath) as! GymLeaderDetailTypeCell
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderDetailHeader", for: indexPath) as! GymLeaderDetailHeader
            cell.configureCell(pokemon!.type)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderDetailQuickMoveCell", for: indexPath) as! GymLeaderDetailQuickMoveCell
            let cellSelected = (indexPath as NSIndexPath).row == selectedQuickAttack
            cell.configureCell(quickAttacks[(indexPath as NSIndexPath).row], pokemon: pokemon!, cellSelected: cellSelected)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderDetailQuickMoveCell", for: indexPath) as! GymLeaderDetailQuickMoveCell
            let cellSelected = (indexPath as NSIndexPath).row == selectedSpecialAttack
            cell.configureCellSpecial(specialAttacks[(indexPath as NSIndexPath).row], pokemon: pokemon!, cellSelected: cellSelected)
            return cell
        case 3:
            let selectedItem = directCounters[(indexPath as NSIndexPath).row]
            let pokemonCounterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderPokemonCounter", for: indexPath) as! GymLeaderPokemonCounter
            pokemonCounterCell.configureCell(selectedItem)
            return pokemonCounterCell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GymLeaderDetailStatCell", for: indexPath) as! GymLeaderDetailStatCell
            switch (indexPath as NSIndexPath).row {
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
            detailTypeCell.configureCell(double[(indexPath as NSIndexPath).row])
        case 6:
            detailTypeCell.configureCell(half[(indexPath as NSIndexPath).row])
        default:
            break
        }
        return detailTypeCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GymLeaderDetailSectionHeader", for: indexPath) as! GymLeaderDetailSectionHeader
        if let pokemon = pokemon {
            let pokemonName = NSLocalizedString(pokemon.species.rawValue, comment: "")
            var text = ""
            switch (indexPath as NSIndexPath).section {
            case 0:
                text = "\(NSLocalizedString("Type", comment: "")):"
            case 1:
                text = "\(NSLocalizedString("QUICK_MOVES", comment: "")):"
            case 2:
                text = "\(NSLocalizedString("SPECIAL_MOVES", comment: "")):"
            case 3:
                text = "\(NSLocalizedString("RECOMMENDED_AGAINST", comment: "")):"
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellsPerRow:CGFloat = 4
        switch (indexPath as NSIndexPath).section {
        case 0, 1, 2, 3, 4:
            cellsPerRow = 3
        default:
            break
        }
        let cellPadding:CGFloat = 10
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        // subtracting 1, because on the 6+ it's off by 1
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch (indexPath as NSIndexPath).section {
        case 1, 2:
            // move sets
            return CGSize(width: eachSide, height:eachSide + 58)
        default:
            return CGSize(width: eachSide, height:eachSide)            
        }
    }

}

extension GymLeaderDetail {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var moveElement: ElementType? = nil
        switch (indexPath as NSIndexPath).section {
        case 0:
            if let pokemon = pokemon {
                let elements = pokemon.type
                filterJump?.setFilters(elements)
            }
        case 1:
            selectedQuickAttack = (indexPath as NSIndexPath).row
            recalculateDirectCounters()
            for (index, _) in quickAttacks.enumerated() {
                let otherIndexPath = IndexPath(row: index, section: (indexPath as NSIndexPath).section)
                if let cell = collectionView.cellForItem(at: otherIndexPath) as? GymLeaderDetailQuickMoveCell {
                    cell.changeSelection(false, element: nil)
                }
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? GymLeaderDetailQuickMoveCell {
                let selectedElement = QuickMove.moveForQuickAttack(quickAttacks[selectedQuickAttack]).element
                cell.changeSelection(true, element: selectedElement)
            }
        case 2:
            selectedSpecialAttack = (indexPath as NSIndexPath).row
            recalculateDirectCounters()
            for (index, _) in specialAttacks.enumerated() {
                let otherIndexPath = IndexPath(row: index, section: (indexPath as NSIndexPath).section)
                if let cell = collectionView.cellForItem(at: otherIndexPath) as? GymLeaderDetailQuickMoveCell {
                    cell.changeSelection(false, element: nil)
                }
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? GymLeaderDetailQuickMoveCell {
                let selectedElement = SpecialMove.moveForSpecialAttack(specialAttacks[selectedSpecialAttack]).element
                cell.changeSelection(true, element: selectedElement)
            }
        case 5:
            moveElement = double[(indexPath as NSIndexPath).row]
        case 6:
            moveElement = half[(indexPath as NSIndexPath).row]
        default:
            return
        }
        if let moveElement = moveElement {
            filterJump?.setMoveFilter(moveElement)
        }
    }
    
}
