//
//  ProfileView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyProfileView: View {
    var body: some View {
//        Text("Profile")
        ScrollView{
            Text("Available Leaves : ")
                .bold()
                .font(.title)
                .frame(alignment: .leading)
                .padding(.trailing,100)
            
            Grid{
                GridRow {
                    RoundedRectBox(year: "Casual", count: "0"/*dashboardViewModel.dashboardDataModel.firstYear*/,width: 150,height: 150)
                        .padding(.leading ,15)
                        .padding(.trailing ,10)
                        
                    RoundedRectBox(year: "Compensation", count: "0"/*dashboardViewModel.dashboardDataModel.secondYear*/,width: 150,height: 150)
                        .padding(.leading ,10)
                        .padding(.trailing ,15)
                }.padding(.bottom,20)
                GridRow{
                    RoundedRectBox(year: "Earned", count: "0"/*dashboardViewModel.dashboardDataModel.thirdYear*/,width: 150,height: 150)
                        .padding(.leading ,15)
                        .padding(.trailing ,10)
                    RoundedRectBox(year: "Medical", count: "0"/*dashboardViewModel.dashboardDataModel.fourthYear*/,width: 150,height: 150)
                        .padding(.leading ,10)
                        .padding(.trailing ,15)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
