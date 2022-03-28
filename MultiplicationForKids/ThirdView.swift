//
//  ThirdView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 25/03/2022.
//

import SwiftUI

struct ThirdView: View {
   @EnvironmentObject var game: Game
    
   public var correct = 0
   public var total = 0
   @State private var restart = false
    
    var body: some View {
        VStack {
            Text("You've answered \(correct) out of \(total) questions correctly!")
            Button("Restart game") {
                restart = true
            }
        }
        .sheet(isPresented: $restart) {
            ContentView()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static let correctPreview = 5
    static let totalPreview = 10
    
    static var previews: some View {
        ThirdView(correct: correctPreview, total: totalPreview)
    }
}
