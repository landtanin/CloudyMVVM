//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by Tanin on 20/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct WeatherDayViewViewModel {
    
    let weatherDayData: WeatherDayData
 
    private let dayFormatter = DateFormatter()

    var day: String {
        
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time)
        
    }
    
    var date: String {
        
        dayFormatter.dateFormat = "MMMM d"
        return dayFormatter.string(from: weatherDayData.time)
        
    }
    
    var temperature: String {
        
        let min = format(temperature: weatherDayData.temperatureMin)
        let max = format(temperature: weatherDayData.temperatureMax)
        
        return "\(min) - \(max)"
    }
    
    var windSpeed: String {
        
        let windSpeed = weatherDayData.windSpeed
        
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
        
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
    
    // MARK: - Helper Methods
    
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.0f F", temperature)
        case .celsius:
            return String(format: "%.0f C", temperature.toCelcius())
        }
        
    }
    
}

// only to make it explicit, it's empty as we have already declare the five required variables
extension WeatherDayViewViewModel: WeatherDayRepresentable {
    
}
