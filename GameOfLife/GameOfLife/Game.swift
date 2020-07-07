//
//  Game.swift
//  GameOfLife
//
//  Created by FRAGKISKOS KATSIMPAS on 07/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class Game {
    private var board: [[Int]]
    
    init(board: [[Int]]) {
        self.board = board
    }
    
    func getBoard() -> [[Int]] {
        return board
    }
    
    func nextGeneration() {
        var newBoard = board
        
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if isAlive(row: row, column: column, board: board) {
                    let living =  checkLivingNeighbours(row: row, column: column, board: board)
                    if living <= 1 || living >= 4 {
                        newBoard[row][column] = 0
                    }
                } else {
                    let living =  checkLivingNeighbours(row: row, column: column, board: board)
                    if living == 3 {
                        newBoard[row][column] = 1
                    }
                }
            }
        }
        
        board = newBoard
    }

    private func isAlive(row: Int, column: Int, board: [[Int]]) -> Bool {
        return board[row][column] == 1
    }
    
    private func isValidRow(_ row: Int, board: [[Int]]) -> Bool {
        return row >= 0 && row < board.count
    }

    private func isValidColumn(_ column: Int, board: [[Int]]) -> Bool {
        return column >= 0 && column < board[0].count
    }
    
    private func checkLivingNeighbours(row: Int, column: Int, board: [[Int]]) -> Int {
        
        var living = 0
        
        let pairs = [(row - 1, column),
                     (row - 1, column - 1),
                     (row - 1, column + 1),
                     (row + 1, column),
                     (row + 1, column - 1),
                     (row + 1, column + 1),
                     (row, column - 1),
                     (row, column + 1)]
        
        
        for (row, column) in pairs {
            if isValidRow(row,board: board) && isValidColumn(column, board: board) {
                living += board[row][column]
            }
        }
        
        return living
    }

}
