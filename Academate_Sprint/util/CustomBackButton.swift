//
//  CustomBackButton.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 21/01/24.
//

import SwiftUI

struct CustomBackButton: View {
    var action: () -> Void
    var button_color : Color
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(button_color)
            }
        }
    }
}

