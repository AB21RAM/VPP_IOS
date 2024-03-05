//
//  FacultyLeaveAppView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyLeaveAppView: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .foregroundColor(.orange) // Add color for visibility
            
            HStack {
                Rectangle()
                    .frame(width: 150, height: 100)
                    .foregroundColor(.orange) // Add color for visibility
                Spacer()
            }
        }.padding()
    }
}

#Preview {
    FacultyLeaveAppView()
}
