//
//  Game.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/04/2022.
//

import SwiftUI


class Game: ObservableObject {
    @Published var questions = [Question]()
    @Published var results = [Int]()
    @Published var maxTime = 12
    @Published var numberOfQuestions: Int? = nil
    @Published var table: Int? = nil
    @Published var animals = ["bear", "chick", "cow", "crocodile", "dog", "panda", "snake", "owl", "monkey", "parrot", "moose", "hippo", "chicken"]
    
    func initialise() {
        populateQuestions()
        populateResults()
    }
    
    func reset() {
        self.questions = [Question]()
        self.results = [Int]()
    numberOfQuestions = nil
        table = nil
    }
    
    func populateQuestions() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var times = numbers
        
        for i in 1...self.numberOfQuestions! {
            if(times.count < 1) {
                times = numbers
            }
            let randomIndex = Int.random(in: 0..<times.count)
            let randomTime = times[randomIndex]
            
            self.questions.append(Question(table: table!, time: randomTime, index: i - 1))
            times.remove(at: randomIndex)
        }
    }
    
    func populateResults() {
        self.questions.forEach() { question in
            let result = question.time * question.table
            self.results.append(result)
            
        }
    }
}
