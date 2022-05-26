//
//  QuestionView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 280, height: 35)
                .foregroundColor(Color.yellow.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 280, height: 35)
                .foregroundColor(.yellow)
        }
        .padding()
    }
}




struct QuestionView: View {
    
    @State public var question = 0
    @State var navigationBarBackButtonHidden = true
    @State private var multipleSelectionList = [Int]()
    
    @EnvironmentObject var game: Game
    
    @EnvironmentObject var navModel: NavigationModel
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                ProgressView(value: Double(question), total: Double(game.numberOfQuestions ?? 0))
                    .progressViewStyle(RoundedRectProgressViewStyle())
                Image(decorative: game.animals[(game.table ?? 1) - 1])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50, alignment: .center)
            }
            
            
            HStack {
                if let questions =  game.numberOfQuestions, question < questions, game.questions.count > 0 {
                    game.questions[question]
                }
                
            }
            
            HStack {
                ForEach(multipleSelectionList, id: \.self) { num in
                    Button {
                        checkAnswer(num)
                        self.navigationBarBackButtonHidden = false
                    } label: {
                        Text("\(num)")
                    }
                }
            }
            
            NavigationLink(destination: QuestionView(question: question).environmentObject(game), isActive: $navModel.NextQuestionViewIsActive) { EmptyView() }
            
            if navModel.ResultViewIsActive == true {
                NavigationLink(destination: ResultView(), isActive: $navModel.ResultViewIsActive) { EmptyView()
                }
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(navigationBarBackButtonHidden)
        .onAppear() {
            generateMultipleSelectionList()
            navModel.disableNextQuestionView()
            
        }
        
    }
    
    func checkAnswer(_ selection: Int) {
        let correctAnswer = game.results[question]
        if selection == correctAnswer {
            goToNextView()
        } else {
            // do nothing
        }
    }
    
    func goToNextView() {
        question = question + 1
        if question < game.numberOfQuestions! {
            navModel.activateNextQuestionView()
        } else {
            navModel.goToResultView()
        }
    }
    
    func generateMultipleSelectionList() {
        let min = game.questions[question].table
        let max = min * game.maxTime
        let correctAnswer = game.results[question]
        self.multipleSelectionList = Helpers.generateRandomNumbers(min: min, max: max, size: 7, include: correctAnswer)
    }
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

