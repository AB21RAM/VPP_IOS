//
//  StudentHomeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import SwiftUI
/// tobe -- Network Check
struct StudentHomeView: View {
    @ObservedObject var viewmodel = StudentHomeViewModel()
    @State private var dynamicContent: Int = 1
    let userDefaultsManager = UserDefaultsManager.shared
    var body: some View {
        
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    VStack(spacing: 0){
                        //                    (spacing: 0)
                        VStack{
                            HStack{
                                Text("Profile")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title)
                                Button(
                                    action: {
                                        // do something
                                        userDefaultsManager.setIsLoggedIn(false)
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
                                        image: dynamicContent == 2 ? "academics_dark" : "academics_light",
                                        text: "Academics",
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
                                        text: "Payments",
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
                                    ProfileView()
                                        .padding()
                                }else if dynamicContent == 2 {
                                    AcademicsView()
                                        .padding()
                                }else if dynamicContent == 3 {
                                    PaymentsView()
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
                    AsyncImage(url: URL(string: viewmodel.homeDataModel.photo)) { phase in
                        if let image = phase.image {
                            // Display the loaded image
                            image
                                .resizable()
                                .frame(width: 110, height: 120)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .shadow(radius: 10)
                                .aspectRatio(contentMode: .fit)
                        } else if phase.error != nil {
                            // Display a placeholder when loading failed
                            Image(systemName: "person.crop.rectangle.stack")
                                .resizable()
                                .frame(width: 110, height: 120)
                                .shadow(radius: 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                        } else {
                            // Display a placeholder while loading
                            ProgressView()
                                .frame(width: 110, height: 120)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                        }
                    }.padding(.trailing,10)
                    VStack{
                        Text(viewmodel.homeDataModel.Name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
//                            .font(.custom("new", fixedSize: 20))
                            .bold()
                        Text(viewmodel.homeDataModel.idNo)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                        Text(viewmodel.homeDataModel.year)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                            .bold()
                        Text(userDefaultsManager.getEmail() ?? "User Email")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
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
            }
        }
    }
}

#Preview {
    StudentHomeView()
}


