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
            actionButtonClose.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func closeModal(_ sender: AnyObject) {
        dismiss(animated: true){}
    }
    
    @IBAction func changeToIndex(_ sender: AnyObject) {
        changeSortType?.setSortType(.Leaders)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToAlphabetical(_ sender: AnyObject) {
        changeSortType?.setSortType(.Alphabetical)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToAttack(_ sender: AnyObject) {
        changeSortType?.setSortType(.Attack)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToDefense(_ sender: AnyObject) {
        changeSortType?.setSortType(.Defense)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToStamina(_ sender: AnyObject) {
        changeSortType?.setSortType(.Stamina)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToType(_ sender: AnyObject) {
        changeSortType?.setSortType(.ElementType)
        dismiss(animated: true){}
    }
    
    @IBAction func changeToMoveType(_ sender: AnyObject) {
        changeSortType?.setSortType(.MoveType)
        dismiss(animated: true){}        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}
