//
//  SettingViewTimeViewModel.swift
//  Cloudy
//
//  Created by Tanin on 19/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {
    
    // model of the ViewModel
    let timeNotation: TimeNotation
    
    var text: String {
        switch timeNotation {
        case .twelveHour:
            return "12 Hour"
        case .twentyFourHour:
            return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.timeNotation() == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}

// only to make it explicit, it's empty as we have already declare the two required variables
extension SettingsViewUnitsViewModel: SettingsRepresentable {
    
}
