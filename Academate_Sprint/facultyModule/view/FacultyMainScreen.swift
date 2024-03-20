//
//  FacultyMainScreen.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 02/03/24.
//

import SwiftUI

struct FacultyMainScreen: View {
    let userDefaultsManager = UserDefaultsManager.shared
    @StateObject var viewmodel = FacultyMainViewModel()
    @State var isNavigateMenu = false
    @State private var dynamicContent: Int = 1
    var body: some View {
        /*
        VStack{
            
            
            Text(userDefaultsManager.email?.lowercased() ?? "new")
                .font(Font.custom("GFSDidot-Regular", size: 30))
            //            .background(Color.blue)
            
            Text("Atharv ")
                .font(Font.custom("SourceSerif4-VariableFont_opsz,wght", size: 40, relativeTo: .body))
        }
         */
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    VStack(spacing: 0){
                        //                    (spacing: 0)
                        VStack{
//                            Image(systemName: "text.justifyright")
                            HStack{
                                Button {
                                    isNavigateMenu.toggle()
                                } label: {
                                    Image(systemName: "text.justifyright")
                                }
                                .navigationDestination(isPresented: $isNavigateMenu) {
                                    facultyNavigation()
                                }

                                Text("Profile")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title)
                                Button(
                                    action: {
                                        // do something
                                        userDefaultsManager.setIsLoggedIn(false)
                                        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.collegeID)
                                    },
                                    label: {
                                        VStack{
                                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                                .foregroundColor(.white)
                                            Text("Logout")
                                                .font(.caption)
                                        }
                                       
                                    }
                                )
                            }
                            
                        }
                        .foregroundStyle(Color.white)
                        .padding(.bottom,100)
                        .padding(20)
                        .frame(width: geometry.size.width, height: geometry.size.height * 2 / 12)
                        .background(Color("toolbar"))
                        VStack{
                            HStack {
                                Button(action: {
                                    dynamicContent = 1
                                }, label: {
                                    MainScreenButton(
                                        image: dynamicContent == 1 ? "profile_dark" : "profile_light",
                                        text: "Profile",
                                        cardbackground: dynamicContent == 1 ? Color("toolbar") : .white,
                                        textColor: dynamicContent == 1 ? .white : Color("toolbar"),
                                        imageBackground: dynamicContent == 1 ? .white:  Color("toolbar")
                                    )
                                })
                                .shadow(radius: 5)
                                .padding(.trailing , 12)
                                Button(action: {
                                    dynamicContent = 2
                                }, label: {
                                    MainScreenButton(
                                        image: dynamicContent == 2 ? "calender_dark" : "calender_light",
                                        text: "My Leaves",
                                        cardbackground: dynamicContent == 2 ? Color("toolbar") : .white,
                                        textColor: dynamicContent == 2 ? .white : Color("toolbar"),
                                        imageBackground: dynamicContent == 2 ? .white:  Color("toolbar")
                                    )
                                })
                                .shadow(radius: 5)
                                .padding(.trailing , 12)
                                
                                Button(action: {
                                    dynamicContent = 3
                                }, label: {
                                    MainScreenButton(
                                        image: dynamicContent == 3 ? "punch_dark" : "punch_light",
                                        text: "Punch Record",
                                        cardbackground: dynamicContent == 3 ? Color("toolbar") : .white,
                                        textColor: dynamicContent == 3 ? .white : Color("toolbar"),
                                        imageBackground: dynamicContent == 3 ? .white:  Color("toolbar")
                                    )
                                })
                                .shadow(radius: 5)
                                .padding(.trailing , 1)
                            }.padding(.top,70)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 3 / 12)
                        .background(Color("background"))
                        ScrollView{
                            VStack{
                                if dynamicContent == 1 {
                                    FacultyProfileView()
                                        .padding()
                                }else if dynamicContent == 2 {
                                    FacultyMyLeavesView()
                                        .padding()
                                }else if dynamicContent == 3 {
                                    FacultyPunchRecordView()
                                        .padding()
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        .frame(width: geometry.size.width, height: geometry.size.height * 7 / 12)
                        .background(Color("background"))
                    }
                    
                }
                HStack{
                    
                        // Display placeholder when URL string is empty
                        Image(systemName: "person.crop.rectangle.stack")
                            .resizable()
                            .frame(width: 110, height: 120)
                            .shadow(radius: 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 10)
                    

                    VStack{
                        Text("Name"/*viewmodel.profileDataModel.Name*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
//                            .font(.custom("new", fixedSize: 20))
                            .bold()
                        Text("ID"/*viewmodel.profileDataModel.idNo*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                        Text("Department"/*viewmodel.profileDataModel.year*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                            .bold()
                        Text(userDefaultsManager.getEmail() ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.caption2)
                    }
                    .foregroundStyle(Color("toolbar"))
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(.blue)
                }
                .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title3))
                .frame(maxWidth: .infinity, alignment: .leading)
//                .frame(width: 390,height: 200)
                .shadow(radius: 5)
                .padding(.top,30)
                .task {
                    viewmodel.getDashboardData()
                    viewmodel.getPunchRecord()
                    /*
                    // Load data only when the view appears for the first time
                    if !viewmodel.isDataLoaded {
                        
                        viewmodel.getProfileData()
                        // Set the flag to indicate that data has been loaded
                        viewmodel.isDataLoaded = true
//                        userDefaultsManager.setCollegeID(viewmodel.homeDataModel.idNo)
                    }
                    */
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
}

#Preview {
    FacultyMainScreen()
}
