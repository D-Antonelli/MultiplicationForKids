//
//  Font.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 11/04/2022.
//

import SwiftUI

extension Font {
    static let bodyFont = Font.custom("ArialRoundedMTBold", size: Font.TextStyle.body.size)
    static let titleFont = Font.custom("ArialRoundedMTBold", size: Font.TextStyle.title.size)
    static let mediumTitleFont = Font.custom("ArialRoundedMTBold", size: Font.TextStyle.title2.size)
    static let largeTitleFont = Font.custom("ArialRoundedMTBold", size: Font.TextStyle.largeTitle.size)
    static let extraLargeTitleFont = Font.custom("ArialRoundedMTBold", size: 150)
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 45
        case .title: return 31
        case .title2: return 25
        case .title3: return 23
        case .headline, .body: return 22
        case .subheadline, .callout: return 19
        case .footnote: return 16
        case .caption: return 15
        case .caption2: return 14
        @unknown default:
            return 8
        }
    }
}
