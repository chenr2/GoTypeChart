//
//  PidgeyGrinderViewController.swift
//  PidgeyGrinder
//
//  Created by Robert Chen on 8/28/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit
import NotificationCenter

enum PidgeyRat: Int {
    case pidgey = 0, rattata
}

class PidgeyGrinderViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var leftoverCandy: UILabel!
    @IBOutlet weak var leftoverMons: UILabel!
    @IBOutlet weak var evolutionCount: UILabel!
    @IBOutlet weak var evolutions: UILabel!
    @IBOutlet weak var candyButton: UIButton!
    @IBOutlet weak var pidgeyRatButton: UIButton!
    @IBOutlet weak var monCount: UILabel!
    @IBOutlet weak var candyCount: UILabel!
    @IBOutlet weak var monStepper: UIStepper!
    @IBOutlet weak var candyStepper: UIStepper!
    @IBOutlet weak var transferSwitch: UISwitch!

    var pidgeyCount = 0
    var pidgeyCandy = 0
    var rattataCount = 0
    var rattataCandy = 0
    var transfer = true {
        didSet {
            refreshUI()
        }
    }
    
    let monTypeKey = "monTypeKey"
    let pidgeyCountKey = "pidgeyCountKey"
    let rattataCountKey = "rattataCountKey"
    let transferSwitchKey = "transferSwitchKey"
    let pidgeyCandyKey = "pidgeyCandy"
    let rattataCandyKey = "rattataCandyKey"

    let rattataPurple = UIColor(red: 0.663, green: 0.384, blue: 0.910, alpha: 1)
    let pidgeyYellow = UIColor(red: 0.976, green: 0.796, blue: 0.345, alpha: 1)
    
    var pidgeyRat: PidgeyRat = .pidgey {
        didSet {
            switch pidgeyRat {
            case .pidgey:
                pidgeyRatButton.setImage(UIImage(named: "pidgey"), forState: .Normal)
                monStepper.tintColor = pidgeyYellow
                candyStepper.tintColor = pidgeyYellow
                candyButton.setImage(UIImage(named: "pidgey-candy"), forState: .Normal)
            case .rattata:
                pidgeyRatButton.setImage(UIImage(named: "rattata"), forState: .Normal)
                monStepper.tintColor = rattataPurple
                candyStepper.tintColor = rattataPurple
                candyButton.setImage(UIImage(named: "rattata-candy"), forState: .Normal)
            }
        }
    }
    
    func calculateEvolves(monCount: Int, candyCount: Int, candiesToEvolve: Int) -> (Int, Int, Int) {
        var monTally = monCount
        var candyTally = candyCount
        var evolveTally = 0
        for _ in 0...monCount {
            if monTally > 0 && candyTally >= candiesToEvolve {
                monTally -= 1
                candyTally -= candiesToEvolve
                candyTally += 1
                if transfer {
                    candyTally += 1
                }
                evolveTally += 1
            }
        }
        return (evolveTally, candyTally, monTally)
    }
    
    func refreshUI(){
        var evolves = 0
        var remainingCandy = 0
        var remainingMons = 0
        transferSwitch.on = transfer 
        switch pidgeyRat{
        case .pidgey:
            monStepper.value = Double(pidgeyCount)
            candyStepper.value = Double(pidgeyCandy)
            monCount?.text = "\(Int(pidgeyCount))"
            candyCount?.text = "\(Int(pidgeyCandy))"
            (evolves, remainingCandy, remainingMons) = calculateEvolves(pidgeyCount, candyCount: pidgeyCandy, candiesToEvolve: 12)
        case .rattata:
            monStepper.value = Double(rattataCount)
            candyStepper.value = Double(rattataCandy)
            monCount?.text = "\(Int(rattataCount))"
            candyCount?.text = "\(Int(rattataCandy))"
            (evolves, remainingCandy, remainingMons) = calculateEvolves(rattataCount, candyCount: rattataCandy, candiesToEvolve: 25)
        }
        evolutionCount?.text = "\(Int(evolves))"
        leftoverCandy?.text = "\(Int(remainingCandy))"
        leftoverMons?.text = "\(Int(remainingMons))"
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        if let monTypeValue = defaults?.integerForKey(monTypeKey) {
            pidgeyRat = PidgeyRat(rawValue: monTypeValue)!
        }
        if let pidgeyCountValue = defaults?.integerForKey(pidgeyCountKey) {
            pidgeyCount = pidgeyCountValue
        }
        if let pidgeyCandyValue = defaults?.integerForKey(pidgeyCandyKey) {
            pidgeyCandy = pidgeyCandyValue
        }
        if let rattataCountValue = defaults?.integerForKey(rattataCountKey) {
            rattataCount = rattataCountValue
        }
        if let rattataCandyValue = defaults?.integerForKey(rattataCandyKey) {
            rattataCandy = rattataCandyValue
        }
        if let transferValue = defaults?.boolForKey(transferSwitchKey) {
            transfer = transferValue
        }
        refreshUI()
    }
    
    func switchMon(){
        pidgeyRat = (pidgeyRat == .pidgey) ? .rattata : .pidgey
        saveValue(pidgeyRat.rawValue, forKey: monTypeKey)
    }
    
    func saveValue(value: Int, forKey key: String){
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        defaults?.setInteger(value, forKey: key)
        defaults?.synchronize()
    }
    
    @IBAction func transferSwitchChanged(sender: UISwitch) {
        transfer = sender.on
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        defaults?.setBool(transfer, forKey: transferSwitchKey)
        defaults?.synchronize()
    }
    
    @IBAction func candyToggle(sender: UIButton) {
        switchMon()
        refreshUI()
    }
    
    @IBAction func togglePidgeyRat(sender: UIButton) {
        switchMon()
        refreshUI()
    }

    @IBAction func monStepperChanged(sender: UIStepper) {
        switch pidgeyRat {
        case .pidgey:
            pidgeyCount = Int(sender.value)
            saveValue(pidgeyCount, forKey: pidgeyCountKey)
        case .rattata:
            rattataCount = Int(sender.value)
            saveValue(rattataCount, forKey: rattataCountKey)
        }
        refreshUI()
    }
    
    @IBAction func candyStepperChanged(sender: UIStepper) {
        switch pidgeyRat {
        case .pidgey:
            pidgeyCandy = Int(sender.value)
            saveValue(pidgeyCandy, forKey: pidgeyCandyKey)
        case .rattata:
            rattataCandy = Int(sender.value)
            saveValue(rattataCandy, forKey: rattataCandyKey)
        }
        refreshUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSizeMake(0, 205)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.NewData)
    }
    
}
