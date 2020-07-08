//
//  Announcement.swift
//  TennisGame
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class Announcement {
    
    private let pointsToEnglish = [0 : "love", 1 : "fifteen", 2 : "thirty", 3: "forty"]
    private let scoreCalculator: ScoreCalculator
    private let kTieText = "all"
    private let kTieFortyText = "deuce"
    private let kPlayerTwoWinText = "playerTwo wins"
    private let kPlayerOneWinText = "playerOne wins"
    private let kPlayerOneAdvantageText = "playerOne advantage"
    private let kPlayerTwoAdvantageText = "playerTwo advantage"
    
    init(scoreCalculator: ScoreCalculator) {
        self.scoreCalculator = scoreCalculator
    }
    
    func getText() -> String? {
        switch scoreCalculator.getState() {
        case .inProgress(score: let gameScore):
            if hasPlayerOneAdvantage(score: gameScore) {
                return kPlayerOneAdvantageText
            }
            
            if hasPlayerTwoAdvantage(score: gameScore) {
                return kPlayerTwoAdvantageText
            }
            
            if gameScore.0 == gameScore.1 && gameScore.0 >= 3 {
                return kTieFortyText
            }
            
            guard let playerOneScore = pointsToEnglish[gameScore.0], let playerTwoScore = pointsToEnglish[gameScore.1] else {
                return nil
            }
            
            if gameScore.0 == gameScore.1 {
                return "\(playerOneScore)" + " " + kTieText
            } else {
                return "\(playerOneScore) \(playerTwoScore)"
            }
        case .playerOneWin:
            return kPlayerOneWinText
        case .playerTwoWin:
            return kPlayerTwoWinText
        }
    }
    
    private func hasPlayerTwoAdvantage(score: (Int, Int)) -> Bool {
        return score.1 - score.0 == 1 && score.1 > 4
    }
    
    private func hasPlayerOneAdvantage(score: (Int, Int)) -> Bool {
        return score.0 - score.1 == 1 && score.0 > 4
    }

}
