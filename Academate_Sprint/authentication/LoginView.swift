//
//  LoginView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("useremail", text: $loginViewModel.loginDataModel.userEmail)
                    .keyboardType(.emailAddress).autocapitalization(.none)
                SecureField("password", text: $loginViewModel.loginDataModel.userPassword)
                
                NavigationLink(
                    destination: HomeView(),
                    isActive: $loginViewModel.loginDataModel.navigate,
                    label: {
                        Button(action: {
                            if(loginViewModel.validateUserInputs()) {
                                loginViewModel.authenticateUser()
                            }
                        }, label: {
                            Text("Login")
                        }).alert(isPresented: $loginViewModel.loginDataModel.isPresentingErorAlert, content: {
                            Alert(title: Text("Alert"), message: Text(loginViewModel.loginDataModel
                                .errorMessage), dismissButton: .cancel(Text("Ok")))
                        })
                    }
                )
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
