//
//  SettingController.swift
//  Settings
//
//  Created by Bo Kim on 4/14/22.
//  Copyright © 2022 Karl Pfister. All rights reserved.
//

import Foundation
// Our Models Controller Class
class SettingController {
    /**
     Source of truth
     
     We create a computed property named 'settings' and declared the type to be ab array of 'Setting' objects
     -Returns: The mock Setting Objects we created in an array
     */
    static let settings: [Setting] = {
        // Marked as static so we can access this array on a seperate file.
        let music = Setting(name: "Music", icon: #imageLiteral(resourceName: "iTunes"), isOn: false)
        let appStore = Setting(name: "Setting", icon: #imageLiteral(resourceName: "appStore"), isOn: false)
        let iBooks = Setting(name: "iBooks", icon: #imageLiteral(resourceName: "iBooks"), isOn: true)
        return [music, appStore, iBooks]
    }()
        /**
         Toggles the 'isOn' property on a 'Setting' object to the opposite state
         - Parameter:
            -setting: the Setting object we wish to change the 'isOn' of
         */
    static func toggleIsOn(for setting: Setting) {
        setting.isOn = !setting.isOn
    }
    
}
