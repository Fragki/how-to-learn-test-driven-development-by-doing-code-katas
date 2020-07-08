//
//  TestableClock.swift
//  SleepingRulesTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation
@testable import SleepingRules

class TestableClock: Clock {
    
    var hours: Int = 0
    var minutes: Int = 0
    
    override func now() -> Date{
        return makeDate(hours: hours, minutes: minutes)
    }
    
    private func makeDate(hours: Int, minutes: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(hour: hours, minute: minutes)
        return calendar.date(from: components)!
    }
}
