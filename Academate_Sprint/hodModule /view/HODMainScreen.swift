//
//  HODMainScreen.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import SwiftUI

struct HODMainScreen: View {
    @StateObject var viewmodel = StudentProfileViewModel()
    @State private var dynamicContent: Int = 1
    @State var isNavigateMenu = false
    let userDefaultsManager = UserDefaultsManager.shared
    var body: some View {
        
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    VStack(spacing: 0){
                        //                    (spacing: 0)
                        VStack{
                            HStack{
                                Button {
                                    isNavigateMenu.toggle()
                                } label: {
                                    Image(systemName: "text.justifyright")
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
                                        .navigationDestination(isPresented: $isNavigateMenu) {
                                            HODNavigation()
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
                                        image: dynamicContent == 2 ? "academics_dark" : "academics_light",
                                        text: "Faculty",
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
                                        image: dynamicContent == 3 ? "payments_dark" : "payments_light",
                                        text: "Students",
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
                                    HODCountView()
                                        .padding()
                                }else if dynamicContent == 2 {
                                    HODFacultyListView()
                                        .padding()
                                }else if dynamicContent == 3 {
                                    HODStudentListView()
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
                        Text(viewmodel.profileDataModel.Name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
//                            .font(.custom("new", fixedSize: 20))
                            .bold()
                        
                        Text(userDefaultsManager.getEmail() ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
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
                .navigationBarBackButtonHidden(true)
                .task {
                    // Load data only when the view appears for the first time
                    if !viewmodel.isDataLoaded {
                        
                        viewmodel.getProfileData()
                        // Set the flag to indicate that data has been loaded
                        viewmodel.isDataLoaded = true
//                        userDefaultsManager.setCollegeID(viewmodel.homeDataModel.idNo)
                    }
                }
            }
        }
    }
}

#Preview {
    HODMainScreen()
}
