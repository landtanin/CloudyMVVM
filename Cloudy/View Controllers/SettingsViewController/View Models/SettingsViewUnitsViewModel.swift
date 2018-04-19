//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Tanin on 19/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {
    
    // model of the ViewModel
    let unitsNotation: UnitsNotation
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
    var text: String {
        switch unitsNotation {
        case .imperial:
            return "Imperial"
        case .metric:
            return "Metric"
        }
    }
}

// only to make it explicit, it's empty as we have already declare the two required variables
extension  SettingsViewUnitsViewModel: SettingsRepresentable {
    
}

