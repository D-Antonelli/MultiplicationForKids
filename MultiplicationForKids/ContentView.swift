//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Section {
                Text("Multiplication")
                HStack {
                    Button("1") {}
                    Button("2") {}
                    Button("3") {}
                    Button("4") {}
                }
                HStack {
                    Button("5") {}
                    Button("6") {}
                    Button("7") {}
                    Button("8") {}
                }
                HStack {
                    Button("9") {}
                    Button("10") {}
                    Button("11") {}
                    Button("12") {}
                }
            }
            
            Section {
                Text("Selected")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
