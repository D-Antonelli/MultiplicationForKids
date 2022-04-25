//
//  ThirdView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 25/03/2022.
//

import SwiftUI

struct ThirdView: View {
   @EnvironmentObject var game: Game
    
   @EnvironmentObject var navModel: NavigationModel
    
   public var correct = 0
   public var total = 0
    
    var body: some View {
            VStack {
                Text("You've answered \(correct) out of \(total) questions correctly!")
               
                Button("Restart game") {
                    navModel.returnToView1()
                }
            }
        }
}

struct ThirdView_Previews: PreviewProvider {
    static let correctPreview = 5
    static let totalPreview = 10
    
    static var previews: some View {
        ThirdView(correct: correctPreview, total: totalPreview)
            .environmentObject(NavigationModel())
    }
}
