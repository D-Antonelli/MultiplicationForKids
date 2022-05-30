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
    @Published var EndOfGameViewIsActive = false
    @Published var NextQuestionViewIsActive = false
    
    func goToQuestionView() {
        QuestionViewIsActive = true
    }
    
    func goToEndOfGameView() {
        EndOfGameViewIsActive = true
    }

    func returnToAppStartView() {
       QuestionViewIsActive = false
       EndOfGameViewIsActive = false
    }
    
    func disableNextQuestionView() {
        NextQuestionViewIsActive = false
    }
    
    func activateNextQuestionView() {
        NextQuestionViewIsActive = true
    }
    
    }
