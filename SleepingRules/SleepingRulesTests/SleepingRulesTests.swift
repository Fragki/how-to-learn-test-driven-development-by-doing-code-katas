//
//  SleepingRulesTests.swift
//  SleepingRulesTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import SleepingRules

class SleepingRulesTests: XCTestCase {

    func test_isBedTime_time2259_returnsFalse() {
        let clock = TestableClock()
        clock.hours = 22
        clock.minutes = 59
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertFalse(isBedTime)
    }
    
    func test_isBedTime_time2300_returnsTrue() {
        let clock = TestableClock()
        clock.hours = 23
        clock.minutes = 00
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertTrue(isBedTime)
    }
    
    func test_isBedTime_time23001_returnsTrue() {
        let clock = TestableClock()
        clock.hours = 23
        clock.minutes = 01
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertTrue(isBedTime)
    }
    
    func test_isBedTime_time0433_returnsTrue() {
        let clock = TestableClock()
        clock.hours = 4
        clock.minutes = 33
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertTrue(isBedTime)
    }

    func test_isBedTime_time0659_returnsTrue() {
        let clock = TestableClock()
        clock.hours = 6
        clock.minutes = 59
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertTrue(isBedTime)
    }
    
    func test_isBedTime_time0700_returnsFalse() {
        let clock = TestableClock()
        clock.hours = 7
        clock.minutes = 0
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertFalse(isBedTime)
    }


    func test_isBedTime_time0701_returnsFalse() {
        let clock = TestableClock()
        clock.hours = 7
        clock.minutes = 1
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertFalse(isBedTime)
    }

    func test_isBedTime_time1705_returnsFalse() {
        let clock = TestableClock()
        clock.hours = 17
        clock.minutes = 5
        let sleepingRules = SleepingRules(clock: clock)
        
        let isBedTime = sleepingRules.isBedTime()
        
        XCTAssertFalse(isBedTime)
    }

}



