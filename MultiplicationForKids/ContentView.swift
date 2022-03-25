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


struct Question: Identifiable, Hashable, View {
    let table: Int
    let time: Int
    let index: Int
    let id = UUID()
    
    var body: some View {
        Text("\(table) x \(time) = ")
    }
}

class Questions: ObservableObject {
    @Published var questions = [Question]()
}



struct ContentView: View {
    @State private var table = 0
    @State private var numberOfQuestions = 0
    @State private var showSecondView = false
    
    @StateObject var questions = Questions()
    
    public var canStartGame: Bool {
        return table > 0 && numberOfQuestions > 0
    }
    
    var body: some View {
        VStack {
            Section {
                Spacer()
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
                    showSecondView.toggle()
                }
                .disabled(canStartGame == false)
            }
            
            Spacer()
            
            Section {
                Text("Table selected: \(table)")
                Text("Questions selected: \(numberOfQuestions)")
            }
            
            
            Spacer()
        }
        .sheet(isPresented: $showSecondView) {
            SecondView(table: table, numberOfQuestions: numberOfQuestions)
            
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
            
            questions.questions.append(Question(table: table, time: randomTime, index: i - 1))
        times.remove(at: randomIndex)
        }
        
    }
    
    func selectTable(_ number: Int) {
        table = number
    }
    
    func selectNumberOfQuestions(_ number: Int) {
        numberOfQuestions = number
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
