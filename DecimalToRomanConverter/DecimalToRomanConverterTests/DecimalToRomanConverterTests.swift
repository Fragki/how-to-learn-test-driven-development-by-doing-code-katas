//
//  DecimalToRomanConverterTests.swift
//  DecimalToRomanConverterTests
//
//  Created by FRAGKISKOS KATSIMPAS on 07/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import DecimalToRomanConverter

class DecimalToRomanConverterTests: XCTestCase {

    func test_convert_1_toI() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(1)
        
        XCTAssertEqual("I", result)
    }
    
    func test_convert_2_toII() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(2)
        
        XCTAssertEqual("II", result)
    }
    
    func test_convert_3_toIII() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(3)
        
        XCTAssertEqual("III", result)
    }
    
    func test_convert_4_toIV() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(4)
        
        XCTAssertEqual("IV", result)
    }
    
    func test_convert_5_toV() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(5)
        
        XCTAssertEqual("V", result)
    }
    
    func test_convert_6_toVI() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(6)
        
        XCTAssertEqual("VI", result)
    }


    func test_convert_9_toIX() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(9)
        
        XCTAssertEqual("IX", result)
    }
    
    func test_convert_10_toX() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(10)
        
        XCTAssertEqual("X", result)
    }

    func test_convert_13_toXIII() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(13)
        
        XCTAssertEqual("XIII", result)
    }
    
    func test_convert_14_toXIV() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(14)
        
        XCTAssertEqual("XIV", result)
    }
    
    func test_convert_20_toXX() {
        let converter = DecimalToRomanConverter()
        
        let result = converter.convert(20)
        
        XCTAssertEqual("XX", result)
    }
}



