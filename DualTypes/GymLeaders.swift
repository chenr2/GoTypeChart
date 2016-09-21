//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit
import CoreLocation

protocol ModifySearchTextDelegate {
    func tappedPokemon(pokemon: Pokemon)
}

protocol ChangeSortType {
    func setSortType(sortType: SortType)
}

protocol FilterJump {
    func setFilters(elements: [ElementType])
    func setMoveFilter(element: ElementType)
}

enum SortType: String {
    case Attack, Defense, Stamina, Index, Alphabetical = "A-Z", Type, MoveType = "Move"
}



class GymLeaders: UICollectionViewController {
    
    @IBAction func switchTabs(sender: AnyObject) {
        tabBarController?.selectedIndex = 1
    }
    
    let locationManager = CLLocationManager()

    var searchResultsSet: [Pokemon] = []

    var moveSearchResultsSet: [Pokemon] = []
    
    var helperElements: [ElementType] = []

    var moveHelperElements: [ElementType] = []
    
    var elementFilters: [ElementType] = []

    var moveElementFilters: [ElementType] = []

    var gymLeadersArray: [Pokemon] = []
    
    var containerEventRelay: ContainerEventRelay? = nil
    
    var sortType:SortType = .Type {
        didSet {
            containerEventRelay?.detectActionMenuChange(sortType)
            resetMonsSortedBySelectedType()
            collectionView?.reloadData()
        }
    }
    
    var resultSearchController:UISearchController? = nil
    
    func sortAlphabetically(pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return NSLocalizedString(pokemonA.species.rawValue, comment: "").lowercaseString < NSLocalizedString(pokemonB.species.rawValue, comment: "").lowercaseString
    }
    
    func sortByIndex(pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.pokedex < pokemonB.pokedex
    }

    func sortByAttack(pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.attack > pokemonB.attack
    }

    func sortByDefense(pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.defense > pokemonB.defense
    }

    func sortByStamina(pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.stamina > pokemonB.stamina
    }
    
    func resetSearch(){
        helperElements = ElementType.allValues
        moveHelperElements = ElementType.allValues
        elementFilters = []
        moveElementFilters = []
        searchResultsSet = PokemonCollections.allPokemon().sort(sortAlphabetically)
        moveSearchResultsSet = PokemonCollections.allPokemon().sort(sortByAttack)
        collectionView?.reloadData()
    }
    
    func sortExistingArrayByIndex(){
        gymLeadersArray = gymLeadersArray.sort(sortByIndex)
    }
    
    func resetMonsSortedBySelectedType(){
        gymLeadersArray = PokemonCollections.allPokemon()
        switch sortType {
        case .Index:
            sortExistingArrayByIndex()
        case .Alphabetical:
            gymLeadersArray = gymLeadersArray.sort(sortAlphabetically)
        case .Attack:
            gymLeadersArray = gymLeadersArray.sort(sortByAttack)
        case .Defense:
            gymLeadersArray = gymLeadersArray.sort(sortByDefense)
        case .Stamina:
            gymLeadersArray = gymLeadersArray.sort(sortByStamina)
        default:
            break
        }
    }
    
    func recalculateMoveFilters(){
        if moveElementFilters.isEmpty {
            moveHelperElements = ElementType.allValues
        } else {
            moveHelperElements = []
        }
        moveSearchResultsSet = PokemonCollections.allPokemon().filter { pokemon in
            let pokemonQuickMoveTypes: [ElementType] = pokemon.quickAttacks.map { quickAttack in
                return QuickMove.moveForQuickAttack(quickAttack).element
            }
            let pokemonSpecialMoveTypes: [ElementType] = pokemon.specialAttacks.map { specialAttack in
                return SpecialMove.moveForSpecialAttack(specialAttack).element
            }
            let allMoveTypes = Set(pokemonQuickMoveTypes + pokemonSpecialMoveTypes)
            let moveElementFilterTypes = Set(moveElementFilters)
            return moveElementFilterTypes.isSubsetOf(allMoveTypes)
        }.sort(sortByAttack)
        collectionView?.reloadData()
    }
    
    func recalculateFilters(){
        if elementFilters.isEmpty {
            helperElements = ElementType.allValues
        } else if elementFilters.count == 1 {
            // there's only one element, if there's a count of 1.
            let singleElement = elementFilters.first!
            // should show other element if it exists.
            // start with all pokemon.
            let dualTypePokemonOfThatElement = PokemonCollections.allPokemon().filter {
                $0.type.contains(singleElement)
            }.filter {
                // just those pokemon with 2 elements
                $0.type.count == 2
            }
            var otherElements: [ElementType] = []
            for dualType in dualTypePokemonOfThatElement {
                otherElements += dualType.type
            }
            var otherElementsSet = Set(otherElements)
            otherElementsSet.remove(singleElement)
            helperElements = Array(otherElementsSet)
        } else {
            // show nothing
            helperElements = []
        }
        searchResultsSet = PokemonCollections.allPokemon().filter { pokemon in
            let pokemonType = Set(pokemon.type)
            let elementFilterTypes = Set(elementFilters)
            return elementFilterTypes.isSubsetOf(pokemonType)
        }.sort(sortAlphabetically)
        collectionView?.reloadData()
    }
    

    
    override func viewDidLoad() {
        locationManager.requestWhenInUseAuthorization() 
        resetSearch()
        resetMonsSortedBySelectedType()
        
        let searchOverlayTable = storyboard!.instantiateViewControllerWithIdentifier(String(SearchOverlayTable)) as! SearchOverlayTable
        searchOverlayTable.modifySearchTextDelegate = self
        resultSearchController = UISearchController(searchResultsController: searchOverlayTable)
        resultSearchController?.searchResultsUpdater = searchOverlayTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = NSLocalizedString("ENTER_A_NAME", comment: "") 
        searchBar.delegate = self
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        resultSearchController?.delegate = self
        resultSearchController?.searchBar.enablesReturnKeyAutomatically = false
        resultSearchController?.searchBar.autocapitalizationType = .None
//        calculateTypeCounters()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let resultSearchController = resultSearchController where resultSearchController.active {
            // don't show the action button
        } else {
            containerEventRelay?.toggleActionButtonVisibility(true)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        containerEventRelay?.toggleActionButtonVisibility(false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let pokemon = sender as? Pokemon
            where segue.identifier == "pushPokemonDetail" {
            destination.pokemon = pokemon
            destination.filterJump = self
        }
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let cell = sender as? GridCell {
            destination.pokemon = cell.pokemon
            destination.filterJump = self
        }
        if let destination = segue.destinationViewController as? MenuModal {
            destination.changeSortType = self 
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellsPerRow:CGFloat = 3
        let height: CGFloat = 48
        let cellPadding:CGFloat = 5
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch sortType {
        case .Index, .Alphabetical:
            return CGSize(width: eachSide, height:70)
        case .Type:
            switch indexPath.section {
            case 0, 1:
                return CGSize(width: eachSide, height: height)
            default:
                return CGSize(width: eachSide, height: 90)
            }
        case .MoveType:
            switch indexPath.section {
            case 0, 1:
                return CGSize(width: eachSide, height: height)
            default:
                return CGSize(width: collectionView.bounds.width - 2 * cellPadding, height: 95)
            }
        default:
            return CGSize(width: eachSide, height:eachSide)
        }
    }
    
}

extension GymLeaders {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        switch sortType {
        case .Type, .MoveType:
            return 3
        default:
            return 1
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sortType {
        case .Type:
            switch section {
            case 0:
                return elementFilters.count
            case 1:
                return helperElements.count
            default:
                return searchResultsSet.count
            }
        case .MoveType:
            switch section {
            case 0:
                return moveElementFilters.count
            case 1:
                return moveHelperElements.count
            default:
                return moveSearchResultsSet.count
            }
        default:
            return gymLeadersArray.count
        }

    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch sortType {
        case .Attack, .Defense, .Stamina:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StatCell", forIndexPath: indexPath) as! StatCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        case .Alphabetical:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(AlphabeticalCell), forIndexPath: indexPath) as! AlphabeticalCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        case .Index:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(GymLeaderCell), forIndexPath: indexPath) as! GymLeaderCell
            cell.configureCell(gymLeadersArray[indexPath.row], sortType: sortType)
            return cell
        case .Type:
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
                let element = elementFilters[indexPath.row]
                cell.configureCell(element, isFilter: true)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
                let element = helperElements[indexPath.row]
                cell.configureCell(element, isFilter: false)
                return cell
            default:
                let selectedPokemon = searchResultsSet[indexPath.row]
                if selectedPokemon.type.count == 2 {
                    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(SearchResultDualCell), forIndexPath: indexPath) as! SearchResultDualCell
                    cell.configureCell(selectedPokemon)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(SearchResultCell), forIndexPath: indexPath) as! SearchResultCell
                    cell.configureCell(selectedPokemon)
                    return cell
                }
            }
        case .MoveType:
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
                let element = moveElementFilters[indexPath.row]
                cell.configureCell(element, isFilter: true)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("elementCell", forIndexPath: indexPath) as! SearchElementCell
                let element = moveHelperElements[indexPath.row]
                cell.configureCell(element, isFilter: false)
                return cell
            default:
                let selectedPokemon = moveSearchResultsSet[indexPath.row]
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(MoveTypeCell), forIndexPath: indexPath) as! MoveTypeCell
                cell.configureCell(selectedPokemon)
                return cell
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch sortType {
        case .Type:
            switch indexPath.section {
            case 0:
                elementFilters.removeAtIndex(indexPath.row)
                recalculateFilters()
            case 1:
                let selectedItem = helperElements[indexPath.row]
                elementFilters.append(selectedItem)
                recalculateFilters()
            default:
                let selectedPokemon = searchResultsSet[indexPath.row]
                tappedPokemon(selectedPokemon)
                break
            }
        case .MoveType:
            switch indexPath.section {
            case 0:
                moveElementFilters.removeAtIndex(indexPath.row)
                recalculateMoveFilters()
            case 1:
                let selectedItem = moveHelperElements[indexPath.row]
                moveElementFilters.append(selectedItem)
                recalculateMoveFilters()
            default:
                let selectedPokemon = moveSearchResultsSet[indexPath.row]
                tappedPokemon(selectedPokemon)
                break
            }
        default:
            break
        }
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: String(SearchResultSectionHeader), forIndexPath: indexPath) as! SearchResultSectionHeader
            var text = ""
            switch indexPath.section {
            case 0:
                text = NSLocalizedString("FILTERING_ON_THESE_TYPES", comment: "Filtering on these types").uppercaseString
            case 0, 1:
                text = NSLocalizedString("CHOOSE_FROM_THESE_TYPES", comment: "Choose from these types").uppercaseString
            default:
                text = NSLocalizedString("FILTER_RESULTS", comment: "Filter results").uppercaseString
            }
            cell.configureCell(text)
            return cell
        default:
            return collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", forIndexPath: indexPath)
        }
    }
}

extension GymLeaders: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch sortType {
        case .Type:
            switch section {
            case 0:
                if elementFilters.isEmpty {
                    return CGSizeZero
                }
            case 1:
                if helperElements.isEmpty {
                    return CGSizeZero
                }
            default:
                break
            }
            return CGSize(width: 0, height: 40)
        case .MoveType:
            switch section {
            case 0:
                if moveElementFilters.isEmpty {
                    return CGSizeZero
                }
            case 1:
                if moveHelperElements.isEmpty {
                    return CGSizeZero
                }
            default:
                break
            }
            return CGSize(width: 0, height: 40)
        default:
            break
        }
        return CGSizeZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize = CGSize(width: 0, height: 100)
        switch sortType {
        case .Type, .MoveType:
            switch section {
            case 2:
                return footerSize
            default:
                break
            }
        default:
            switch section {
            case 0:
                return footerSize
            default:
                break
            }
        }
        return CGSizeZero
    }
}

extension GymLeaders: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        containerEventRelay?.toggleActionButtonVisibility(true)
    }

}

extension GymLeaders: UISearchControllerDelegate {
    // search bar selection shows elements
    func didPresentSearchController(searchController: UISearchController) {
        if let searchResultsController = searchController.searchResultsController as? SearchOverlayTable {
            searchResultsController.view.hidden = false
            containerEventRelay?.toggleActionButtonVisibility(false)
        }
    }
}

extension GymLeaders: ModifySearchTextDelegate {
    func tappedPokemon(pokemon: Pokemon){
        performSegueWithIdentifier("pushPokemonDetail", sender: pokemon)
    }
}

extension GymLeaders: ChangeSortType {
    func setSortType(sortType: SortType){
        self.sortType = sortType
    }
}

extension GymLeaders: FilterJump {
    func setFilters(elements: [ElementType]){
        navigationController?.popToRootViewControllerAnimated(true)
        resultSearchController?.active = false
        elementFilters = elements
        sortType = .Type
        recalculateFilters()
        // scroll to top
        collectionView?.setContentOffset(CGPointZero, animated: true)
    }
    
    func setMoveFilter(element: ElementType){
        navigationController?.popToRootViewControllerAnimated(true)
        resultSearchController?.active = false
        moveElementFilters = [element]
        sortType = .MoveType
        recalculateMoveFilters()
        // scroll to top
        collectionView?.setContentOffset(CGPointZero, animated: true)
    }
}
