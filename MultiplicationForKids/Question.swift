//
//  Question.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/04/2022.
//

import SwiftUI


struct Question: Identifiable, Hashable {
    let table: Int
    let time: Int
    let index: Int
    let id = UUID()
}
