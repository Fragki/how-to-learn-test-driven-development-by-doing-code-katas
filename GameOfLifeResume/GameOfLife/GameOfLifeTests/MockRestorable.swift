//
//  MockRestorable.swift
//  GameOfLifeTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation
@testable import GameOfLife

class MockRestorable: Restorable {
    
    private(set) var hasCalledSaveWithBoard: [[Int]]?
    func save(board: [[Int]]) {
        hasCalledSaveWithBoard = board
    }
    
}
