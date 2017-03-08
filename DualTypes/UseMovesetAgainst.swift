//
//  UseMovesetAgainst.swift
//  DualTypes
//
//  Created by Robert Chen on 3/3/17.
//  Copyright © 2017 Robert Chen. All rights reserved.
//

import UIKit

class UseMovesetAgainst: UITableViewController {
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true){}
    }
    
    var quickAttack: QuickAttack? = nil
    var specialAttack: SpecialAttack? = nil
    var pokemon: Pokemon? = nil 

    var bestOptions: [AverageMon] = []

    override func viewDidLoad() {
        if let pokemon = pokemon,
            let quickAttack = quickAttack,
            let specialAttack = specialAttack {
            bestOptions = Pokemon.calculatePotentialTargetsFor(
                pokemon,
                quickAttack: quickAttack,
                specialAttack: specialAttack,
                dodging: .both
            )
            tableView.reloadData()
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let option = bestOptions[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = NSLocalizedString(option.opponent.species.rawValue, comment: "")
        cell.detailTextLabel?.text = String(format: "%.1f", (-1 * option.average))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Average advantage against defender"
    }
    
}

