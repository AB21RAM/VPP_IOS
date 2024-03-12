//
//  ProfileView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyProfileView: View {
    @State private var isNavigateApplyLeave = false
    @State private var isNavigateAlternate = false
    var body: some View {
        NavigationStack{
            
            
            //        Text("Profile")
            ScrollView{
                Text("Available Leaves : ")
                    .bold()
                    .font(.title)
                    .frame(alignment: .leading)
                    .padding(.trailing,100)
                VStack{
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
                    HStack{
                        Button {
                            isNavigateApplyLeave.toggle()
                        } label: {
                            VStack{
                                Text("Apply Leave")
                                    .modifier(CardModifier(paddingValue: 10, backgroundColor: .blue, cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                            }
                        }.navigationDestination(isPresented: $isNavigateApplyLeave) {
                            FacultyLeaveAppView()
                        }
                        Button {
                            isNavigateAlternate.toggle()
                        } label: {
                            VStack{
                                Text("Take Charge")
                                    .modifier(CardModifier(paddingValue: 10, backgroundColor: .blue, cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                            }
                        }.navigationDestination(isPresented: $isNavigateAlternate) {
                            FacultyTakeChargeView()
                        }
                    }
                    
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
