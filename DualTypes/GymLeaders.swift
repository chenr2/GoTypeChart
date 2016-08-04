//
//  GymLeaders.swift
//  DualTypes
//
//  Created by Robert Chen on 8/3/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class GymLeaders: UICollectionViewController {
    let gymLeadersArray = Pokemon.gymLeaders()
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
