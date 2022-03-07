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
    @State private var multiplication = 1
    
    var body: some View {
        VStack {
            Section {
                Text("Multiplication")
                HStack {
                    ForEach(1..<5) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in select(number: num) }
                    }
                }
                
                HStack {
                    ForEach(5..<9) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in select(number: num) }
                    }
                }
                HStack {
                    ForEach(9..<13) {num in
                        MultiplicationSelectionButton(label: "\(num)", multiplication: num) {num in select(number: num) }
                    }
                }
            }
            
            Spacer()
            
            Section {
                Text("\(multiplication)")
            }
            
            Spacer()
        }

    }
    
    func select(number: Int) {
        multiplication = number
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
