//
//  DecimalToRomanConverter.swift
//  DecimalToRomanConverter
//
//  Created by FRAGKISKOS KATSIMPAS on 07/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

struct DecimalToRomanConverter {
    
    private let decimalNumbersTable = [10, 9, 5, 4, 1]
    private let romanNumbersTable = ["X", "IX", "V", "IV", "I"]

    func convert(_ decimal: Int) -> String {
        var inputDecimal = decimal
        var roman = ""
        
        for i in 0..<decimalNumbersTable.count {
            while inputDecimal >= decimalNumbersTable[i] {
                roman = roman + romanNumbersTable[i]
                inputDecimal = inputDecimal - decimalNumbersTable[i]
            }
        }
        
        return roman
    }

}


