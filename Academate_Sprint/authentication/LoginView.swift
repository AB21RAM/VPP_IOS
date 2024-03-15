//
//  LoginView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct LoginView: View {
    @State private var showingSheet = false
    @State private var isNavigateToHOD = false
    @State private var userType : String = String()
    var body: some View {
        NavigationStack{
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 90, height: 100)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,40)
                    .padding(.top,70)
                Text("AcadeMate")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading ,40)
                
                //                Spacer()
                Text("Welcome")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,40)
                    .padding(.top,30)
                
                Text("Select The Login Option")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,40)
                    .padding(.bottom,20)
                
                HStack{
                    Button(action: {
                        showingSheet.toggle()
                        changeUserType(user: "Admission")
                    }, label: {
                        VStack {
                            Image("admission")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(15)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 15))
                            
                            
                            Text("Admission")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top,5)
                        }
                    }).padding(.trailing,20)
                    
                    Button(action: {
                        showingSheet.toggle()
                        changeUserType(user: "Student")
                    }, label: {
                        VStack {
                            Image("student")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 15))
                            
                            Text("Student")
                                .font(.headline)
                                .padding(.top,5)
                                .foregroundColor(.black)
                        }
                    }).padding(.leading,20)
                    Button(action: {
                        showingSheet.toggle()
                        changeUserType(user: "Faculty")
                    }, label: {
                        VStack {
                            Image("student")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 15))
                            
                            Text("Faculty")
                                .font(.headline)
                                .padding(.top,5)
                                .foregroundColor(.black)
                        }
                    }).padding(.leading,20)
                }
                HStack{
                    Button(action: {
//                        showingSheet.toggle()
                        isNavigateToHOD.toggle()
                        changeUserType(user: "HOD")
                    }, label: {
                        VStack {
                            Image("student")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 15))
                            
                            Text("HOD")
                                .font(.headline)
                                .padding(.top,5)
                                .foregroundColor(.black)
                        }
                    }).padding(.leading,20)
                }
                Spacer()
            }
            .navigationDestination(isPresented: $isNavigateToHOD, destination: {
                HODMainScreen()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color(UIColor(hex:0xEEEAF4, alpha: 1.0))                            .ignoresSafeArea()
            }
            .sheet(isPresented: $showingSheet) {
                BottomSheetView(user: $userType)
                    .presentationDetents([.height(400)])
                    .presentationCornerRadius(21)
            }
        }
    }
    func changeUserType(user : String) {
        userType = user
    }
    /*
     
     */
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
