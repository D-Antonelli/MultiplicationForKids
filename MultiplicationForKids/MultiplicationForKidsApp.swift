//
//  MultiplicationForKidsApp.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 07/03/2022.
//

import SwiftUI

@main
struct MultiplicationForKidsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationModel())
        }
    }
}


