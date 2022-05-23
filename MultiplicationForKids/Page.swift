//
//  Page.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 14/04/2022.
//

import SwiftUI

struct Page: View {
    public var button: TableSelectionButton
    public var title: String
    public var subtitle: String
    
    var body: some View {
        HStack {
            button
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 160, height: 120)
                VStack {
                    Text(title)
                        .foregroundColor(Color.red)
                        .font(.largeTitleFont)
                    Text(subtitle)
                        .foregroundColor(.white)
                }
            }
            Spacer()
           
        }
        
    }
}


struct Page_Previews: PreviewProvider {
    static let selectPreview: (Int) -> Void = { _ in }
    static var previews: some View {
        Page(button: TableSelectionButton(image: "panda", table: 2, select: selectPreview), title: "title1", subtitle: "title2")
    }
}
