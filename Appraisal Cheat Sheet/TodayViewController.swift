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
    case Instinct = 0, Valor, Mystic
}

enum IV: Int {
    case A = 0, B, C, D
}

enum Stat: Int {
    case A = 0, B, C, D
}

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let teamKey = "teamSegment"
    let ivKey = "ivSegment"
    let statKey = "statSegment"
    
    var team: Team = .Instinct
    var iv: IV = .A
    var stat: Stat = .A

    @IBOutlet weak var teamSegment: UISegmentedControl!
    
    @IBOutlet weak var ivSegment: UISegmentedControl!
    
    @IBOutlet weak var statSegment: UISegmentedControl!
    
    @IBOutlet weak var ivPercentage: UILabel!

    @IBOutlet weak var statFraction: UILabel!
    
    @IBAction func teamSegmentSelected(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            team = .Instinct
        case 1:
            team = .Valor
        case 2:
            team = .Mystic
        default:
            break
        }
        refreshSegmentNames()
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.setInteger(index, forKey: teamKey)
        defaults?.synchronize()
    }
    
    func refreshSegmentNames(){
        for index in 0...3 {
            let title = messageForIV(team, iv: IV.init(rawValue: index)!)
            ivSegment.setTitle(title, forSegmentAtIndex: index)
            let statTitle = messageForStat(team, stat: Stat.init(rawValue: index)!)
            statSegment.setTitle(statTitle, forSegmentAtIndex: index)
        }
        for v in ivSegment.subviews {
            v.layoutSubviews()
        }
        for v in statSegment.subviews {
            v.layoutSubviews()
        }
        teamSegment.tintColor = colorForTeam(team)
        ivSegment.tintColor = colorForTeam(team)
        statSegment.tintColor = colorForTeam(team)
        teamSegment.backgroundColor = backgroundColorForTeam(team)
        ivSegment.backgroundColor = backgroundColorForTeam(team)
        statSegment.backgroundColor = backgroundColorForTeam(team)
    }
    
    @IBAction func ivSegmentSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        ivPercentage?.text = valueForIV(IV.init(rawValue: selectedIndex)!)
        iv = IV.init(rawValue: selectedIndex)!
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.setInteger(selectedIndex, forKey: ivKey)
        defaults?.synchronize()
    }
    
    @IBAction func statSegmentSelected(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        statFraction?.text = valueForStat(Stat.init(rawValue: selectedIndex)!)
        stat = Stat.init(rawValue: selectedIndex)!
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.setInteger(selectedIndex, forKey: statKey)
        defaults?.synchronize()
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
    
    func messageForIV(team: Team, iv: IV) -> String {
        switch (team, iv) {
        case (.Instinct, .A):
            return "Battle with the best"
        case (.Instinct, .B):
            return "Really strong"
        case (.Instinct, .C):
            return "Pretty decent"
        case (.Instinct, .D):
            return "Room for improvement"
        case (.Valor, .A):
            return "Accomplish anything"
        case (.Valor, .B):
            return "Should be proud"
        case (.Valor, .C):
            return "Decent Pokemon"
        case (.Valor, .D):
            return "Not great in battle"
        case (.Mystic, .A):
            return "Wonder, breath taking"
        case (.Mystic, .B):
            return "Caught my attention"
        case (.Mystic, .C):
            return "Above average"
        case (.Mystic, .D):
            return "Not much headway"
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
            return "Best ever seen"
        case (.Instinct, .B):
            return "Strong, impressive"
        case (.Instinct, .C):
            return "Good stats"
        case (.Instinct, .D):
            return "Kinda basic"
        case (.Valor, .A):
            return "Excellent, exciting"
        case (.Valor, .B):
            return "Blown away, WOW"
        case (.Valor, .C):
            return "Get the job done"
        case (.Valor, .D):
            return "Don't point to greatness"
        case (.Mystic, .A):
            return "Exceed, incredible"
        case (.Mystic, .B):
            return "Impressed by stats"
        case (.Mystic, .C):
            return "Trending positive"
        case (.Mystic, .D):
            return "Not out of norm"
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
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        if let teamIndex = defaults?.integerForKey(teamKey),
            let teamEnumValue = Team.init(rawValue: teamIndex) {
            team = teamEnumValue
            teamSegment.selectedSegmentIndex = teamIndex
        }
        if let ivIndex = defaults?.integerForKey(ivKey),
            let ivEnumValue = IV.init(rawValue: ivIndex) {
            iv = ivEnumValue
            ivSegment.selectedSegmentIndex = ivIndex
        }
        if let statIndex = defaults?.integerForKey(statKey),
            let statEnumValue = Stat.init(rawValue: statIndex) {
            stat = statEnumValue
            statSegment.selectedSegmentIndex = statIndex
        }
        refreshSegmentNames()
        ivPercentage?.text = valueForIV(iv)
        statFraction?.text = valueForStat(stat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearanceWhenContainedInInstancesOfClasses([UISegmentedControl.self]).numberOfLines = 0
        preferredContentSize = CGSizeMake(0, 200)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
