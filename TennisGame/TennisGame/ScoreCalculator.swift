//
//  ScoreCalculator.swift
//  TennisGame
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class ScoreCalculator {
    
    private var score = (0,0)
    private let kMinimumWinningScoreDifference : Int = 2

    enum GameState {
        case inProgress(score: (Int, Int))
        case playerOneWin(score: (Int, Int))
        case playerTwoWin(score: (Int, Int))
    }
    
    func getState() -> GameState {
        if hasPlayerOneWon() {
            return .playerOneWin(score: score)
        } else if hasPlayerTwoWon() {
            return .playerTwoWin(score: score)
        }
        return .inProgress(score: score)
    }

    private func hasPlayerOneWon() -> Bool {
        return score.0 >= 4 && score.0 - score.1 >= kMinimumWinningScoreDifference
    }

    private func hasPlayerTwoWon() -> Bool {
        return score.1 >= 4 && score.1 - score.0 >= kMinimumWinningScoreDifference
    }

    func playerOneScores() {
        score = (score.0 + 1, score.1)
    }
    
    func playerTwoScores() {
        score = (score.0, score.1 + 1)
    }
}




