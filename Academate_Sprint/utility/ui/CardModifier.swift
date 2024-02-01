//
//  CardModifier.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 17/01/24.
//

import Foundation
import SwiftUI
struct CardModifier: ViewModifier {
    var paddingValue : Int
    var backgroundColor : Color
    var cornerRadius : Int
    var foregroundColor : Color
    var font : Font
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding()
            .foregroundColor(foregroundColor)
            .frame(maxWidth: CGFloat.infinity)
            .background(backgroundColor)
            .cornerRadius(CGFloat(cornerRadius))
            .padding(CGFloat(paddingValue))
    }
}
struct ResizableCardModifier: ViewModifier {
    var paddingValue : Int
    var backgroundColor : Color
    var cornerRadius : Int
    var foregroundColor : Color
    var font : Font
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(CGFloat(cornerRadius))
            .padding(CGFloat(paddingValue))
    }
}
