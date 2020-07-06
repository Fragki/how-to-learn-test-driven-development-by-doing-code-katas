//
//  FizzBuzzThrowCalculatorTests.swift
//  FizzBuzzThrowCalculatorTests
//
//  Created by FRAGKISKOS KATSIMPAS on 05/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import FizzBuzzThrowCalculator

class FizzBuzzThrowCalculatorTests: XCTestCase {

    //MARK: fizzBuzz
    func test_fizzBuzz_whenInputIs1_returns1() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        let result = try? fizzBuzzCalculator.fizzBuzz(number: 1)
        
        XCTAssertEqual("1", result)
    }
    
    func test_fizzBuzz_whenInputIs2_returns2() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        let result = try? fizzBuzzCalculator.fizzBuzz(number: 2)
        
        XCTAssertEqual("2", result)
    }
    
    func test_fizzBuzz_whenInputIs4_returns4() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        let result = try? fizzBuzzCalculator.fizzBuzz(number: 4)
        
        XCTAssertEqual("4", result)
    }

    //MARK: fizzBuzz - Fizz
    func test_fizzBuzz_whenInputIs3_throwsFizzError() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(number: 3), throws: FizzBuzzThrowCalculator.FizzBuzzError.fizzError)
    }

    func test_fizzBuzz_whenInputIsMultipleOf3_throwsFizzError() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(number: anyIntAboveOne() * 3), throws: FizzBuzzThrowCalculator.FizzBuzzError.fizzError)
    }
    
    //MARK: fizzBuzz - Buzz
    func test_fizzBuzz_whenInputIs5_throwsBuzzError() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(number: 5), throws: FizzBuzzThrowCalculator.FizzBuzzError.buzzError)
    }

    func test_fizzBuzz_whenInputIsMultipleOf5_throwsBuzzError() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(number: anyIntAboveOne() * 5), throws: FizzBuzzThrowCalculator.FizzBuzzError.buzzError)
    }
    
    //MARK: fizzBuzz - FizzBuzz
    func test_fizzBuzz_whenInputIsMultipleOf3And5_throwsFizzBuzzError() {
        let fizzBuzzCalculator = FizzBuzzThrowCalculator()
        
        assertThrow(try fizzBuzzCalculator.fizzBuzz(number: 3 * 5), throws: FizzBuzzThrowCalculator.FizzBuzzError.fizzBuzzError)
    }

    
    private func anyIntAboveOne() -> Int {
        return 2
    }
    
}

extension XCTestCase { // https://www.swiftbysundell.com/posts/testing-error-code-paths-in-swift
    func assertThrow<T, E: Error & Equatable>(
        _ expression: @autoclosure () throws -> T,
        throws error: E,
        in file: StaticString = #file,
        line: UInt = #line
        ) {
        var thrownError: Error?
        
        XCTAssertThrowsError(try expression(),
                             file: file, line: line) {
                                thrownError = $0
        }
        
        XCTAssertTrue(
            thrownError is E,
            "Unexpected error type: \(type(of: thrownError))",
            file: file, line: line
        )
        
        XCTAssertEqual(
            thrownError as? E, error,
            file: file, line: line
        )
    }
}
