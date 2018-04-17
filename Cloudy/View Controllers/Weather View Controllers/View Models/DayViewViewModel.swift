//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by Tanin on 17/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

struct DayViewViewModel{
    
    let weatherData: WeatherData
    
    var date: String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEE, MMMM d"
        
        return dateFormatter.string(from: WeatherData.time)
        
    }
    
    var time: String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = ""
        
        return dateFormatter.string(from: weatherData.time)
        
    }
    
}
