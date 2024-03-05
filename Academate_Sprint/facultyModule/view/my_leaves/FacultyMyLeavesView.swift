//
//  FacultyMyLeavesView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyMyLeavesView: View {
    var body: some View {
        ScrollView(.vertical){
            
                LeaveInfoCard(leaveDate: "", leaveName: "", reason: "", alternateStatus: 2, HodStatus: 1, approvalStatus: 0)
                LeaveInfoCard(leaveDate: "", leaveName: "", reason: "", alternateStatus: 2, HodStatus: 1, approvalStatus: 0)
            
            Spacer()
        }
        
    }
}

#Preview {
    FacultyMyLeavesView()
}
