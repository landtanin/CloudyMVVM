//
//  SettingsViewUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 23/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
    
    var viewModelUnderTest: SettingsViewUnitsViewModel!
    
    override func setUp() {
        super.setUp()
 
    }
    
    override func tearDown() {
        super.tearDown()
        // reset UserDefaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
    func testText_Imperial() {
        
        // given
        let unitsNotation: UnitsNotation = .imperial
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "Imperial")
        
    }
    
    func testText_Metric() {
        
        // given
        let unitsNotation: UnitsNotation = .metric
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.text, "Metric")
        
    }
 
    func testAccessoryType_Imperial_Imperial() {
        
        // given
        // setup UserDefaults
        let defaultUnitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(defaultUnitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        // setup inputUnitsNotation
        let inputUnitsNotation: UnitsNotation = .imperial
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: inputUnitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
    func testAccessoryType_Imperial_Metric() {
        
        // given
        // setup UserDefaults
        let defaultUnitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(defaultUnitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        // setup inputUnitsNotation
        let inputUnitsNotation: UnitsNotation = .metric
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: inputUnitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_Metric_Imperial() {
        
        // given
        // setup UserDefaults
        let defaultUnitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(defaultUnitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        // setup inputUnitsNotation
        let inputUnitsNotation: UnitsNotation = .imperial
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: inputUnitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.none)
        
    }
    
    func testAccessoryType_Metric_Metric() {
        
        // given
        // setup UserDefaults
        let defaultUnitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(defaultUnitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        // setup inputUnitsNotation
        let inputUnitsNotation: UnitsNotation = .metric
        
        // when
        viewModelUnderTest = SettingsViewUnitsViewModel(unitsNotation: inputUnitsNotation)
        
        // then
        XCTAssertEqual(viewModelUnderTest.accessoryType, UITableViewCellAccessoryType.checkmark)
        
    }
    
}
