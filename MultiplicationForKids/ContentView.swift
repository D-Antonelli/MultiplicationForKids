//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

//https://coolors.co/palette/ff595e-ffca3a-8ac926-1982c4-6a4c93
    

struct Page: View {
    public var button: TableSelectionButton
    public var title: String
    public var subtitle: String
    
    var body: some View {
        VStack {
            button
            
            Text(title)
                .foregroundColor(Color(red: 1, green: 0.349, blue: 0.3686))
                .font(.titleFont)
            Text(subtitle)
                .foregroundColor(.white)
            Spacer()
        }
        
    }
}



struct ContentView: View {
    @State private var showSecondView = false
    
    private var animals = ["bear", "chick", "cow", "crocodile", "dog", "panda", "snake", "owl", "monkey", "parrot", "moose", "hippo", "chicken"]
    
    @StateObject var game = Game()
    
    public var canStartGame: Bool {
        return game.table > 0 && game.numberOfQuestions > 0
    }
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text("Hey!")
                    .font(.largeTitleFont)
                    .foregroundColor(Color(red: 1, green: 0.7922, blue: 0.2275))
                
                Text("Please select your table...")
                    .font(.title2.bold())
                    .foregroundColor(Color.white)
            }
            Spacer()
            Spacer()
            Spacer()
            
            VStack {
                TabView {
                    ForEach(1..<13) {num in
                        Page(button: TableSelectionButton(image: animals[num], table: num) {num in selectTable(num) }, title: "\(num) x", subtitle: "with \(animals[num])")
                        
                            .tabItem {
                                Label("\(num)", systemImage: "\(num).circle")
                            }
                        
                    }
                }
                
                .tabViewStyle(PageTabViewStyle())
                .frame(maxHeight: 320)
                
                
                Spacer()
                
                VStack {
                    Text("Choose number of questions")
                        .foregroundColor(Color.white)
                    HStack(alignment: .center, spacing: 25) {
                        Button {
                            selectNumberOfQuestions(5)
                        } label: {
                            Text("5")
                                .font(.largeTitleFont)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.red)
                                .cornerRadius(10)
                            
                        }
                        Button {
                            selectNumberOfQuestions(10)
                        } label: {
                            Text("10")
                                .font(.largeTitleFont)
                                .foregroundColor(.pink)
                                .padding(15)
                                .background(.yellow)
                                .cornerRadius(10)
                        }
                        Button() {
                            selectNumberOfQuestions(20)
                        } label: {
                            Text("20")
                                .font(.largeTitleFont)
                                .foregroundColor(.yellow)
                                .padding(15)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                    }
                    
                    
                }
                
                
                Spacer()
                Button {
                    game.populateQuestions()
                    showSecondView.toggle()
                } label: {
                    Text("Let's Play!")
                        .font(.largeTitleFont)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.yellow, lineWidth: 3))
                        .padding(12)
                        .opacity(canStartGame == false ? 0.4 : 1.0)
                }
                .disabled(canStartGame == false)
                
            }
            
        }
        .padding()
        .font(.bodyFont)
        .background(Color(red: 0.4157, green: 0.298, blue: 0.5765))
        .sheet(isPresented: $showSecondView) {
            SecondView()
            
        }
        .environmentObject(game)
        
    }
    
    func selectTable(_ number: Int) {
        game.table = number
    }
    
    func selectNumberOfQuestions(_ number: Int) {
        game.numberOfQuestions = number
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
