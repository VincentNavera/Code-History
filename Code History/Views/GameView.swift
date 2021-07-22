//
//  ContentView.swift
//  Code History
//
//  Created by Vincio on 6/2/21.
//

import SwiftUI

struct GameView: View {
    let question = Question(
            questionText: "What was the first computer bug?",
            possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
            correctAnswerIndex: 2)

    @StateObject var viewModel = GameViewModel()
    
//    let white = Color(red: 255/255, green: 255/255, blue: 255/255)
    let white = Color(red: 1, green: 1, blue: 1)
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
                QuestionView(question: viewModel.currentQuestion)
            }
        }
        .background(
            NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)),
                           isActive: .constant(viewModel.gameIsOver),
                           label: { EmptyView() })
        )
        .foregroundColor(.white)
        .navigationBarHidden(true)
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
