//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

//https://coolors.co/palette/ff595e-ffca3a-8ac926-1982c4-6a4c93

//final class ScreenCoordinator: ObservableObject {
//    @Published var selectedTabItem: Int = 0
//    @Published var selectedPushedItem: PushedItem?
//    @Published var isPresented: Bool = false
//
//    enum PushedItem: String {
//        case firstScreen
//        case secondScreen
//        case thirdScreen
//    }
//}


//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//    var screenCoordinator = ScreenCoordinator()
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//
//        let contentView = ContentView().environmentObject(screenCoordinator)
//        if let windowScene = scene as? UIWindowScene {
//            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = UIHostingController(rootView: contentView)
//            self.window = window
//            window.makeKeyAndVisible()
//        }
//    }
//}


class NavigationModel: ObservableObject {

    @Published var view1IsActive = false
    @Published var view2IsActive = false
    @Published var view3IsActive = false

    func returnToView1() {
        view2IsActive.toggle()
        view3IsActive.toggle()
    }
}


struct ContentView: View {
    @EnvironmentObject var navModel: NavigationModel
    
    @State private var showSecondView = false
    
    private var animals = ["bear", "chick", "cow", "crocodile", "dog", "panda", "snake", "owl", "monkey", "parrot", "moose", "hippo", "chicken"]
    
    @StateObject var game = Game()
    
    
    public var canStartGame: Bool {
        return game.table > 0 && game.numberOfQuestions > 0
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                VStack {
                    Text("Hey!")
                        .font(.largeTitleFont)
                        .foregroundColor(Color(red: 1, green: 0.7922, blue: 0.2275))
                    
                    Text("Please select your times table...")
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
                    NavigationLink(destination: SecondView().environmentObject(game), isActive: $navModel.view2IsActive ) { EmptyView()
                    }
                    .isDetailLink(false)
                    Button {
                        game.populateQuestions()
                        navModel.view2IsActive = true
                    
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
            .navigationBarHidden(true)
            .padding()
            .font(.bodyFont)
            .background(Color(red: 0.4157, green: 0.298, blue: 0.5765))
            
        }
        
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
        .environmentObject(NavigationModel())
    }
}
