//
//  FacultyMyLeavesView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyMyLeavesView: View {
    @StateObject var viewmodel = FacultyLeaveHistoryViewModel()
    var body: some View {
        ScrollView(.vertical){
            LazyVStack{
                ForEach(viewmodel.dataModel.data){ item in
                    LeaveInfoCard(leaveDate: "\(item.fromD)-\(item.toD)", leaveName: item.name, reason: item.reason, alternateStatus: item.statusAlternate, HodStatus: item.statusHOD, approvalStatus:item.status)
                }
            }
                
                LeaveInfoCard(leaveDate: "", leaveName: "", reason: "", alternateStatus: 2, HodStatus: 1, approvalStatus: 0)
            
            Spacer()
        }
        
    }
}

#Preview {
    FacultyMyLeavesView()
}
