//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Bo Kim on 4/14/22.
//  Copyright © 2022 Karl Pfister. All rights reserved.
//

import UIKit

/**
 The protocol we will use to handle the update of the cell when the 'settingSwitch' has been toggled
 - class: This protocol needs to interact with class level objects
 */
protocol SettingCellDelegate: class {
    //Step one : Declare Protocol
    // Protocol method
    func settingSwitchToggled(for cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    //Step two : create the delegate
    /**
     The delegate or * intern* for the protocol 'SettingCellDelegate'
     -wewak: We mark this method as weak to not craet a retain cycle
     -optional: We do not want to set the value of the delegate here
     */
    weak var delegate: SettingCellDelegate?
    
    func updateViews(with setting: Setting) {
        settingNameLabel.text = setting.name
        settingImageView.image = setting.icon
        settingSwitch.isOn = setting.isOn
        
        //Ternary Operator
        
        backgroundColor = setting.isOn ? .cyan : .white
        /*
        if setting.isOn == true {
            backgroundColor = .blue
        } else {
            backgroundColor = .white
        }
        */
    }
    
    //MARK: - Action
    
    @IBAction func settingSwitchToggle(_ sender: Any) {
        delegate?.settingSwitchToggled(for: self)
    }
}
