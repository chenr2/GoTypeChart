//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaders: UICollectionViewController {
    var gymLeadersArray = Pokemon.gymLeaders()
    
    @IBAction func sortAlphabetically(sender: AnyObject) {
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.name.lowercaseString < pokemonB.name.lowercaseString
        }
        reloadSectionZero()
    }
    
    @IBAction func sortByIndex(sender: AnyObject) {
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyDualTypes(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.defense.count > 1
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlySTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.S
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyATier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.A
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    @IBAction func showOnlyBTier(sender: AnyObject) {
        gymLeadersArray = Pokemon.gymLeaders().filter {
            $0.tier == Tier.B
        }
        sortExistingArrayByIndex()
        reloadSectionZero()
    }
    
    func reloadSectionZero(){
        let sectionZero = NSIndexSet(index: 0)
        collectionView?.reloadSections(sectionZero)
    }
    
    func sortExistingArrayByIndex(){
        gymLeadersArray = gymLeadersArray.sort { pokemonA, pokemonB in
            return pokemonA.pokedex < pokemonB.pokedex
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? GymLeaderDetail,
            let cell = sender as? GymLeaderCell {
            destination.pokemon = cell.pokemon
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellPadding:CGFloat = 5
        let cellsPerRow:CGFloat = 3
        let widthMinusPadding = collectionView.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        return CGSize(width: eachSide, height:eachSide)
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setToolbarHidden(false, animated: true)
    }
}

extension GymLeaders {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gymLeadersArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GymLeaderCell", forIndexPath: indexPath) as! GymLeaderCell
        cell.pokemon = gymLeadersArray[indexPath.row]
        return cell
    }
}
