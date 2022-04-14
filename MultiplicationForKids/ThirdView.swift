//
//  ThirdView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 25/03/2022.
//

import SwiftUI

struct ThirdView: View {
   @EnvironmentObject var game: Game
    
   @EnvironmentObject var screenCoordinator: ScreenCoordinator
    
   public var correct = 0
   public var total = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("You've answered \(correct) out of \(total) questions correctly!")
                NavigationLink(destination: ContentView(), tag: ScreenCoordinator.PushedItem.firstScreen, selection: $screenCoordinator.selectedPushedItem) {EmptyView()}
                Button("Restart game") {
                    screenCoordinator.selectedPushedItem = ScreenCoordinator.PushedItem.firstScreen
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static let correctPreview = 5
    static let totalPreview = 10
    
    static var previews: some View {
        ThirdView(correct: correctPreview, total: totalPreview)
            .environmentObject(ScreenCoordinator().self)
    }
}
