//
//  AnnouncementTests.swift
//  TennisGameTests
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import XCTest
@testable import TennisGame

class AnnouncementTests: XCTestCase {

    func test_getText_loveAll_scoreIs0To0() {
        let scoreCalculator = ScoreCalculator()
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        
        XCTAssertEqual("love all", text)
    }
    
    func test_getText_fifteenLove_scoreIs1To0() {
        let scoreCalculator = ScoreCalculator()
        scoreCalculator.playerOneScores()
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        
        XCTAssertEqual("fifteen love", text)
    }
    
    func test_getText_fifteenFifteen_scoreIs1To1() {
        let scoreCalculator = ScoreCalculator()
        scoreCalculator.playerOneScores()
        scoreCalculator.playerTwoScores()
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("fifteen all", text)
    }
    
     func test_getText_frotyFifteen_scoreIs3To1() {
         let scoreCalculator = ScoreCalculator()
         createScore((3, 1), scoreCalculator: scoreCalculator)
         
         let announcement = Announcement(scoreCalculator: scoreCalculator)
         
         let text = announcement.getText()
         
         XCTAssertEqual("forty fifteen", text)
     }
    

    func test_getText_deuce_scoreIs3To3() {
        let scoreCalculator = ScoreCalculator()
        createScore((3, 3), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("deuce", text)
    }
    
    func test_getText_deuce_scoreIs6To6() {
        let scoreCalculator = ScoreCalculator()
        createScore((6, 6), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("deuce", text)
    }

    func test_getText_playerTwoWins_scoreIs1To4() {
        let scoreCalculator = ScoreCalculator()
        createScore((1, 4), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("playerTwo wins", text)
    }
    
    func test_getText_playerOneWins_scoreIs6To4() {
        let scoreCalculator = ScoreCalculator()
        createScore((6, 4), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("playerOne wins", text)
    }
    
    func test_getText_playerOneAdvantage_scoreIs6To5() {
        let scoreCalculator = ScoreCalculator()
        createScore((6, 5), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("playerOne advantage", text)
    }

    func test_getText_playerTwoAdvantage_scoreIs4To5() {
        let scoreCalculator = ScoreCalculator()
        createScore((4, 5), scoreCalculator: scoreCalculator)
        
        let announcement = Announcement(scoreCalculator: scoreCalculator)
        
        let text = announcement.getText()
        XCTAssertEqual("playerTwo advantage", text)
    }

     private func createScore(_ score: (Int, Int), scoreCalculator: ScoreCalculator) {
         for _ in 0..<score.0 { scoreCalculator.playerOneScores() }
         for _ in 0..<score.1 { scoreCalculator.playerTwoScores() }
     }

}

