//
//  FacultyPunchRecordView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyPunchRecordView: View {
    var body: some View {
        ScrollView(.vertical){
            PunchRecordCard()
            PunchRecordCard()
            PunchRecordCard()
        }
    }
}

#Preview {
    FacultyPunchRecordView()
}
