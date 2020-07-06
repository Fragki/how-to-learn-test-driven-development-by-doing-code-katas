//
//  FizzBuzzThrowCalculator.swift
//  FizzBuzzThrowCalculator
//
//  Created by FRAGKISKOS KATSIMPAS on 05/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class FizzBuzzThrowCalculator {
    
    enum FizzBuzzError: Error, Equatable {
        case fizzError
        case buzzError
        case fizzBuzzError
    }
    
    func fizzBuzz(number: Int) throws -> String {
        if isDivisibleBy(numerator: number, denominator: 3) && isDivisibleBy(numerator: number, denominator: 5) {
            throw FizzBuzzError.fizzBuzzError
        } else if isDivisibleBy(numerator: number, denominator: 3) {
            throw FizzBuzzError.fizzError
        } else if isDivisibleBy(numerator: number, denominator: 5) {
            throw FizzBuzzError.buzzError
        }
        return "\(number)"
    }
    
    func isDivisibleBy(numerator: Int, denominator: Int) -> Bool {
        return numerator % denominator == 0
    }

}
