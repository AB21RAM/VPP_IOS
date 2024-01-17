//
//  HomeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dashboardViewModel = DashBoardViewModel()
    
    let userDefaultsManager = UserDefaultsManager.shared
    var uid_new: Int {
            return userDefaultsManager.getUid() ?? 0
        }
    var body: some View {
        NavigationView{
            VStack{
                Text("user uid is \(uid_new)")
                if(dashboardViewModel.dashboardDataModel.isError){
                    ErrorView()
                }else{
                    Text("Total Application")
                    List{
                        year_data(year: "Fisrt Year", count: dashboardViewModel.dashboardDataModel.firstYear)
                        year_data(year: "Second Year", count: dashboardViewModel.dashboardDataModel.secondYear)
                        year_data(year: "Direct Second Year", count: dashboardViewModel.dashboardDataModel.dSecondYear)
                        year_data(year: "Third Year", count: dashboardViewModel.dashboardDataModel.thirdYear)
                        year_data(year: "Fourth Year", count: dashboardViewModel.dashboardDataModel.fourthYear)
                    }
                    .listStyle(.plain)
                    Button(
                        action: {
                            // do something
                            userDefaultsManager.setIsLoggedIn(false)
                        },
                        label: { Text("Logout") }
                    )
                    NavigationLink(destination: csv_test()) {
                                       // Button or any other view triggering the navigation
                                       Text("CSV")
                                           .padding()
                                           .background(Color.blue)
                                           .foregroundColor(.white)
                                           .cornerRadius(10)
                                   }
//                    Button(
//                        action:{
//
//                        }
//                        , label:{
//                            Text("CSV Screen")
//                        }
//                    )
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
