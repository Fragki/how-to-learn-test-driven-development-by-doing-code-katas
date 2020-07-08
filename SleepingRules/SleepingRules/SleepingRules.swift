//
//  SleepingRules.swift
//  SleepingRules
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class SleepingRules {
    
    private let clock: Clock
    
    init(clock: Clock) {
        self.clock = clock
    }
    
    func isBedTime() -> Bool {
        let hoursAndMinutes = clock.timeToHoursAndMinutes()
        if hoursAndMinutes.hours < 23 && hoursAndMinutes.hours >= 7 {
            return false
        }
        return true
    }
}


