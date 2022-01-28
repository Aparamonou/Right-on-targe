//
//  GameRoundProtocol.swift
//  Right on targe
//
//  Created by Alex Paramonov on 19.01.22.
//

import Foundation

protocol GameRoundProtocol {
     
     // количество очков
     var score: Int { get }
     // random num
     var currentRandomNum: Int { get}
     
     func calculateScore(with value: Int)
     
}

class GameRound: GameRoundProtocol {
     
     var score: Int = 0
     var currentRandomNum: Int = 0
     
     init(randomValue: Int ) {
          currentRandomNum = randomValue
     }
     
     func calculateScore(with value: Int) {
          // идет подсчет очков заработанных в игре
          if value > currentRandomNum {
               score += 50 - value + currentRandomNum
          } else if value < currentRandomNum {
               score += 50 - currentRandomNum + value
          }else {
               score += 50
          }
     }
}
