//
//  ProfileView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/01/24.
//

import SwiftUI
import Lottie
import LottieUI

struct ProfileView: View {
    @StateObject var viewmodel = StudentHomeViewModel()
    
    var body: some View {
        VStack{
            if(viewmodel.homeDataModel.isLoadingPer && viewmodel.homeDataModel.isLoadingCurr){
                LottieView("newLoading")
                    .loopMode(.loop)
            }else{
                Text("Personal Info:")
                    .underline()
                    .bold()
                    .font(.title2)
                    .frame(maxWidth: .infinity,alignment: .leading)
                VStack{
                    Text("Department :")
                        .font(.headline)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text(viewmodel.homeDataModel.department)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Divider()
                        .background(Color.black)
                    HStack{
                        VStack{
                            Text("GR No. :")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(viewmodel.homeDataModel.grNo)
                                .font(.title3)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        Divider()
                            .background(Color.black)
                        VStack{
                            Text("DOB :")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(viewmodel.homeDataModel.dob)
                                .font(.title3)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                    }
                    Divider()
                        .background(Color.black)
                    HStack{
                        VStack{
                            Text("Academic Year :")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(viewmodel.homeDataModel.acYear)
                                .font(.title3)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        Divider()
                            .background(Color.black)
                        VStack{
                            Text("Category :")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(viewmodel.homeDataModel.caste)
                                .font(.title3)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                    }
                }
                .modifier(CardModifier(paddingValue: 0, backgroundColor: Color.white, cornerRadius: 10, foregroundColor: Color("toolbar"), font: Font.caption))
                /// MARK : Need to Add the check for enterance details
                if(viewmodel.homeDataModel.isSem){
                    Text("Academic Score:")
                        .font(.title2)
                        .bold()
                        .underline()
                        .frame(maxWidth: .infinity,alignment: .leading)
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .top, spacing: 10) {
                            // MARK : This is where List need to insert
                            ForEach(viewmodel.homeDataModel.semData , id: \.id) { item in
                                VStack{
                                    Text("Semester: \(item.semNumber)")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    Text("Score: \(item.aggregatedScore)")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .bold()
                                }
                                .modifier(CardModifier(paddingValue: 10, backgroundColor: .white, cornerRadius: 15, foregroundColor: Color("toolbar"), font: .title2))
                            }
                        }
                    }
                }

            }
        }.task {
            // Load data only when the view appears for the first time
            if !viewmodel.isDataLoaded {
                viewmodel.getStudentDashBoard()
                viewmodel.getHomeData()
//                viewmodel.getCurrEduData()
                // Set the flag to indicate that data has been loaded
                viewmodel.isDataLoaded = true
                print(UserDefaultsManager().getCollegeID() ?? "")
            }
        }
    }
}

#Preview {
    ProfileView()
}
// Dummy Data
struct CustomListItem: Identifiable {
    let id: UUID
    let name: String
}

let customList: [CustomListItem] = [
    CustomListItem(id: UUID(), name: "Item 1"),
    CustomListItem(id: UUID(), name: "Item 2"),
    CustomListItem(id: UUID(), name: "Item 3"),
    CustomListItem(id: UUID(), name: "Item 3")
]
