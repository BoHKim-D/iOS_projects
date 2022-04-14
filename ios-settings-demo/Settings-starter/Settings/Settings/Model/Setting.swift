//
//  File.swift
//  Settings
//
//  Created by Bo Kim on 4/14/22.
//  Copyright © 2022 Karl Pfister. All rights reserved.
//

import UIKit

/**
 creates our Setting Object - 'Model'
 -Properties :
    -name: the 'String' identifier for the Setting
    -icon: The 'UIImage' that matches the Setting
    -isOn: The 'Bool' the designate whether the settings is on or not
 */

class Setting {
    let name: String
    let icon: UIImage
    var isOn: Bool
    
    init(name: String, icon: UIImage, isOn: Bool) {
        self.name = name
        self.icon = icon
        self.isOn = isOn
    }
}
