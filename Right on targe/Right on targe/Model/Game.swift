//
//  Game.swift
//  Right on targe
//
//  Created by Alex Paramonov on 18.01.22.
//

import Foundation


protocol GameProtocol {
     // количество заработанных очков
     var score: Int { get }
     // проверяет закончена игра или нет
     var gameIsEnded: Bool { get }
     // uенератор случаных чисел
     var generatorRandomNum: GeneratorNumProtocol { get }
     // подсчет очков и раундов
     var currentRound: GameRoundProtocol! { get }
     // начинает и сразу сразу стартует новую игру
     func restartGame ()
     // Начинает новый раунд и генерирует новое число
     func startNewRound()
}

class Game: GameProtocol {
     
     var score: Int {
          var totalscore: Int = 0
          for round in self.rounds {
               totalscore += round.score
          }
          return totalscore
     }
     
     var generatorRandomNum: GeneratorNumProtocol
     var currentRound: GameRoundProtocol!
     private var rounds: [GameRoundProtocol] = []
     private var roundCount: Int!
     
     var randomNum: Int = 0
     
     
     // тут проверяем если последний раунд и текущий совпадают, то игра заканчивается
     var gameIsEnded: Bool {
          if roundCount == rounds.count {
               return true
          } else {
               return false
          }
     }
     
     init( randomValue: GeneratorNumProtocol , rounds: Int) {
          generatorRandomNum = randomValue
          roundCount = rounds
          startNewRound()
          
     }
     
     func restartGame() {
          // сбрасываем все счетчики и запускаем новый раунд
          rounds = []
          startNewRound()
     }
     
     func startNewRound() {
          
          let randomNumber = getRandomNumber()
          currentRound = GameRound(randomValue: randomNumber)
          rounds.append(currentRound)
     }
     
     private func getRandomNumber () -> Int {
          return generatorRandomNum.getNewRandomValue()
     }
     
}
