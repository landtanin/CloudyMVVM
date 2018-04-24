//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Tanin on 24/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {
    
    var viewModel: WeekViewViewModel!
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
    }
    
    override func tearDown() {
        super.tearDown()
    }
  
    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testNumberOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }
    
    func testViewModelForIndex() {
        
        // given
//        let expectedViewModel: WeatherDayViewViewModel = WeatherDayViewViewModel(weatherDayData: viewModel.weatherData[0])
        
        // when
        let weatherDayViewViewModel = viewModel.viewModel(for: 0)
        
        XCTAssertEqual(weatherDayViewViewModel.day, "Monday")
        XCTAssertEqual(weatherDayViewViewModel.date, "July 10")
        
    }
    
}
