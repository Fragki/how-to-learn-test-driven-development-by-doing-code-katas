//
//  ScoreCalculatorTest.swift
//  TennisGameTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import TennisGame

class ScoreCalculatorTest: XCTestCase {

    func test_gameStarts_scoreIs0to0() {
        let scoreCalculator = ScoreCalculator()
        
        let state = scoreCalculator.getState()
        if case ScoreCalculator.GameState.inProgress(let score) = state {
            XCTAssertEqual(score.0, 0)
            XCTAssertEqual(score.1, 0)
        } else {
            XCTFail()
        }
    }
    
    func test_getState_playerOneScores() {
        let scoreCalculator = ScoreCalculator()
        
        scoreCalculator.playerOneScores()
        
        assertInprogressGameState(expected: (1,0), gameState: scoreCalculator.getState())
    }

    func test_getState_playerTwoScores() {
        let scoreCalculator = ScoreCalculator()
        
        scoreCalculator.playerTwoScores()
        
        assertInprogressGameState(expected: (0,1), gameState: scoreCalculator.getState())
    }
    
    func test_getState_playerOnePerfectGame() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((4,0), scoreCalculator: scoreCalculator)
        
        assertPlayerOneWin(expected: (4,0), gameState: scoreCalculator.getState())
    }

    func test_getState_playerOneScoresFourthPoint_scoreFifferenceLessThanTwo() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((4,3), scoreCalculator: scoreCalculator)
        
        assertInprogressGameState(expected: (4,3), gameState: scoreCalculator.getState())
    }
    
    func test_getState_playerTwoPerfectGame() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((0,4), scoreCalculator: scoreCalculator)
        
        assertPlayerTwoWin(expected: (0,4), gameState: scoreCalculator.getState())
    }

    func test_getState_playerTwoScoresFourthPoint_scoreDifferenceLessThanTwo() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((3,4), scoreCalculator: scoreCalculator)
        
        assertInprogressGameState(expected: (3,4), gameState: scoreCalculator.getState())
    }
    
    func test_getState_playerOneWinsLongGame() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((8,6), scoreCalculator: scoreCalculator)
        
        assertPlayerOneWin(expected: (8,6), gameState: scoreCalculator.getState())
    }
    
    func test_getState_playerTwoWinsLongGame() {
        let scoreCalculator = ScoreCalculator()
        
        createScore((17,19), scoreCalculator: scoreCalculator)
        
        assertPlayerTwoWin(expected: (17,19), gameState: scoreCalculator.getState())
    }

    private func assertPlayerTwoWin(expected: (Int, Int), gameState: ScoreCalculator.GameState) {
        if case ScoreCalculator.GameState.playerTwoWin(let score) = gameState {
            XCTAssertEqual(expected.0, score.0)
            XCTAssertEqual(expected.1, score.1)
        } else {
            XCTFail()
        }
    }
    
    private func assertPlayerOneWin(expected: (Int, Int), gameState: ScoreCalculator.GameState) {
        if case ScoreCalculator.GameState.playerOneWin(let score) = gameState {
            XCTAssertEqual(score.0, expected.0)
            XCTAssertEqual(score.1, expected.1)
        } else {
            XCTFail()
        }
    }

    private func assertInprogressGameState(expected: (Int, Int), gameState: ScoreCalculator.GameState) {
        if case ScoreCalculator.GameState.inProgress(let score) = gameState {
            XCTAssertEqual(expected.0, score.0)
            XCTAssertEqual(expected.1, score.1)
        } else {
            XCTFail()
        }
    }
    
    private func createScore(_ score: (Int, Int), scoreCalculator: ScoreCalculator) {
        for _ in 0..<score.0 { scoreCalculator.playerOneScores() }
        for _ in 0..<score.1 { scoreCalculator.playerTwoScores() }
    }

}

