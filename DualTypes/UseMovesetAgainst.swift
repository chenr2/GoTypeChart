//
//  UseMovesetAgainst.swift
//  DualTypes
//
//  Created by Robert Chen on 3/3/17.
//  Copyright © 2017 Robert Chen. All rights reserved.
//

import UIKit

class UseMovesetAgainst: UITableViewController {
    
    var dodging: Dodge = .none

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true){}
    }
    
    @IBAction func toggleDodging(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dodging = .none
        case 1:
            dodging = .charge
        case 2:
            dodging = .both
        default:
            break
        }
        recalculateBestOptions()
    }
    
    var quickAttack: QuickAttack? = nil
    var specialAttack: SpecialAttack? = nil
    var pokemon: Pokemon? = nil 

    var bestOptions: [AverageMon] = []

    func recalculateBestOptions(){
        if let pokemon = pokemon,
            let quickAttack = quickAttack,
            let specialAttack = specialAttack {
                bestOptions = Pokemon.calculatePotentialTargetsFor(
                    pokemon,
                    quickAttack: quickAttack,
                    specialAttack: specialAttack,
                    dodging: dodging
                )
                tableView.reloadData()
        }

    }

    override func viewDidLoad() {
        recalculateBestOptions()
        if let pokemon = pokemon,
            let quickAttack = quickAttack,
            let specialAttack = specialAttack {
            if let titleControl = Bundle.main.loadNibNamed("DetailTitleControl", owner: nil, options: nil)![0] as? DetailTitleControl {
                titleControl.configureTitleControl(
                    pokemon,
                    quickAttack: quickAttack,
                    specialAttack: specialAttack
                )
                navigationItem.titleView = titleControl
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return bestOptions.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UseMovesetAgainstDodgeCell") as! UseMovesetAgainstDodgeCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            let option = bestOptions[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = NSLocalizedString(option.opponent.species.rawValue, comment: "")
            cell.detailTextLabel?.text = String(format: "%.1f", (-1 * option.average))
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Average advantage against defender"
        } else {
            return "Dodging"
        }
    }
    
}

