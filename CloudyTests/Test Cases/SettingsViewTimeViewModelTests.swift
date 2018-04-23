//
//  SettingsViewTimeViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 23/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTimeViewModelTests: XCTestCase {
    
    var viewModelUnderTest: SettingsViewTimeViewModel!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        // reset UserDefaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        
    }
    
    func testText_TwelveHour(){

        // given
        let timeNotation: TimeNotation = TimeNotation.twelveHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: timeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "12 Hour")
        
    }
    
    func testText_TwentyFourHour() {
        
        // given
        let timeNotation: TimeNotation = TimeNotation.twentyFourHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: timeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "24 Hour")
        
    }
    
    func testAccessoryType_TwelveHour_TwelveHour() {
        
        // given
        // setup UserDefaults
        let defaultTimeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(defaultTimeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        // setup inputTimeNotation
        let inputTimeNotation: TimeNotation = .twelveHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: inputTimeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
    func testAccessoryType_TwentyFour_TwelveHour() {
        
        // given
        // setup UserDefaults
        let defaultTimeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(defaultTimeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        // setup inputTimeNotation
        let inputTimeNotation: TimeNotation = .twelveHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: inputTimeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_TwelveHour_TwentyFour() {
        
        // given
        // setup UserDefaults
        let defaultTimeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(defaultTimeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        // setup inputTimeNotation
        let inputTimeNotation: TimeNotation = .twentyFourHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: inputTimeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_TwentyFour_TwentyFour() {
        
        // given
        // setup UserDefaults
        let defaultTimeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(defaultTimeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        // setup inputTimeNotation
        let inputTimeNotation: TimeNotation = .twentyFourHour
        
        // when
        viewModelUnderTest = SettingsViewTimeViewModel(timeNotation: inputTimeNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
}
