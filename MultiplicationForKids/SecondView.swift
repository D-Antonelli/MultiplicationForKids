//
//  SecondView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct SecondView: View {
    public var table = 0
    public var numberOfQuestions = 0
    @State private var correctAnswers = 0
    @State private var answers: [Int]
    @State private var questions = [Question]()
    @State private var showThirdView = false
    
    init(table: Int, numberOfQuestions: Int) {
        self.table = table
        self.numberOfQuestions = numberOfQuestions
        self.answers = Array(repeating: 0, count: self.numberOfQuestions)
    }

    var body: some View {
        VStack {
            List(questions) { question in
                HStack {
                    Text("\(question.table) x \(question.time) = ")
                    TextField("answer", value: $answers[question.index], format: .number)
                }
                
            }
            
            Text("Correct: \(correctAnswers)")
            
            Spacer()
            
            Button("Submit") {
                submitAnswers()
            }
            
        }
        .onAppear {
            populateQuestions()
        }
        .sheet(isPresented: $showThirdView) {
            ThirdView(correct: correctAnswers, total: numberOfQuestions)
        }
    }
        
    
    func populateQuestions() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var times = numbers
        
        for i in 1...numberOfQuestions {
         if(times.count < 1) {
             times = numbers
            }
        let randomIndex = Int.random(in: 0..<times.count)
        let randomTime = times[randomIndex]
            
        questions.append(Question(table: table, time: randomTime, index: i - 1))
        times.remove(at: randomIndex)
        }
        
    }
    
    func submitAnswers() {
        questions.forEach() { question in
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
    static let tablePreview = 1
    static let numberOfQuestionsPreview = 5
    
    static var previews: some View {
        SecondView(table: tablePreview, numberOfQuestions: numberOfQuestionsPreview)
    }
}
