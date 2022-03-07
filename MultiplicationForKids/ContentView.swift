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
    public var multiplication: Int
    
    var body: some View {
        Text("\(multiplication)")
    }
}

struct ContentView: View {
    @State private var table = 0
    @State private var numberOfQuestions = 0
    
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
            
            Question(multiplication: table)
            
            Button("Start") {}
            
            Spacer()
            
            Section {
                Text("Table selected: \(table)")
                Text("Questions selected: \(numberOfQuestions)")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
