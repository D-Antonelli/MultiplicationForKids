//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

struct MultiplicationSelectionButton: View {
    public var label: String
    public var multiplication: Int
    public var select: (Int) -> Void
    
    var body: some View {
        Button(label) {
            select(multiplication)
        }
    }
}

struct ContentView: View {
    @State private var multiplication = 0
    @State private var numberOfQuestions = 0
    
    var body: some View {
        VStack {
            Section {
                Text("Multiplication")
                HStack {
                    ForEach(1..<5) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in selectMultiplication(num) }
                    }
                }
                
                HStack {
                    ForEach(5..<9) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in selectMultiplication(num) }
                    }
                }
                HStack {
                    ForEach(9..<13) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in selectMultiplication(num) }
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
            
            Button("Start") {}
            
            Spacer()
            
            Section {
                Text("Multiplication selected: \(multiplication)")
                Text("Questions selected: \(numberOfQuestions)")
            }
            
            Spacer()
        }

    }
    
    func selectMultiplication(_ number: Int) {
        multiplication = number
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
