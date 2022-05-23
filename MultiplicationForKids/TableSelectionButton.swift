//
//  TableSelectionButton.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/04/2022.
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
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 180)
        }
    }
}

struct TableSelectionButton_Previews: PreviewProvider {
    static let imagePreview =  "panda"
    static let tablePreview = 2
    static let selectPreview: (Int) -> Void = { _ in }
    static var previews: some View {
        TableSelectionButton(image: imagePreview, table: tablePreview, select: selectPreview)
    }
}
