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
    func tappedPokemon(_ pokemon: Pokemon)
}

protocol ChangeSortType {
    func setSortType(_ sortType: SortType)
}

protocol FilterJump {
    func setFilters(_ elements: [ElementType])
    func setMoveFilter(_ element: ElementType)
}

enum SortType: String {
    case Attack, Defense, Stamina, Leaders, Alphabetical = "A-Z", ElementType, MoveType = "Move"
}



class GymLeaders: UICollectionViewController {
    
    @IBAction func switchTabs(_ sender: AnyObject) {
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
    
    var sortType:SortType = .Leaders {
        didSet {
            containerEventRelay?.detectActionMenuChange(sortType)
            resetMonsSortedBySelectedType()
            collectionView?.reloadData()
        }
    }
    
    var resultSearchController:UISearchController? = nil
    
    func calculateCP(_ pokemon: Pokemon) -> Int {
        let cp = sqrt(CGFloat(pokemon.stamina)) * CGFloat(pokemon.attack) * sqrt(CGFloat(pokemon.defense))
        return Int(cp)
    }
    
    func sortByCP(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return calculateCP(pokemonA) > calculateCP(pokemonB)
    }
    
    func sortAlphabetically(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return NSLocalizedString(pokemonA.species.rawValue, comment: "").lowercased() < NSLocalizedString(pokemonB.species.rawValue, comment: "").lowercased()
    }
    
    func sortByIndex(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.pokedex < pokemonB.pokedex
    }

    func sortByAttack(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.attack > pokemonB.attack
    }

    func sortByDefense(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.defense > pokemonB.defense
    }

    func sortByStamina(_ pokemonA: Pokemon, pokemonB: Pokemon) -> Bool {
        return pokemonA.stamina > pokemonB.stamina
    }
    
    func resetSearch(){
        helperElements = ElementType.allValues
        moveHelperElements = ElementType.allValues
        elementFilters = []
        moveElementFilters = []
        searchResultsSet = PokemonCollections.allPokemon().sorted(by: sortAlphabetically)
        moveSearchResultsSet = PokemonCollections.allPokemon().sorted(by: sortByAttack)
        collectionView?.reloadData()
    }
    
    func resetMonsSortedBySelectedType(){
        gymLeadersArray = PokemonCollections.allPokemon()
        switch sortType {
        case .Leaders:
            let gymArray = gymLeadersArray.sorted(by: sortByCP)
            gymLeadersArray = Array(gymArray.prefix(21))
        case .Alphabetical:
            gymLeadersArray = gymLeadersArray.sorted(by: sortAlphabetically)
        case .Attack:
            gymLeadersArray = gymLeadersArray.sorted(by: sortByAttack)
        case .Defense:
            gymLeadersArray = gymLeadersArray.sorted(by: sortByDefense)
        case .Stamina:
            gymLeadersArray = gymLeadersArray.sorted(by: sortByStamina)
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
            return moveElementFilterTypes.isSubset(of: allMoveTypes)
        }.sorted(by: sortByAttack)
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
            return elementFilterTypes.isSubset(of: pokemonType)
        }.sorted(by: sortAlphabetically)
        collectionView?.reloadData()
    }
    

    
    override func viewDidLoad() {
        locationManager.requestWhenInUseAuthorization() 
        resetSearch()
        resetMonsSortedBySelectedType()
        
        let searchOverlayTable = storyboard!.instantiateViewController(withIdentifier: "SearchOverlayTable") as! SearchOverlayTable
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
        resultSearchController?.searchBar.autocapitalizationType = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let resultSearchController = resultSearchController , resultSearchController.isActive {
            // don't show the action button
        } else {
            containerEventRelay?.toggleActionButtonVisibility(true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        containerEventRelay?.toggleActionButtonVisibility(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GymLeaderDetail,
            let pokemon = sender as? Pokemon
            , segue.identifier == "pushPokemonDetail" {
            destination.pokemon = pokemon
            destination.filterJump = self
        }
        if let destination = segue.destination as? GymLeaderDetail,
            let cell = sender as? GridCell {
            destination.pokemon = cell.pokemon
            destination.filterJump = self
        }
        if let destination = segue.destination as? MenuModal {
            destination.changeSortType = self 
        }
    }
    
    @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt sizeForItemAtIndexPath: IndexPath) -> CGSize {
        let cellsPerRow:CGFloat = 3
        let height: CGFloat = 48
        let cellPadding:CGFloat = 5
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = (widthMinusPadding / cellsPerRow) - 1
        switch sortType {
        case .Leaders, .Alphabetical:
            return CGSize(width: eachSide, height:70)
        case .ElementType:
            switch (sizeForItemAtIndexPath as NSIndexPath).section {
            case 0, 1:
                return CGSize(width: eachSide, height: height)
            default:
                return CGSize(width: eachSide, height: 90)
            }
        case .MoveType:
            switch (sizeForItemAtIndexPath as NSIndexPath).section {
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
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch sortType {
        case .ElementType, .MoveType:
            return 3
        default:
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sortType {
        case .ElementType:
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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sortType {
        case .Attack, .Defense, .Stamina:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCell", for: indexPath) as! StatCell
            cell.configureCell(gymLeadersArray[(indexPath as NSIndexPath).row], sortType: sortType)
            return cell
        case .Alphabetical:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlphabeticalCell", for: indexPath) as! AlphabeticalCell
            cell.configureCell(gymLeadersArray[(indexPath as NSIndexPath).row], sortType: sortType)
            return cell
        case .Leaders:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlphabeticalCell", for: indexPath) as! AlphabeticalCell
            cell.configureCell(gymLeadersArray[(indexPath as NSIndexPath).row], sortType: sortType)
            return cell
        case .ElementType:
            switch (indexPath as NSIndexPath).section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "elementCell", for: indexPath) as! SearchElementCell
                let element = elementFilters[(indexPath as NSIndexPath).row]
                cell.configureCell(element, isFilter: true)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "elementCell", for: indexPath) as! SearchElementCell
                let element = helperElements[(indexPath as NSIndexPath).row]
                cell.configureCell(element, isFilter: false)
                return cell
            default:
                let selectedPokemon = searchResultsSet[(indexPath as NSIndexPath).row]
                if selectedPokemon.type.count == 2 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultDualCell", for: indexPath) as! SearchResultDualCell
                    
                    cell.configureCell(selectedPokemon)
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCell", for: indexPath) as! SearchResultCell
                    cell.configureCell(selectedPokemon)
                    return cell
                }
            }
        case .MoveType:
            switch (indexPath as NSIndexPath).section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "elementCell", for: indexPath) as! SearchElementCell
                let element = moveElementFilters[(indexPath as NSIndexPath).row]
                cell.configureCell(element, isFilter: true)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "elementCell", for: indexPath) as! SearchElementCell
                let element = moveHelperElements[(indexPath as NSIndexPath).row]
                cell.configureCell(element, isFilter: false)
                return cell
            default:
                let selectedPokemon = moveSearchResultsSet[(indexPath as NSIndexPath).row]
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoveTypeCell", for: indexPath) as! MoveTypeCell
                cell.configureCell(selectedPokemon)
                return cell
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sortType {
        case .ElementType:
            switch (indexPath as NSIndexPath).section {
            case 0:
                elementFilters.remove(at: (indexPath as NSIndexPath).row)
                recalculateFilters()
            case 1:
                let selectedItem = helperElements[(indexPath as NSIndexPath).row]
                elementFilters.append(selectedItem)
                recalculateFilters()
            default:
                let selectedPokemon = searchResultsSet[(indexPath as NSIndexPath).row]
                tappedPokemon(selectedPokemon)
                break
            }
        case .MoveType:
            switch (indexPath as NSIndexPath).section {
            case 0:
                moveElementFilters.remove(at: (indexPath as NSIndexPath).row)
                recalculateMoveFilters()
            case 1:
                let selectedItem = moveHelperElements[(indexPath as NSIndexPath).row]
                moveElementFilters.append(selectedItem)
                recalculateMoveFilters()
            default:
                let selectedPokemon = moveSearchResultsSet[(indexPath as NSIndexPath).row]
                tappedPokemon(selectedPokemon)
                break
            }
        default:
            break
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SearchResultSectionHeader", for: indexPath) as! SearchResultSectionHeader
            var text = ""
            switch (indexPath as NSIndexPath).section {
            case 0:
                text = NSLocalizedString("FILTERING_ON_THESE_TYPES", comment: "Filtering on these types").uppercased()
            case 0, 1:
                text = NSLocalizedString("CHOOSE_FROM_THESE_TYPES", comment: "Choose from these types").uppercased()
            default:
                text = NSLocalizedString("FILTER_RESULTS", comment: "Filter results").uppercased()
            }
            cell.configureCell(text)
            return cell
        default:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
        }
    }
}

extension GymLeaders: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch sortType {
        case .ElementType:
            switch section {
            case 0:
                if elementFilters.isEmpty {
                    return CGSize.zero
                }
            case 1:
                if helperElements.isEmpty {
                    return CGSize.zero
                }
            default:
                break
            }
            return CGSize(width: 0, height: 40)
        case .MoveType:
            switch section {
            case 0:
                if moveElementFilters.isEmpty {
                    return CGSize.zero
                }
            case 1:
                if moveHelperElements.isEmpty {
                    return CGSize.zero
                }
            default:
                break
            }
            return CGSize(width: 0, height: 40)
        default:
            break
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerSize = CGSize(width: 0, height: 100)
        switch sortType {
        case .ElementType, .MoveType:
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
        return CGSize.zero
    }
}

extension GymLeaders: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        containerEventRelay?.toggleActionButtonVisibility(true)
    }

}

extension GymLeaders: UISearchControllerDelegate {
    // search bar selection shows elements
    func didPresentSearchController(_ searchController: UISearchController) {
        if let searchResultsController = searchController.searchResultsController as? SearchOverlayTable {
            searchResultsController.view.isHidden = false
            containerEventRelay?.toggleActionButtonVisibility(false)
        }
    }
}

extension GymLeaders: ModifySearchTextDelegate {
    func tappedPokemon(_ pokemon: Pokemon){
        performSegue(withIdentifier: "pushPokemonDetail", sender: pokemon)
    }
}

extension GymLeaders: ChangeSortType {
    func setSortType(_ sortType: SortType){
        self.sortType = sortType
    }
}

extension GymLeaders: FilterJump {
    func setFilters(_ elements: [ElementType]){
        navigationController?.popToRootViewController(animated: true)
        resultSearchController?.isActive = false
        elementFilters = elements
        sortType = .ElementType
        recalculateFilters()
        // scroll to top
        collectionView?.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func setMoveFilter(_ element: ElementType){
        navigationController?.popToRootViewController(animated: true)
        resultSearchController?.isActive = false
        moveElementFilters = [element]
        sortType = .MoveType
        recalculateMoveFilters()
        // scroll to top
        collectionView?.setContentOffset(CGPoint.zero, animated: true)
    }
}
