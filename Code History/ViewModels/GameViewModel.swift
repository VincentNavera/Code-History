//
//  GameViewModel.swift
//  Code History
//
//  Created by Vincio on 6/7/21.
//
import SwiftUI

// 1
class GameViewModel: ObservableObject {

  // MARK: - Published properties
  // 2
  @Published private var game = Game()

  // MARK: - Internal properties
  // 3
  var currentQuestion: Question {
     game.currentQuestion
  }
  // 4
  var questionProgressText: String {
    "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
  }

    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true

        } else {
            return false

        }

    }
    var gameIsOver: Bool {
      game.isOver
    }



    var correctGuesses: Int {
        game.guessCount.correct
      }


    var incorrectGuesses: Int {
        game.guessCount.incorrect

    }



    
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)

    }

    func displayNextScreen() {
        game.updateGameStatus()

    }

    func color(forOptionIndex optionIndex: Int) -> Color {
             if let guessedIndex = game.guesses[currentQuestion] {
                 if guessedIndex != optionIndex {
                     return GameColor.main
                 } else if guessedIndex == currentQuestion.correctAnswerIndex {
                     return GameColor.correctGuess
                 } else {
                     return GameColor.incorrectGuess
                 }
             } else {
                 return GameColor.main
             }
         }
}
