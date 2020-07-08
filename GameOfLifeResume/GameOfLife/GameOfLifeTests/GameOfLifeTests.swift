//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by FRAGKISKOS KATSIMPAS on 07/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {

    func test_initial_state() {
        let randomBoard = [[0, 1, 0], [0, 0, 0], [1, 1 , 1]]
        let game = createGame(initialSeed: randomBoard)

        let board = game.getBoard()
        
        XCTAssertEqual(randomBoard, board)
    }
    
    func test_nextGeneration_cellIsAlive_0AliveNeighbours_theCellDies(){
        let initialSeed = [[0, 0, 0], [0, 1, 0], [0, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)

        game.nextGeneration()
        
        let expectedBoard = [[0, 0, 0], [0, 0, 0], [0, 0 , 0]]
        assertExpectedGameBoard(expectedBoard: expectedBoard, game: game)
    }
    
    func test_nextGeneration_cellIsAlive_1AliveNeighbours_theCellDies(){
        let initialSeed = [[0, 0, 0], [0, 1, 0], [1, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)

        game.nextGeneration()
        
        let expectedBoard = [[0, 0, 0], [0, 0, 0], [0, 0 , 0]]
        assertExpectedGameBoard(expectedBoard: expectedBoard, game: game)
    }

    func test_nextGeneration_cellIsAlive_2AliveNeighbours_theCellRemainAlive(){
        let initialSeed = [[0, 0, 1], [0, 1, 0], [1, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)

        game.nextGeneration()
        
        let expectedBoard = [[0, 0, 0], [0, 1, 0], [0, 0 , 0]]
        assertExpectedGameBoard(expectedBoard: expectedBoard, game: game)
    }
    
    func test_nextGeneration_cellIsAlive_4AliveNeighbours_theCellDies(){
        let initialSeed = [[0, 1, 1], [1, 1, 0], [1, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)

        game.nextGeneration()
        
        let board = game.getBoard()
        XCTAssertEqual(0, board[1][1])
    }
    
    func test_nextGeneration_cellIsAlive_4OrMoreAliveNeighbours_theCellDies(){
        let initialSeed = [[1, 1, 1], [1, 1, 1], [1, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)

        game.nextGeneration()
        
        let board = game.getBoard()
        XCTAssertEqual(0, board[1][1])
    }
    
    func test_nextGeneration_cellIsDead_3AliveNeighbours_theCellBecomesAlive(){
        let initialSeed = [[0, 0, 1], [0, 0, 1], [1, 0 , 0]] // Our cell of interest is the (1,1)
        let game = createGame(initialSeed: initialSeed)
        
        game.nextGeneration()
        
        let board = game.getBoard()
        XCTAssertEqual(1, board[1][1])
    }
    
    func test_nextGeneration_callsSaveOnRestorable(){
        let mockRestorable = MockRestorable()
        let initialSeed = [[0, 0, 0], [0, 1, 0], [0, 0 , 0]] // Our cell of interest is the (1,1)
        let game = Game(board:initialSeed, restorable: mockRestorable)

        game.nextGeneration()

        XCTAssertEqual([[0, 0, 0], [0, 0, 0], [0, 0 , 0]] , mockRestorable.hasCalledSaveWithBoard)
    }
    
    private func createGame(initialSeed: [[Int]]) -> Game {
        return Game(board: initialSeed, restorable: MockRestorable())
    }

    private func assertExpectedGameBoard(expectedBoard: [[Int]], game: Game) {
        let board = game.getBoard()
        XCTAssertEqual(expectedBoard, board)
    }

}

