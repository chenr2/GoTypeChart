//
//  MenuModal.swift
//  DualTypes
//
//  Created by Robert Chen on 8/15/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit

class MenuModal: UIViewController {
    
    var changeSortType: ChangeSortType? = nil
    
    @IBOutlet weak var actionButtonClose: UIButton! {
        didSet {
            actionButtonClose.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    
    @IBAction func closeModal(sender: AnyObject) {
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToIndex(sender: AnyObject) {
        changeSortType?.setSortType(.Index)
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToAlphabetical(sender: AnyObject) {
        changeSortType?.setSortType(.Alphabetical)
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToAttack(sender: AnyObject) {
        changeSortType?.setSortType(.Attack)
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToDefense(sender: AnyObject) {
        changeSortType?.setSortType(.Defense)
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToStamina(sender: AnyObject) {
        changeSortType?.setSortType(.Stamina)
        dismissViewControllerAnimated(true){}
    }
    
    @IBAction func changeToType(sender: AnyObject) {
        dismissViewControllerAnimated(true){
            self.changeSortType?.activateSearch()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
