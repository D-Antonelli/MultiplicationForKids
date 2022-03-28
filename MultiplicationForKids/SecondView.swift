//
//  SecondView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var game: Game
    
    @State private var correctAnswers = 0
    @State private var answers = Array(repeating: 0, count: 20)
    @State private var showThirdView = false

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
            
            Button("Submit") {
                submitAnswers()
            }
            
            
        }
        
        .sheet(isPresented: $showThirdView) {
            ThirdView(correct: correctAnswers, total: game.numberOfQuestions)
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
        
        showThirdView = true
    }
}

struct SecondView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
            SecondView()
        }
        .environmentObject(Game())
            
    }
}
    
