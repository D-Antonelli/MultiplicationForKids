//
//  EndOfGameView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 25/03/2022.
//

import SwiftUI

struct EndOfGameView: View {
    @State var navigationBarBackButtonHidden = true
    
    @EnvironmentObject var game: Game
    
    @EnvironmentObject var navModel: NavigationModel
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                
                Image(decorative: "congrats")
                    .resizable()
                    .scaledToFit()
                
                Image(decorative: game.animals[(game.table ?? 1) - 1])
                
                
                
                
                Text("Good job!")
                    .font(.largeTitleFont)
                    .foregroundColor(Color(red: 0.94, green: 0.44, blue: 0.40))
                    .padding()
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: .infinity, maxHeight: 57)
                        .padding(12)
                        .foregroundColor(.mint)
                    Button {
                        self.navigationBarBackButtonHidden = false
                        navModel.returnToAppStartView()
                        
                    } label: {
                        Text("Play again")
                        
                            .font(.largeTitleFont)
                            .foregroundColor(.white)
                        
                            .frame(maxWidth: .infinity, maxHeight: 60)
                        
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.yellow, lineWidth: 3))
                            .padding(12)
                        
                    }
                }
                
                
                //                Button("Restart game") {
                //                    self.navigationBarBackButtonHidden = false
                //                    navModel.returnToAppStartView()
                //                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(navigationBarBackButtonHidden)
        }
        
    }
    
}

struct EndOfGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        EndOfGameView()
            .environmentObject(NavigationModel())
            .environmentObject(Game())
    }
}
