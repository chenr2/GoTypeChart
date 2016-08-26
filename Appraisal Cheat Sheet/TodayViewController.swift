//
//  TodayViewController.swift
//  Appraisal Cheat Sheet
//
//  Created by Robert Chen on 8/25/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit
import NotificationCenter

enum Team: Int {
    case Mystic = 0, Valor, Instinct
}

enum IV: Int {
    case A = 0, B, C, D
}

enum Stat: Int {
    case A = 0, B, C, D
}

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var teamSegment: UISegmentedControl!
    
    @IBOutlet weak var ivSegment: UISegmentedControl! 
    
    @IBOutlet weak var statSegment: UISegmentedControl!
    
    @IBOutlet weak var ivPercentage: UILabel!

    @IBOutlet weak var statFraction: UILabel!
    
    @IBAction func teamSegmentSelected(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            team = .Instinct
        case 1:
            team = .Valor
        case 2:
            team = .Mystic
        default:
            break
        }
        teamSegment.tintColor = colorForTeam(team)
        ivSegment.tintColor = colorForTeam(team)
        statSegment.tintColor = colorForTeam(team)
        teamSegment.backgroundColor = backgroundColorForTeam(team)
        ivSegment.backgroundColor = backgroundColorForTeam(team)
        statSegment.backgroundColor = backgroundColorForTeam(team)
        refreshSegmentNames()
    }
    
    func refreshSegmentNames(){
        for index in 0...3 {
            let title = messageForIV(team, iv: IV.init(rawValue: index)!)
            ivSegment.setTitle(title, forSegmentAtIndex: index)
            let statTitle = messageForStat(team, stat: Stat.init(rawValue: index)!)
            statSegment.setTitle(statTitle, forSegmentAtIndex: index)
        }
    }
    
    @IBAction func ivSegmentSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        ivPercentage?.text = valueForIV(IV.init(rawValue: selectedIndex)!)
    }
    
    
    @IBAction func statSegmentSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        statFraction?.text = valueForStat(Stat.init(rawValue: selectedIndex)!)
    }
    
    func colorForTeam(team: Team) -> UIColor {
        switch team {
        case .Mystic:
            return UIColor.init(red: 0.000, green: 0.467, blue: 0.945, alpha: 1)
        case .Valor:
            return UIColor.init(red: 0.969, green: 0.063, blue: 0.024, alpha: 1)
        case .Instinct:
            return UIColor.init(red: 0.984, green: 0.827, blue: 0, alpha: 1)
        }
    }
    
    func backgroundColorForTeam(team: Team) -> UIColor {
        switch team {
        case .Mystic:
            return UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9)
        case .Valor:
            return UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9)
        case .Instinct:
            return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }
    
    var team: Team = .Instinct
    
    func messageForIV(team: Team, iv: IV) -> String {
        switch (team, iv) {
        case (.Instinct, .A):
            return "Best"
        case (.Instinct, .B):
            return "Strong"
        case (.Instinct, .C):
            return "Decent"
        case (.Instinct, .D):
            return "Battling"
        case (.Valor, .A):
            return "Amazes"
        case (.Valor, .B):
            return "Proud"
        case (.Valor, .C):
            return "Decent"
        case (.Valor, .D):
            return "Like it"
        case (.Mystic, .A):
            return "Wonder"
        case (.Mystic, .B):
            return "Attention"
        case (.Mystic, .C):
            return "Average"
        case (.Mystic, .D):
            return "Headway"
        }
    }
    
    func valueForIV(iv: IV) -> String {
        switch iv {
        case .A:
            return "80-100%"
        case .B:
            return "67-79%"
        case .C:
            return "51-66%"
        case .D:
            return "0-50%"
        }
    }
    
    func messageForStat(team: Team, stat: Stat) -> String {
        switch (team, stat) {
        case (.Instinct, .A):
            return "Best ever"
        case (.Instinct, .B):
            return "Impressive"
        case (.Instinct, .C):
            return "Good"
        case (.Instinct, .D):
            return "Basic"
        case (.Valor, .A):
            return "Excellent"
        case (.Valor, .B):
            return "WOW"
        case (.Valor, .C):
            return "Job done"
        case (.Valor, .D):
            return "Battle"
        case (.Mystic, .A):
            return "Incredible"
        case (.Mystic, .B):
            return "Impressed"
        case (.Mystic, .C):
            return "Trending"
        case (.Mystic, .D):
            return "Norm"
        }
    }
    
    func valueForStat(stat: Stat) -> String {
        switch stat {
        case .A:
            return "15"
        case .B:
            return "13-14"
        case .C:
            return "8-12"
        case .D:
            return "0-7"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSizeMake(0, 175)
        refreshSegmentNames()
        ivPercentage?.text = valueForIV(IV.init(rawValue: 0)!)
        statFraction?.text = valueForStat(Stat.init(rawValue: 0)!)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
