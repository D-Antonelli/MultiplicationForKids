//
//  NavigationModel.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 28/04/2022.
//

import Foundation

class NavigationModel: ObservableObject {

    @Published var AppStartViewIsActive = false
    @Published var QuestionViewIsActive = false
    @Published var ResultViewIsActive = false
    
    func goToQuestionView() {
        QuestionViewIsActive.toggle()
    }
    
    func goToResultView() {
        ResultViewIsActive.toggle()
    }

    func returnToAppStartView() {
        QuestionViewIsActive.toggle()
        ResultViewIsActive.toggle()
    }
}
