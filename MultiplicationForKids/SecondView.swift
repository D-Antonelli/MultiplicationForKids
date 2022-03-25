//
//  SecondView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct SecondView: View {
    public var numberOfQuestions = 0
    @State private var correctAnswers = 0
    @State private var answers: [Int]
    @State private var showThirdView = false
    
    @EnvironmentObject var questions: Questions
    
    init(numberOfQuestions: Int) {
        self.numberOfQuestions = numberOfQuestions
        self.answers = Array(repeating: 0, count: self.numberOfQuestions)
    }

    var body: some View {
        VStack {
            List(questions.questions) { question in
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
            ThirdView(correct: correctAnswers, total: numberOfQuestions)
        }
    }
        
    
    func submitAnswers() {
        questions.questions.forEach() { question in
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
    static let numberOfQuestionsPreview = 5
    
    static var previews: some View {
        SecondView(numberOfQuestions: numberOfQuestionsPreview)
    }
}
