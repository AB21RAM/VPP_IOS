//
//  HomeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI
import LottieUI
struct HomeView: View {
    @ObservedObject var dashboardViewModel = DashBoardViewModel()
    @State private var showSheet = false
    @Environment(\.presentationMode) var presentationMode
    let userDefaultsManager = UserDefaultsManager.shared
    var uid_new: Int {
        return userDefaultsManager.getUid() ?? 0
    }
    var body: some View {
        NavigationStack{
            VStack{
                //                Text("user uid is \(uid_new)")
                if(dashboardViewModel.dashboardDataModel.isError){
                    ErrorView()
                }else if dashboardViewModel.dashboardDataModel.isLoading{
                    LottieView("newLoading")
                        .loopMode(.loop)
                }
                else{
                    ScrollView{
                        Text("Total Applications :")
                            .bold()
                            .font(.title)
                            .frame(alignment: .leading)
                            .padding(.trailing,100)
                        
                        Grid{
                            GridRow {
                                RoundedRectBox(year: "First Year", count: dashboardViewModel.dashboardDataModel.firstYear,width: 150,height: 150)
                                    .padding(.leading ,15)
                                    .padding(.trailing ,10)
                                RoundedRectBox(year: "Second Year", count: dashboardViewModel.dashboardDataModel.secondYear,width: 150,height: 150)
                                    .padding(.leading ,10)
                                    .padding(.trailing ,15)
                            }.padding(.bottom,20)
                            GridRow{
                                RoundedRectBox(year: "Third Year", count: dashboardViewModel.dashboardDataModel.thirdYear,width: 150,height: 150)
                                    .padding(.leading ,15)
                                    .padding(.trailing ,10)
                                RoundedRectBox(year: "Fourth Year", count: dashboardViewModel.dashboardDataModel.fourthYear,width: 150,height: 150)
                                    .padding(.leading ,10)
                                    .padding(.trailing ,15)
                            }
                        }
                        
                        
                        RoundedRectBox(year: "Direct Second Year", count: dashboardViewModel.dashboardDataModel.dSecondYear,width: 320,height: 120)
                            .padding(20)
                        Divider()
                        /*
                         Button(
                         action: {
                         // do something
                         userDefaultsManager.setIsLoggedIn(false)
                         },
                         label: { Text("Logout") }
                         )
                         */
                        /*
                         NavigationLink(destination: csv_test(branch: 1)) {
                         // Button or any other view triggering the navigation
                         Text("CSV")
                         .padding()
                         .background(Color.blue)
                         .foregroundColor(.white)
                         .cornerRadius(10)
                         }
                         Link("Info", destination: URL(string: "https://vppcoe-va.getflytechnologies.com/api/admission/pendingAppD?brach=1")!)
                         */
                        NavigationLink(destination: DepartmentsView()) {
                            // Button or any other view triggering the navigation
                            Text("View Department Application")
                                .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 10, foregroundColor: .white, font: .title3))
                        }
                        Button(action: {
                            showSheet.toggle()
                        }, label: {
                            Text("Download Applications")
                                .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 10, foregroundColor: .white, font: .title3))
                        })
                        .sheet(isPresented: $showSheet) {
                            //                        RadioButtonGroup(items: ["Rome", "London", "Paris", "Berlin", "New York"], callback: { selected in
                            //                            print("Selected is: \(selected)")
                            //                        },)
                            HStack{
                                VStack{
                                    Text("Select Department")
                                        .padding(.bottom,10)
                                    RadioButtonGroup(items: ["COMPUTER","AIDS","EXTC","IT"], selectedId: "COMPUTER", callback: { selected in
                                        print("Selected is: \(selected)")
                                    }).padding(.leading,30)
                                }
                                VStack{
                                    Text("Select Year")
                                        .padding(.bottom,10)
                                    RadioButtonGroup(items: ["All","First Year","Second Year","Third Year","Final Year","Direct Second Year"], selectedId: "All", callback: { selected in
                                        print("Selected is: \(selected)")
                                    }).padding(.leading,50)
                                }
                                
                            }
                            
                            .presentationDetents([.medium, .large])
                            .presentationCornerRadius(50)
                        }
                    }.toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text("Admission DashBoard")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(height: 50)
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            Button(
                                action: {
                                    // do something
                                    userDefaultsManager.setIsLoggedIn(false)
                                },
                                label: { Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(.white) }
                            )
                            
                        }
                    })
                    .toolbarBackground(
                        Color(UIColor(hex:0x160747, alpha: 1.0)),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .automatic)
                }
                
                
            }.background(Color(UIColor(hex:0xEEEAF4, alpha: 1.0)))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
