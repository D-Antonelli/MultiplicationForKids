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

struct Question: View {
    public var table: Int
    public var time: Int
    public var result: Int {
        return table * time
    }
    
    var body: some View {
        Text("\(table) x \(time) = \(result)")
    }
}

struct ContentView: View {
    @State private var table = 0
    @State private var numberOfQuestions = 0
    @State private var randomTimes = [Int]()
    
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
            
            Button("Start") {
                populateTimesArray()
            }
            
            Spacer()
            
            Section {
                Text("Table selected: \(table)")
                Text("Questions selected: \(numberOfQuestions)")
            }
            
            ForEach(randomTimes, id: \.self) { time in
                Question(table: table, time: time)
            }
            
            Spacer()
        }

    }
    
    func selectTable(_ number: Int) {
        table = number
    }
    
    func selectNumberOfQuestions(_ number: Int) {
        numberOfQuestions = number
    }
    
    func populateTimesArray() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var times = numbers
        
        for _ in 1...numberOfQuestions {
         if(times.count < 1) {
             times = numbers
            }
        let randomIndex = Int.random(in: 0..<times.count)
        randomTimes.append(times[randomIndex])
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
