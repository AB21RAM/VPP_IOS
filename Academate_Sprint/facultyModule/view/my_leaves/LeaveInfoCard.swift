//
//  LeaveInfoCard.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

/*
 Images For Purpose
 checkmark.circle.trianglebadge.exclamationmark
 checkmark.circle.badge.xmark
 checkmark.circle.badge.questionmark
 checkmark.circle
 */
import SwiftUI

struct LeaveInfoCard: View {
    var leaveDate : String
    var leaveName : String
    var reason : String
    var alternateStatus : Int // 0 -> pending, 1 -> Success , 2 -> Decline
    var HodStatus : Int
    var approvalStatus : Int
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(leaveDate ?? "Leave date")
                .font(.title3)
            Text(leaveName ?? "Leave Name ")
                .font(.title)
            Text(reason ?? "Reason")
                .font(.headline)
            HStack {
                Text("Alternate Status")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                VStack{
                    Divider()
                        .frame(height: 5)
                        .overlay(.indigo)
                }
                if alternateStatus == 1 {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                        .font(.system(size: 20))
                }else if alternateStatus == 0{
                    Image(systemName: "checkmark.circle.badge.xmark")
                        .foregroundStyle(.red)
                        .font(.system(size: 20))
                }else{
                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                        .foregroundStyle(.orange)
                        .font(.system(size: 20))
                }
                
            }
            HStack {
                Text("HOD Status")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                VStack{
                    Divider()
                        .frame(height: 5)
                        .overlay(.indigo)
                }
                if HodStatus == 1 {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                        .font(.system(size: 20))
                }else if HodStatus == 0{
                    Image(systemName: "checkmark.circle.badge.xmark")
                        .foregroundStyle(.red)
                        .font(.system(size: 20))
                }else{
                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 20))
                }
            }
            HStack {
                Text("Approval Status")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                VStack{
                    Divider()
                        .frame(height: 5)
                        .overlay(.indigo)
                }
                
                if approvalStatus == 1 {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                        .font(.system(size: 20))
                }else if approvalStatus == 0{
                    Image(systemName: "checkmark.circle.badge.xmark")
                        .foregroundStyle(.red)
                        .font(.system(size: 20))
                }else{
                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 20))
                }
            }
        }
        .padding()
        .frame(alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
//        .shadow(radius: 10)
    }
}
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.indigo)
//            .frame(width:.infinity)
//            .foregroundColor(.indigo)
//            .shadow(radius: 10)
//            .overlay(
//                VStack{
//                    Text("Leave date")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.title3)
//                    Text("Leave Name ")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.title)
//                    Text("Reason")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.headline)
//                    HStack{
//                        Text("Alternate Status")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.title2)
//                        Image(systemName: "checkmark.rectangle")
//                            .foregroundStyle(.green)
//                    }
//                    HStack{
//                        Text("HOD Status")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.title2)
//                        Image(systemName: "checkmark.circle")
//                            .foregroundStyle(.green)
//                    }
//                    HStack{
//                        Text("Approval Status")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.title2)
//                        Image(systemName: "checkmark.rectangle")
//                            .foregroundStyle(.green)
//                    }
//                }
//            )
//    }
//}

#Preview {
    LeaveInfoCard(leaveDate: "", leaveName: "", reason: "", alternateStatus: 2, HodStatus: 1, approvalStatus: 0)
}
