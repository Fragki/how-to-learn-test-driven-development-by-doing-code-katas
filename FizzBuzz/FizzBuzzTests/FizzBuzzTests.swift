//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by FRAGKISKOS KATSIMPAS on 04/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
import FizzBuzz

class FizzBuzzTests: XCTestCase {

    //MARK: fizzBuzz
    func test_fizzBuzz_whenInputIs1_returns1() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 1)
        
        XCTAssertEqual("1", result)
    }
    
    func test_fizzBuzz_whenInputIs2_returns2() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 2)
        
        XCTAssertEqual("2", result)
    }
    
    func test_fizzBuzz_whenInputIs4_returns4() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 4)
        
        XCTAssertEqual("4", result)
    }
    
    //MARK: fizzBuzz - Fizz
    func test_fizzBuzz_whenInputIs3_returnsFizz() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 3)
        
        XCTAssertEqual("Fizz", result)
    }
    
    func test_fizzBuzz_whenInputIsMultipleOf3_returnsFizz() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: anyIntAboveOne() * 3)
        
        XCTAssertEqual("Fizz", result)
        
    }

    //MARK: fizzBuzz - Buzz
    func test_fizzBuzz_whenInputIs5_returnsBuzz() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 5)
        
        XCTAssertEqual("Buzz", result)
    }
    
    func test_fizzBuzz_whenInputIsMultipleOf5_returnsBuzz() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: anyIntAboveOne() * 5)
        
        XCTAssertEqual("Buzz", result)
    }
    
    //MARK: fizzBuzz - FizzBuzz
    func test_fizzBuzz_whenInputIsMultipleOf3And5_returnsFizzBuzz() {
        let fizzBuzzCalculator = FizzBuzzCalculator()
        
        let result = fizzBuzzCalculator.fizzBuzz(number: 3 * 5)
        
        XCTAssertEqual("FizzBuzz", result)
    }

    //MARK: Private
    private func anyIntAboveOne() -> Int {
        return 2
    }
}
