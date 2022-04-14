//
//  SettingTableViewController.swift
//  Settings
//
//  Created by Bo Kim on 4/14/22.
//  Copyright © 2022 Karl Pfister. All rights reserved.
//

import UIKit
// TableviewController to display our Setting objects
class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We want the number of cells to match the number of 'Setting' objects in our 'Source of Truth'
        return SettingController.settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Type casting our tableView cell to be a 'SettingTableViewCell' and guarding against that failing. if it fails; we return an empty UITableViewCell initialized.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        // Declaring a constant named 'Setting', using the 'indexPath' that was passed into the 'cellForRow(at:)', we assign it to the value of the 'Setting' object that matches the row property of the 'indexPath'
        let setting = SettingController.settings[indexPath.row]
        // Setting the cells delegate to the 'TableViewController' I.E. Hiring the intern for the relationship
        
        cell.delegate = self
        // accessing the 'updateViews' method on our cell and passing in the 'setting' object we declaired above
        cell.updateViews(with: setting)
        
        return cell
    }
}
//Adopting the 'SettingCellDelegate' Protocol
extension SettingTableViewController: SettingCellDelegate {
    //Conforming to the Protocol
    func settingSwitchToggled(for cell: SettingTableViewCell) {
        // We asked our TBVC to be our delegate because it can tell us what the indexPath is for the cell that triggered this protocol method
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        // Find the ' setting' in the settings array that matche that 'indexPath'
        let setting = SettingController.settings[indexPath.row]
        // Tell the Model controller to toggled the 'isOn' change on the 'Setting'
        SettingController.toggleIsOn(for: setting)
        // Inform the cell it is now time to update
        cell.updateViews(with: setting)
    }
    
    
}
