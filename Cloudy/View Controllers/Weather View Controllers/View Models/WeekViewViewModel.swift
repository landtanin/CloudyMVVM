//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Tanin on 18/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewViewModel {
    
    let weatherData: [WeatherDayData]
    
    private let dayFormatter = DateFormatter()
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func day(for index: Int) -> String {
        
        let weatherDayData = weatherData[index]
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time)
        
    }
    
    func date(for index: Int) -> String {
        
        let weatherDayData = weatherData[index]
        dayFormatter.dateFormat = "MMMM d"
        return dayFormatter.string(from: weatherDayData.time)
        
    }
    
    func temperature(for index: Int) -> String {
        let weatherDayData = weatherData[index]
        
        let min = format(temperature: weatherDayData.temperatureMin)
        let max = format(temperature: weatherDayData.temperatureMax)
        
        return "\(min) - \(max)"
    }
    
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.0f F", temperature)
        case .celsius:
            return String(format: "%.0f C", temperature.toCelcius())
        }
        
    }
    
    func windSpedd(for index: Int) -> String {
        
        let weatherDayData = weatherData[index]
        let windSpeed = weatherDayData.windSpeed
        
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
        
    }
    
    func image(for index: Int) -> UIImage? {
        let weatherDayData = weatherData[index]
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
    
}
