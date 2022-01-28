//
//  ViewController.swift
//  Right on targe
//
//  Created by Alex Paramonov on 18.01.22.
//

import UIKit

class ViewController: UIViewController {
     
     @IBOutlet  var slider: UISlider!
     @IBOutlet  var labelNumbers: UILabel!
     
     
     var game: Game!
     
     // MARK: - Жизненый цикл
     
     override func viewDidLoad() {
          super.viewDidLoad()
          // создаем генератор случаных чисел
          let generatorNumber = GeneratorNum(startValue: 1, endValue: 50)!
          // создаем сущность игры
          game = Game(randomValue: generatorNumber, rounds: 5)
          updateLabaleWithRandomNumber(text: String(game.currentRound.currentRandomNum))
     }
     
     //MARK: - взаимодейтсвия View - Model
     
     @IBAction func checkNumber() {
          // Подсчитываем очки за раунд
          game.currentRound.calculateScore(with: Int(slider.value))
          
          // проверяем последний раунд или нет
          if game.gameIsEnded {
               // выводим алерт с результатом и начинаем новую игру
               showAlert(game.score)
               game.restartGame()
          } else {
               // если раундов маньше 5, то просто начинаем новый раунд
               game.startNewRound()
          }
          // обновляем рандомное число
          updateLabaleWithRandomNumber(text: String(game.currentRound.currentRandomNum))
     }
     
     //MARK: - обновление View
     
     private func updateLabaleWithRandomNumber (text: String ) {
          labelNumbers.text = text
     }
     
     private func showAlert( _ score: Int) {
          
          let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали - \(score)", preferredStyle: .alert)
          
          alert.addAction(UIAlertAction(title: "Начать занового", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)
     }
}

