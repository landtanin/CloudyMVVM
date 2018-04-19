//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Tanin on 19/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//
import UIKit

struct SettingsViewTemperatureViewModel {
    
    // model of the ViewModel
    let temperatureNotation: TemperatureNotation
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
    var text: String {
        switch temperatureNotation {
        case .celsius:
            return "Celcius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

// only to make it explicit, it's empty as we have already declare the two required variables
extension SettingsViewTemperatureViewModel: SettingsRepresentable {
    
}
