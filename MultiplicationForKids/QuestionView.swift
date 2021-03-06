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
                .frame(width: 300, height: 35)
                .foregroundColor(Color.yellow.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 300, height: 35)
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
    
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 3)
    
    
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
            Spacer()
            Group {
//                HStack(alignment: .bottom) {
//                    Text("x")
//                        .font(.extraLargeTitleFont)
//                    Spacer()
//                    VStack(alignment: .trailing) {
//                        Text("\(game.questions[question].table)")
//                            .font(.extraLargeTitleFont)
//                        Text("\(game.questions[question].time)")
//                            .font(.extraLargeTitleFont)
//                    }
//
//                }
                
                
                if let questions =  game.numberOfQuestions, question < questions, game.questions.count > 0 {

                    HStack(alignment: .bottom) {
                        Text("x")
                            .font(.extraLargeTitleFont)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("\(game.questions[question].table)")
                                .font(.extraLargeTitleFont)
                            Text("\(game.questions[question].time)")
                                .font(.extraLargeTitleFont)
                        }

                    }

                }
                
                
            }
            Rectangle().fill(.black).frame(width: .infinity, height: 2, alignment: .center)
            
            Spacer()
            
            LazyVGrid(columns: columns) {
                ForEach(multipleSelectionList, id: \.self) { num in
                    Button {
                        checkAnswer(num)
                        self.navigationBarBackButtonHidden = false
                    } label: {
                        Text("\(num)")
                            .font(.largeTitleFont)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color(red: 0.00, green: 0.51, blue: 0.65))
                            .cornerRadius(25)
                            .shadow(color: Color(red: 0.00, green: 0.51, blue: 0.65).opacity(0.5), radius: 0, x: 0, y: 8)
                            .fixedSize(horizontal: false, vertical: false)
                    }
                }
                .padding()
                
            }
            
            NavigationLink(destination: QuestionView(question: question).environmentObject(game), isActive: $navModel.NextQuestionViewIsActive) { EmptyView() }
            
            if navModel.EndOfGameViewIsActive == true {
                NavigationLink(destination: EndOfGameView().environmentObject(game), isActive: $navModel.EndOfGameViewIsActive) { EmptyView()
                }
                
            }
        }
        .padding()
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
            navModel.goToEndOfGameView()
        }
    }
    
    func generateMultipleSelectionList() {
        let min = game.questions[question].table
        let max = min * game.maxTime
        let correctAnswer = game.results[question]
        self.multipleSelectionList = Helpers.generateRandomNumbers(min: min, max: max, size: 6, include: correctAnswer)
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

