//
//  ClockTests.swift
//  SleepingRulesTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import SleepingRules

class ClockTests: XCTestCase {
    
    func test_timeToHoursAndMinutes_timeIs0500_returns12HoursAnd0Minutes() {
        let clock = TestableClock()
        clock.hours = 5
        clock.minutes = 0
        
        let hoursAndMinutes = clock.timeToHoursAndMinutes()
        
        XCTAssertEqual(5, hoursAndMinutes.hours)
        XCTAssertEqual(0, hoursAndMinutes.minutes)
    }
    
    func test_timeToHoursAndMinutes_timeIs1745_returns17HoursAnd45Minutes() {
        let clock = TestableClock()
        clock.hours = 17
        clock.minutes = 45
        
        let hoursAndMinutes = clock.timeToHoursAndMinutes()
        
        XCTAssertEqual(17, hoursAndMinutes.hours)
        XCTAssertEqual(45, hoursAndMinutes.minutes)
    }
    
    func test_timeToHoursAndMinutes_timeIs0000_returns0HoursAnd0Minutes() {
        let clock = TestableClock()
        clock.hours = 0
        clock.minutes = 0
        
        let hoursAndMinutes = clock.timeToHoursAndMinutes()
        
        XCTAssertEqual(0, hoursAndMinutes.hours)
        XCTAssertEqual(0, hoursAndMinutes.minutes)
    }

}

