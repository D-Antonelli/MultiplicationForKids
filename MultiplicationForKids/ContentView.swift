//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

struct TableSelectionButton: View {
    public var label: String
    public var table: Int
    public var select: (Int) -> Void

    
    var body: some View {
        Button(label) {
            select(table)
        }
    }
}



struct Question: Hashable, View {
    public var table: Int
    public var time: Int
    public var result: Int {
        return table * time
    }
    
    var body: some View {
        Text("\(table) x \(time) = ")
    }
}



struct ContentView: View {
    @State private var table = 0
    @State private var numberOfQuestions = 0
    @State private var questions = [Question]()
    @State private var showSecondView = false
    
    public var canStartGame: Bool {
        return table > 0 && numberOfQuestions > 0
    }
    
    var body: some View {
        VStack {
            Section {
                Text("Table")
                HStack {
                    ForEach(1..<5) {num in
                        TableSelectionButton(label: "\(num)", table: num) {num in selectTable(num) }
                    }
                }
                
                HStack {
                    ForEach(5..<9) {num in
                       TableSelectionButton(label: "\(num)", table: num) {num in selectTable(num) }
                    }
                }
                HStack {
                    ForEach(9..<13) {num in
                        TableSelectionButton(label: "\(num)", table: num) {num in selectTable(num) }
                    }
                }
            }
            
            Spacer()
            
            Section {
                Text("Number of questions")
                Button("5") {
                    selectNumberOfQuestions(5)
                }
                Button("10") {
                    selectNumberOfQuestions(10)
                }
                Button("20") {
                    selectNumberOfQuestions(20)
                }
            }
            
            Spacer()
            
            Section {
                Button("Start") {
                    populateQuestions()
                    showSecondView.toggle()
                }
                .disabled(canStartGame == false)
            }
            
            Spacer()
            
            Section {
                Text("Table selected: \(table)")
                Text("Questions selected: \(numberOfQuestions)")
            }
            
//            ForEach(questions, id: \.self) { question in
//                question
//            }
            
            Spacer()
        }
        .sheet(isPresented: $showSecondView) {
            SecondView(questions: questions)
        }

    }
    
    func selectTable(_ number: Int) {
        table = number
    }
    
    func selectNumberOfQuestions(_ number: Int) {
        numberOfQuestions = number
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
