//
//  Sign.swift
//  RPS
//
//  Created by akshay.m on 14/11/21.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissor
    
    func winsOver(_ opponentSign: Sign) -> GameState {
        if (self == .rock && opponentSign == .paper) || (self == .paper && opponentSign == .scissor) {
            return .lose
        } else if self == opponentSign {
            return .draw
        } else {
            return .win
        }
    }
    
    var signEmoji: String {
        if self == .paper {return "✋🏼"}
        else if self == .scissor {return "✌🏼"}
        else {return "👊🏼"}
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {return .rock}
    else if sign == 1 {return .scissor}
    else {return .paper}
}

//switch choice {
//case .paper:
//    "✋🏼"
//case .rock:
//    "👊🏼"
//case .scissor:
//    "✌🏼"
//}
