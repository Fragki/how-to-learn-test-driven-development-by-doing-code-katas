//
//  Clock.swift
//  SleepingRules
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class Clock {

    func timeToHoursAndMinutes() -> (hours: Int, minutes: Int) {
        let hours = Calendar.current.component(.hour, from: now())
        let minutes = Calendar.current.component(.minute, from: now())

        return (hours, minutes)
    }

    func now() -> Date {
        return  Date()
    }
}
