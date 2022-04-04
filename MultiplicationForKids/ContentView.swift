//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

struct TableSelectionButton: View {
    public var image: String
    public var table: Int
    public var select: (Int) -> Void

    
    var body: some View {
        Button {
            select(table)
        } label: {
                Image(decorative: image)
        }
    }
}



struct Page: View {
    public var button: TableSelectionButton
    public var title: String
    public var subtitle: String
    
    var body: some View {
        VStack {
            button
            Text(title)
            Text(subtitle)
        }
    }
}


struct Question: Identifiable, Hashable, View {
    let table: Int
    let time: Int
    let index: Int
    let id = UUID()
    
    var body: some View {
        Text("\(table) x \(time) = ")
    }
}



class Game: ObservableObject {
    @Published var questions = [Question]()
    @Published var numberOfQuestions = 0
    @Published var table = 0
    
    func populateQuestions() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        var times = numbers
        
        for i in 1...self.numberOfQuestions {
         if(times.count < 1) {
             times = numbers
            }
        let randomIndex = Int.random(in: 0..<times.count)
        let randomTime = times[randomIndex]
            
            self.questions.append(Question(table: table, time: randomTime, index: i - 1))
        times.remove(at: randomIndex)
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
        VStack {
            Text("Hey!")
                .font(Font.custom("ArialRoundedMTBold", size: 50))
                .foregroundColor(Color.red)
            
            Text("Please select your level friend...")
                .font(.title2.bold())
                .foregroundColor(Color.white)
            
            Section {
                TabView {
                    ForEach(1..<13) {num in
                        Page(button: TableSelectionButton(image: animals[num], table: num) {num in selectTable(num) }, title: "Level \(num)", subtitle: "with \(animals[num])")

                    }
                }
                .tabViewStyle(PageTabViewStyle())
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
            
            
            Section {
                Button("Let's Play!") {
                    game.populateQuestions()
                    showSecondView.toggle()
                }
                .disabled(canStartGame == false)
            }
            
            
        }
        .font(Font.custom("ArialRoundedMTBold", size: 20))
        .background(Color.yellow)
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
