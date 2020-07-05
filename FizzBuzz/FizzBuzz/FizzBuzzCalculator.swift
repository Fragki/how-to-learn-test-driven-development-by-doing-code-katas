//
//  FizzBuzzCalculator.swift
//  FizzBuzz
//
//  Created by FRAGKISKOS KATSIMPAS on 05/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

public struct FizzBuzzCalculator {
    
    public init() {
        
    }
    
    public func fizzBuzz(number: Int) -> String {
        if isDivisibleBy(numerator: number, denominator: 3) &&  isDivisibleBy(numerator: number, denominator: 5) {
            return "FizzBuzz"
        } else if isDivisibleBy(numerator: number, denominator: 5) {
            return "Buzz"
        } else if isDivisibleBy(numerator: number, denominator: 3) {
            return "Fizz"
        }
        return "\(number)"
    }

    private func isDivisibleBy(numerator: Int, denominator: Int) -> Bool {
        return numerator % denominator == 0
    }

}
