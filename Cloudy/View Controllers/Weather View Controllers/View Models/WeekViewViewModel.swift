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
    
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewViewModel {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }
    
}
