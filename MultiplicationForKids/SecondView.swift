//
//  SecondView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var game: Game
    
    @EnvironmentObject var navModel: NavigationModel
    
    @State private var correctAnswers = 0
    @State private var answers = Array(repeating: 0, count: 20)
    
    var body: some View {
            VStack {
                List(game.questions) { question in
                    HStack {
                        question
                        TextField("answer", value: $answers[question.index], format: .number)
                    }
                    
                }
                
                Text("Correct: \(correctAnswers)")
                
                Spacer()
                
                NavigationLink(destination: ThirdView(correct: correctAnswers, total: game.numberOfQuestions), isActive: $navModel.view3IsActive) { EmptyView()
                }
                .isDetailLink(false)
                    
                Button("Submit") {
                    submitAnswers()
                    navModel.view3IsActive.toggle()
                }
            }
            
        
       
    }
    
    
    func submitAnswers() {
        game.questions.forEach() { question in
            let result = question.time * question.table
            let answer = answers[question.index]
            if(answer == result) {
                correctAnswers += 1
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
            SecondView()
        }
        .environmentObject({ () -> Game in
            let game = Game()
            game.questions = [Question(table: 1, time: 2, index: 0), Question(table: 1, time: 10, index: 1), Question(table: 1, time: 8, index: 2), Question(table: 1, time: 5, index: 3), Question(table: 1, time: 8, index: 2), Question(table: 1, time: 5, index: 4)]
            return game
        }())
        .environmentObject(NavigationModel())
        
    }
}

