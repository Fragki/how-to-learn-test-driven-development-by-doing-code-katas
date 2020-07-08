//
//  TennisGameTests.swift
//  TennisGameTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import TennisGame

class TennisGameTests: XCTestCase {

    func test_score_0_0() {
        let game = createGame()
        
        let scoreAnnouncement = game.getScoreAnnouncement()
        XCTAssertEqual("love all", scoreAnnouncement)
    }
    
    func test_score_1_0() {
        let game = createGame()

        game.playerOneScores()
        
        let scoreAnnouncement = game.getScoreAnnouncement()
        XCTAssertEqual("fifteen love", scoreAnnouncement)
    }

    private func createGame() -> TennisGame {
        let scoreCalculator = ScoreCalculator()
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        return TennisGame(scoreCalculator: scoreCalculator, announcement: announcement)
    }
}
