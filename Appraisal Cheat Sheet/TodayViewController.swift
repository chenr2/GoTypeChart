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
    case instinct = 0, valor, mystic
}

enum IV: Int {
    case a = 0, b, c, d
}

enum Stat: Int {
    case a = 0, b, c, d
}

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let teamKey = "teamSegment"
    let ivKey = "ivSegment"
    let statKey = "statSegment"
    
    var team: Team = .instinct
    var iv: IV = .a
    var stat: Stat = .a

    @IBOutlet weak var ivLabel: UILabel!
    @IBOutlet weak var topStatLabel: UILabel!
    @IBOutlet weak var teamSegment: UISegmentedControl!
    
    @IBOutlet weak var ivSegment: UISegmentedControl!
    
    @IBOutlet weak var statSegment: UISegmentedControl!
    
    @IBOutlet weak var ivPercentage: UILabel!

    @IBOutlet weak var statFraction: UILabel!
    
    @IBAction func teamSegmentSelected(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            team = .instinct
        case 1:
            team = .valor
        case 2:
            team = .mystic
        default:
            break
        }
        refreshSegmentNames()
        let defaults = UserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.set(index, forKey: teamKey)
        defaults?.synchronize()
    }
    
    func refreshSegmentNames(){
        for index in 0...3 {
            let title = messageForIV(team, iv: IV.init(rawValue: index)!)
            ivSegment.setTitle(title, forSegmentAt: index)
            let statTitle = messageForStat(team, stat: Stat.init(rawValue: index)!)
            statSegment.setTitle(statTitle, forSegmentAt: index)
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
    
    @IBAction func ivSegmentSelected(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        ivPercentage?.text = valueForIV(IV.init(rawValue: selectedIndex)!)
        iv = IV.init(rawValue: selectedIndex)!
        let defaults = UserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.set(selectedIndex, forKey: ivKey)
        defaults?.synchronize()
    }
    
    @IBAction func statSegmentSelected(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        statFraction?.text = valueForStat(Stat.init(rawValue: selectedIndex)!)
        stat = Stat.init(rawValue: selectedIndex)!
        let defaults = UserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        defaults?.set(selectedIndex, forKey: statKey)
        defaults?.synchronize()
    }
    
    func colorForTeam(_ team: Team) -> UIColor {
        switch team {
        case .mystic:
            return UIColor.init(red: 0.000, green: 0.467, blue: 0.945, alpha: 1)
        case .valor:
            return UIColor.init(red: 0.969, green: 0.063, blue: 0.024, alpha: 1)
        case .instinct:
            return UIColor.init(red: 0.984, green: 0.827, blue: 0, alpha: 1)
        }
    }
    
    func backgroundColorForTeam(_ team: Team) -> UIColor {
        switch team {
        case .mystic:
            return UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9)
        case .valor:
            return UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9)
        case .instinct:
            return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }
    
    func messageForIV(_ team: Team, iv: IV) -> String {
        switch (team, iv) {
        case (.instinct, .a):
            return NSLocalizedString("Instinct-IV-A", comment: "Battle with the best")
        case (.instinct, .b):
            return NSLocalizedString("Instinct-IV-B", comment: "Really strong")
        case (.instinct, .c):
            return NSLocalizedString("Instinct-IV-C", comment: "Pretty decent")
        case (.instinct, .d):
            return NSLocalizedString("Instinct-IV-D", comment: "Room for improvement")
        case (.valor, .a):
            return NSLocalizedString("Valor-IV-A", comment: "Accomplish anything")
        case (.valor, .b):
            return NSLocalizedString("Valor-IV-B", comment: "Should be proud")
        case (.valor, .c):
            return NSLocalizedString("Valor-IV-C", comment: "Decent Pokemon")
        case (.valor, .d):
            return NSLocalizedString("Valor-IV-D", comment: "Not great in battle")
        case (.mystic, .a):
            return NSLocalizedString("Mystic-IV-A", comment: "Wonder, breath taking")
        case (.mystic, .b):
            return NSLocalizedString("Mystic-IV-B", comment: "Caught my attention")
        case (.mystic, .c):
            return NSLocalizedString("Mystic-IV-C", comment: "Above average")
        case (.mystic, .d):
            return NSLocalizedString("Mystic-IV-D", comment: "Not much headway")
        }
    }
    
    func valueForIV(_ iv: IV) -> String {
        switch iv {
        case .a:
            return "82-100%"
        case .b:
            return "67-81%"
        case .c:
            return "51-66%"
        case .d:
            return "0-50%"
        }
    }
    
    func messageForStat(_ team: Team, stat: Stat) -> String {
        switch (team, stat) {
        case (.instinct, .a):
            return NSLocalizedString("Instinct-Stat-A", comment: "Best ever seen")
        case (.instinct, .b):
            return NSLocalizedString("Instinct-Stat-B", comment: "Strong, impressive")
        case (.instinct, .c):
            return NSLocalizedString("Instinct-Stat-C", comment: "Good stats")
        case (.instinct, .d):
            return NSLocalizedString("Instinct-Stat-D", comment: "Kinda basic")
        case (.valor, .a):
            return NSLocalizedString("Valor-Stat-A", comment: "Excellent stats")
        case (.valor, .b):
            return NSLocalizedString("Valor-Stat-B", comment: "Blown away, WOW")
        case (.valor, .c):
            return NSLocalizedString("Valor-Stat-C", comment: "Get the job done")
        case (.valor, .d):
            return NSLocalizedString("Valor-Stat-D", comment: "Don't point to greatness")
        case (.mystic, .a):
            return NSLocalizedString("Mystic-Stat-A", comment: "Exceed, incredible")
        case (.mystic, .b):
            return NSLocalizedString("Mystic-Stat-B", comment: "Impressed by stats")
        case (.mystic, .c):
            return NSLocalizedString("Mystic-Stat-C", comment: "Trending positive")
        case (.mystic, .d):
            return NSLocalizedString("Mystic-Stat-D", comment: "Not out of norm")
        }
    }
    
    func valueForStat(_ stat: Stat) -> String {
        switch stat {
        case .a:
            return "15"
        case .b:
            return "13-14"
        case .c:
            return "8-12"
        case .d:
            return "0-7"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults(suiteName: "group.gotypechart.appraisalcheatsheet")
        if let teamIndex = defaults?.integer(forKey: teamKey),
            let teamEnumValue = Team.init(rawValue: teamIndex) {
            team = teamEnumValue
            teamSegment.selectedSegmentIndex = teamIndex
        }
        if let ivIndex = defaults?.integer(forKey: ivKey),
            let ivEnumValue = IV.init(rawValue: ivIndex) {
            iv = ivEnumValue
            ivSegment.selectedSegmentIndex = ivIndex
        }
        if let statIndex = defaults?.integer(forKey: statKey),
            let statEnumValue = Stat.init(rawValue: statIndex) {
            stat = statEnumValue
            statSegment.selectedSegmentIndex = statIndex
        }
        refreshSegmentNames()
        ivPercentage?.text = valueForIV(iv)
        statFraction?.text = valueForStat(stat)
        if #available(iOS 10, *) {
            ivPercentage?.textColor = UIColor.darkGray
            statFraction?.textColor = UIColor.darkGray
            ivLabel?.textColor = UIColor.darkGray
            topStatLabel?.textColor = UIColor.darkGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        preferredContentSize = CGSize(width: 0, height: 230)
        if #available(iOS 10, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        preferredContentSize = (activeDisplayMode == .compact) ? maxSize : CGSize(width: 0, height: 250)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.newData)
    }
    
}
