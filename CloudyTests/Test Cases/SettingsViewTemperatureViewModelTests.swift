//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 23/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTemperatureViewModelTests: XCTestCase {
    
    var viewModelUnderTest: SettingsViewTemperatureViewModel!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testText_Celsius() {
        
        // given
        let temperatureNotation: TemperatureNotation = .celsius
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "Celsius")
        
    }
    
    func testText_Fahrenheit() {
        
        // given
        let temperatureNotation: TemperatureNotation = .fahrenheit
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "Fahrenheit")
        
    }
    
    func testAccessoryType_Celsius_Celsius() {
        
        // given
        // setup UserDefaults
        let defaultTemperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(defaultTemperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        // setup inputTemperatureNotation
        let inputTemperatureNotation: TemperatureNotation = .celsius
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: inputTemperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
    func testAccessoryType_Celsius_Fahrenheit() {
        
        // given
        // setup UserDefaults
        let defaultTemperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(defaultTemperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        // setup inputTemperatureNotation
        let inputTemperatureNotation: TemperatureNotation = .fahrenheit
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: inputTemperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_Fahrenheit_Celsius() {
        
        // given
        // setup UserDefaults
        let defaultTemperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(defaultTemperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        // setup inputTemperatureNotation
        let inputTemperatureNotation: TemperatureNotation = .celsius
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: inputTemperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_Fahrenheit_Fahrenheit() {
        
        // given
        // setup UserDefaults
        let defaultTemperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(defaultTemperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        // setup inputTemperatureNotation
        let inputTemperatureNotation: TemperatureNotation = .fahrenheit
        
        // when
        viewModelUnderTest = SettingsViewTemperatureViewModel(temperatureNotation: inputTemperatureNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
}
