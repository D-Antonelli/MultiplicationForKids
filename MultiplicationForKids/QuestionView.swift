//
//  QuestionView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct QuestionView: View {
    private var question = 0
    
    @State var navigationBarBackButtonHidden = true
    @State private var answer = "?"
    @State private var multipleSelectionList = [Int]()
    
    @EnvironmentObject var game: Game
    
    @EnvironmentObject var navModel: NavigationModel
    
//    @State private var correctAnswers = 0
//    @State private var answers = Array(repeating: 0, count: 20)
    
    var body: some View {
        VStack {
            HStack {
                game.questions[question]
                    Text(answer)
            }
            
            HStack {
                
            }
            
            HStack {
                Text("Result is \(game.results[question])")
            }
        }
        .onAppear() {
            let min = game.questions[question].table
            let max = min * 12
            let correctAnswer = game.results[question]
            self.multipleSelectionList = generateRandomNumbers(min: min, max: max, size: 7, include: correctAnswer)
            print(self.multipleSelectionList.shuffled())
            
        }
        
    }
    func generateRandomNumbers(min: Int, max: Int, size: Int, include: Int) -> [Int] {
        
        var values = Array(min...max).filter { $0 != include }
        var result = [Int]()
        
        result.append(include)
        
        for _ in 1..<size {
            let randomIndex = Int.random(in: 0..<values.count)
            result.append(values[randomIndex])
            values.remove(at: randomIndex)
        }
        return result
    }
        
//            VStack {
//                List(game.questions) { question in
//                    HStack {
//                        question
//                        TextField("answer", value: $answers[question.index], format: .number)
//                    }
//
//                }
//
//                Spacer()
//
//                NavigationLink(destination: ResultView(correct: correctAnswers, total: game.numberOfQuestions), isActive: $navModel.ResultViewIsActive) { EmptyView()
//                }
//
//                .isDetailLink(false)
//
//                Button("Submit") {
//                    self.navigationBarBackButtonHidden = false
//                    submitAnswers()
//                    navModel.goToResultView()
//                }
//            }
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(navigationBarBackButtonHidden)
//
//    }
    
//
//    func submitAnswers() {
//        game.questions.forEach() { question in
//            let result = question.time * question.table
//            let answer = answers[question.index]
//            if(answer == result) {
//                correctAnswers += 1
//            }
//        }
   
 
}



struct QuestionView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            AppStartView()
            QuestionView()
        }
        .environmentObject({ () -> Game in
            let game = Game()
            game.questions = [Question(table: 1, time: 2, index: 0), Question(table: 1, time: 10, index: 1), Question(table: 1, time: 8, index: 2), Question(table: 1, time: 5, index: 3), Question(table: 1, time: 8, index: 2), Question(table: 1, time: 5, index: 4)]
            game.results = [2,10,8,5,8,5]
            return game
        }())
        .environmentObject(NavigationModel())
        
    }
}

