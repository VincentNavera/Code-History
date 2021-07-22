//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Vincio on 6/7/21.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))

    }
    
}
