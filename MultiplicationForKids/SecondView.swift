//
//  SecondView.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/03/2022.
//

import SwiftUI

struct SecondView: View {
    var questions = [Question]()

    var body: some View {
        VStack {
            ForEach(questions, id: \.self) { question in
                question
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static let questionsPreview = [Question]()
    
    static var previews: some View {
        SecondView(questions: questionsPreview)
    }
}
