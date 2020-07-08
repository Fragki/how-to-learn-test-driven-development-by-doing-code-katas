//
//  TennisGame.swift
//  TennisGame
//
//  Created by FRAGKISKOS KATSIMPAS on 08/07/2020.
//  Copyright © 2020 FRAGKISKOS KATSIMPAS. All rights reserved.
//

import Foundation

class TennisGame {
    
    private let scoreCalculator: ScoreCalculator
    private let announcement: Announcement

    init(scoreCalculator: ScoreCalculator, announcement : Announcement) {
        self.scoreCalculator = scoreCalculator
        self.announcement = announcement
    }
    
    func getScoreAnnouncement() -> String? {
        return announcement.getText()
    }
    
    func playerOneScores() {
        scoreCalculator.playerOneScores()
    }
}
