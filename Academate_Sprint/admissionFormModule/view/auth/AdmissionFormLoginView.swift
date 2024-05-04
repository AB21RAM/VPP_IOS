//
//  AdmissionFormLoginView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 03/05/24.
//

import SwiftUI

struct AdmissionFormLoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var isSecure: Bool = true
    @State private var isNavigateToRegister: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Text("Admission Form Login")
                    .font(.title)
                    .underline()
                    .bold()
                HStack{
                    VStack{
                        Image("email")
                            .padding(18)
                            .scaledToFill()
                            .padding(.bottom,2)
                        
                        Image("pass")
                            .padding(18)
                            .padding(.bottom,2)
                        
                    }.background(Color(UIColor(hex:0x647AFF, alpha: 1.0)))
                    VStack{
                        TextField("Email", text: $loginViewModel.loginDataModel.userEmail)
                            .keyboardType(.emailAddress).autocapitalization(.none)
                            .padding(15)
                            .padding(.top,3)
                        Divider()
                            .padding(.trailing,10)
                            .foregroundColor(.black)
                        
                        HStack {
                            if isSecure{
                                SecureField("Password", text: $loginViewModel.loginDataModel.userPassword)
                                    .padding(18)
                            }
                            else{
                                TextField("Password", text: $loginViewModel.loginDataModel.userPassword)
                                    .padding(18)
                            }
                            
                            Spacer()
                            Button(action: {
                                isSecure.toggle()
                            }) {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8)
                        }
                    }
                }
                .background(.white)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.leading,15)
                .padding(.trailing,15)
                Button(action: {
                    isNavigateToRegister.toggle()
                }, label: {
                    Text("Don't have account ?\nRegister Now")
                        .padding(.top,10)
                })
                // For new User
                Button(action: {
                    if(loginViewModel.validateUserInputs()) {
                        
                        loginViewModel.authenticateUID()
                        
                    }
                }, label: {
                    Text("Log In")
                        .modifier(CardModifier(paddingValue: 10, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 10, foregroundColor: Color.white, font: .title3)).bold()
                })
                .alert(
                    isPresented: $loginViewModel.loginDataModel.isPresentingErorAlert, content: {
                        Alert(title: Text("Alert"), message: Text(loginViewModel.loginDataModel
                            .errorMessage), dismissButton: .cancel(Text("Ok")))
                    })
                
            }
            .navigationDestination(isPresented: $isNavigateToRegister) {
                    AdmissionFormRegisterView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color(UIColor(hex:0xEEEAF4, alpha: 1.0))
                        .ignoresSafeArea()
                )
            // For new User
            .navigationDestination(isPresented: $loginViewModel.loginDataModel.navigate) {
                    DashboardView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color(UIColor(hex:0xEEEAF4, alpha: 1.0))
                        .ignoresSafeArea()
                )
            
            
            
            
        }
    }
    
}
#Preview {
    AdmissionFormLoginView()
}
