//
//  ProfileView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyProfileView: View {
    @StateObject var viewmodel = FacultyDashboardViewModel()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
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
                    ScrollView {
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(viewmodel.dataModel.leaves) { item in
                                        VStack{
                                            Text(item.name)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                                .padding(5)
                                            Text(item.value)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                                .padding(5)
                                        }
                                        
                                    }
                                }
                                .padding()
                            }
                    /*
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
                    
                    */
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
