//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 24/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {
    
    var viewModel: DayViewViewModel!
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        viewModel = DayViewViewModel(weatherData: weatherData)
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    func testDate() {
        
        // given
        let expectedDate = "Tue, July 11"
        
        // when
        let date = viewModel.date
        
        // then
        XCTAssertEqual(date, expectedDate)
    }

    func testTime_TwelveHour() {
        
        // given
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let expectedTime = "12:57 PM"
        
        // when
        let time = viewModel.time
        
        // then
        XCTAssertEqual(time, expectedTime)
    }
    
    func testTime_TwentyFourHour() {
        
        // given
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let expectedTime = "12:57"
        
        // when
        let time = viewModel.time
        
        // then
        XCTAssertEqual(time, expectedTime)
    }
    
    func testSummary() {
        
        XCTAssertEqual(viewModel.summary, "Clear")
        
    }
    
    func testTemperature_Fahrenheit() {
        
        // given
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let expectedTemp = "44.5 F"
        
        // when
        let temp = viewModel.temperature
        
        // then
        XCTAssertEqual(temp, expectedTemp)
        
    }
    
    func testTemperature_Celsius() {
        
        // given
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let expectedTemp = "6.9 C"
        
        // when
        let temp = viewModel.temperature
        
        // then
        XCTAssertEqual(temp, expectedTemp)
        
    }
    
    func testWindSpeed_MPH() {
        
        // given
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let expectedWindSpeed = "6 MPH"
        
        // when
        let windSpeed = viewModel.windSpeed
        
        // then
        XCTAssertEqual(windSpeed, expectedWindSpeed)
        
    }
    
    func testWindSpeed_KPH() {
        
        // given
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let expectedWindSpeed = "10 KPH"
        
        // when
        let windSpeed = viewModel.windSpeed
        
        // then
        XCTAssertEqual(windSpeed, expectedWindSpeed)
        
    }

    func testImage() {
        
        // given
        let expectedImageData = UIImagePNGRepresentation(UIImage(named: "clear-day")!)!
        
        // when
        let viewModelImage = viewModel.image
        let viewModelImageData = UIImagePNGRepresentation(viewModelImage!)!
        
        // then
        XCTAssertNotNil(viewModelImage) // because it returns an optional UIImage value, when we unwrap it, it might be nil
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 236.0)
        XCTAssertEqual(viewModelImageData, expectedImageData)
        
    }
    
}
