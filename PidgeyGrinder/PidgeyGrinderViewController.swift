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
    
    @IBOutlet weak var beforeLabel: UILabel!
    @IBOutlet weak var firstXLabel: UILabel!
    @IBOutlet weak var secondXLabel: UILabel!
    @IBOutlet weak var evolvesLabel: UILabel!
    @IBOutlet weak var attributionLabel: UILabel!
    @IBOutlet weak var transferLabel: UILabel!
    @IBOutlet weak var afterLabel: UILabel!
    
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
    let darkGray = UIColor.darkGray

    var pidgeyRat: PidgeyRat = .pidgey {
        didSet {
            switch pidgeyRat {
            case .pidgey:
                pidgeyRatButton.setImage(UIImage(named: "pidgey"), for: UIControlState())
                if #available(iOS 10, *) {
                    monStepper.tintColor = darkGray
                    candyStepper.tintColor = darkGray
                } else {
                    monStepper.tintColor = pidgeyYellow
                    candyStepper.tintColor = pidgeyYellow
                }
                candyButton.setImage(UIImage(named: "pidgey-candy"), for: UIControlState())
            case .rattata:
                pidgeyRatButton.setImage(UIImage(named: "rattata"), for: UIControlState())
                monStepper.tintColor = rattataPurple
                candyStepper.tintColor = rattataPurple
                candyButton.setImage(UIImage(named: "rattata-candy"), for: UIControlState())
            }
        }
    }
    
    func calculateEvolves(_ monCount: Int, candyCount: Int, candiesToEvolve: Int) -> (Int, Int, Int) {
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
        transferSwitch.isOn = transfer 
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
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        if let monTypeValue = defaults?.integer(forKey: monTypeKey) {
            pidgeyRat = PidgeyRat(rawValue: monTypeValue)!
        }
        if let pidgeyCountValue = defaults?.integer(forKey: pidgeyCountKey) {
            pidgeyCount = pidgeyCountValue
        }
        if let pidgeyCandyValue = defaults?.integer(forKey: pidgeyCandyKey) {
            pidgeyCandy = pidgeyCandyValue
        }
        if let rattataCountValue = defaults?.integer(forKey: rattataCountKey) {
            rattataCount = rattataCountValue
        }
        if let rattataCandyValue = defaults?.integer(forKey: rattataCandyKey) {
            rattataCandy = rattataCandyValue
        }
        if let transferValue = defaults?.bool(forKey: transferSwitchKey) {
            transfer = transferValue
        }
        refreshUI()
    }
    
    func switchMon(){
        pidgeyRat = (pidgeyRat == .pidgey) ? .rattata : .pidgey
        saveValue(pidgeyRat.rawValue, forKey: monTypeKey)
    }
    
    func saveValue(_ value: Int, forKey key: String){
        let defaults = UserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }
    
    @IBAction func transferSwitchChanged(_ sender: UISwitch) {
        transfer = sender.isOn
        let defaults = UserDefaults(suiteName: "group.gotypechart.pidgeygrinder")
        defaults?.set(transfer, forKey: transferSwitchKey)
        defaults?.synchronize()
    }
    
    @IBAction func candyToggle(_ sender: UIButton) {
        switchMon()
        refreshUI()
    }
    
    @IBAction func togglePidgeyRat(_ sender: UIButton) {
        switchMon()
        refreshUI()
    }

    @IBAction func monStepperChanged(_ sender: UIStepper) {
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
    
    @IBAction func candyStepperChanged(_ sender: UIStepper) {
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
        preferredContentSize = CGSize(width: 0, height: 205)
        if #available(iOS 10, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 10, *) {
            evolutionCount.textColor = darkGray
            evolutions.textColor = darkGray
            monCount.textColor = darkGray
            candyCount.textColor = darkGray
            
            beforeLabel.textColor = darkGray
            firstXLabel.textColor = darkGray
            secondXLabel.textColor = darkGray
            evolvesLabel.textColor = darkGray
            attributionLabel.textColor = darkGray
            transferLabel.textColor = darkGray
            transferSwitch.tintColor = darkGray
            let darkGreen = UIColor(colorLiteralRed: 0.255, green: 0.459, blue: 0.020, alpha: 1)
            afterLabel.textColor = darkGreen
            leftoverCandy.textColor = darkGreen
            leftoverMons.textColor = darkGreen
        }
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        preferredContentSize = (activeDisplayMode == .compact) ? maxSize : CGSize(width: 0, height: 230)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
