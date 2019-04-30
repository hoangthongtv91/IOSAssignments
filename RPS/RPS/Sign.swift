//
//  Sign.swift
//  RPS
//
//  Created by Thong Hoang Nguyen on 2019-04-23.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .Rock
    } else if sign == 1 {
        return .Paper
    } else {
        return .Scissors
    }
}

enum Sign {
    case Rock
    case Paper
    case Scissors
    var emoji: String {
        switch self {
        case .Rock:
            return "👊"
        case .Paper:
            return "🖐"
        case .Scissors:
            return "✌️"
        }
    }
    func getGameState(other: Sign) -> GameState {
        switch (self, other) {
        case (.Rock, .Paper):
            return .Lose
        case (.Rock, .Scissors):
            return .Win
        case (.Paper, .Rock):
            return .Win
        case (.Paper, .Scissors):
            return .Lose
        case (.Scissors, .Paper):
            return .Win
        case (.Scissors, .Rock):
            return .Lose
        default:
            return .Draw
        }
    }
}
