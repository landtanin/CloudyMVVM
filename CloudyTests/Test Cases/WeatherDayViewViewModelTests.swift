//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 25/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase {
    
    var viewModel: WeatherDayViewViewModel!
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
        
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    func testDay() {
        
        XCTAssertEqual(viewModel.day, "Saturday")
        
    }
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "July 15")
    }
    
    func testTemperature_Fahrenheit() {
        
        // given
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "37 F - 47 F")
    }
    
    func testTemperature_Celcius() {
        
        // given
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "3 C - 8 C")
    }
    
    func testWindSpeed_MPH(){
        
        // given
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let expectedWindSpeed = "1 MPH"
        
        // when
        let windSpeed = viewModel.windSpeed
        
        // then
        XCTAssertEqual(windSpeed, expectedWindSpeed)
        
    }
    
    func testWindSpeed_KPH(){
        
        // given
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let expectedWindSpeed = "2 KPH"
        
        // when
        let windSpeed = viewModel.windSpeed
        
        // then
        XCTAssertEqual(windSpeed, expectedWindSpeed)
        
    }
    
    func testImage() {
        
        // given
        let expectedImageData = UIImagePNGRepresentation(UIImage(named: "cloudy")!)!

        // when
        let viewModelImage = viewModel.image
        let viewModelImageData = UIImagePNGRepresentation(viewModelImage!)!

        // then
        XCTAssertNotNil(viewModelImage) // because it returns an optional UIImage value, when we unwrap it, it might be nil
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(viewModelImageData, expectedImageData)
        
    }
    
}
