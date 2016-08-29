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
    
    var pidgeyCount = 20
    var pidgeyCandy = 200
    var rattataCount = 10
    var rattataCandy = 250
    var transfer = true {
        didSet {
            refreshUI()
        }
    }

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
    
    func calculateEvolves(monCount: Int, candyCount: Int, candiesToEvolve: Int) -> (Int, Int) {
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
        return (evolveTally, candyTally)
    }
    
    func refreshUI(){
        var evolves = 0
        var remaining = 0
        switch pidgeyRat{
        case .pidgey:
            monStepper.value = Double(pidgeyCount)
            candyStepper.value = Double(pidgeyCandy)
            monCount?.text = "\(Int(pidgeyCount))"
            candyCount?.text = "\(Int(pidgeyCandy))"
            (evolves, remaining) = calculateEvolves(pidgeyCount, candyCount: pidgeyCandy, candiesToEvolve: 12)
        case .rattata:
            monStepper.value = Double(rattataCount)
            candyStepper.value = Double(rattataCandy)
            monCount?.text = "\(Int(rattataCount))"
            candyCount?.text = "\(Int(rattataCandy))"
            (evolves, remaining) = calculateEvolves(rattataCount, candyCount: rattataCandy, candiesToEvolve: 25)
        }
        evolutionCount?.text = "\(Int(evolves))"
        leftoverCount?.text = "\(Int(remaining))"
    }
    
    @IBOutlet weak var transferSwitch: UISwitch!
    
    @IBAction func transferSwitchChanged(sender: UISwitch) {
        transfer = sender.on
    }
    
    override func viewDidAppear(animated: Bool) {
        refreshUI()
    }
    
    func switchMon(){
        pidgeyRat = (pidgeyRat == .pidgey) ? .rattata : .pidgey
    }
    
    @IBAction func candyToggle(sender: UIButton) {
        switchMon()
        refreshUI()
    }
    
    @IBAction func togglePidgeyRat(sender: UIButton) {
        switchMon()
        refreshUI()
    }
    
    @IBOutlet weak var leftoverCount: UILabel!
    @IBOutlet weak var evolutionCount: UILabel!
    @IBOutlet weak var leftovers: UILabel!
    @IBOutlet weak var evolutions: UILabel!
    @IBOutlet weak var candyButton: UIButton!

    @IBOutlet weak var pidgeyRatButton: UIButton!
    
    @IBOutlet weak var monCount: UILabel!
    @IBOutlet weak var candyCount: UILabel!

    @IBOutlet weak var monStepper: UIStepper!
    @IBOutlet weak var candyStepper: UIStepper!

    @IBAction func monStepperChanged(sender: UIStepper) {
        switch pidgeyRat {
        case .pidgey:
            pidgeyCount = Int(sender.value)
        case .rattata:
            rattataCount = Int(sender.value)
        }
        refreshUI()
    }
    @IBAction func candyStepperChanged(sender: UIStepper) {
        switch pidgeyRat {
        case .pidgey:
            pidgeyCandy = Int(sender.value)
        case .rattata:
            rattataCandy = Int(sender.value)
        }
        refreshUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSizeMake(0, 250)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
