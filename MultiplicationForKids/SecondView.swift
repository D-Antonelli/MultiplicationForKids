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
    @State private var questions = [Question]()

    var body: some View {
        VStack {
            ForEach(questions, id: \.self) { question in
                question
            }
        }
        .onAppear {
            populateQuestions()
        }
    }
        
    
    func populateQuestions() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var times = numbers
        questions.removeAll()
        
        for _ in 1...numberOfQuestions {
         if(times.count < 1) {
             times = numbers
            }
        let randomIndex = Int.random(in: 0..<times.count)
        let randomTime = times[randomIndex]
            
        questions.append(Question(table: table, time: randomTime))
        times.remove(at: randomIndex)
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static let tablePreview = 1
    static let numberOfQuestionsPreview = 5
    
    static var previews: some View {
        SecondView(table: tablePreview, numberOfQuestions: numberOfQuestionsPreview)
    }
}
