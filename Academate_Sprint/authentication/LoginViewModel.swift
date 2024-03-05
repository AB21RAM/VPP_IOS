//
//  LoginViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation

struct LoginDataModel {
    var userEmail: String = String()
    var userPassword: String = String()
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErorAlert: Bool = false
}

class LoginViewModel: ObservableObject {
    @Published var loginDataModel: LoginDataModel = LoginDataModel()
    private let loginValidation = LoginValidation()
    private let apiResource = LoginEndpoint()
    let userDefaultsManager = UserDefaultsManager.shared
    
    func validateUserInputs() -> Bool {
        let result = loginValidation.validateUserInputs(userEmail: loginDataModel.userEmail, userPassword: loginDataModel.userPassword)
        if(result.success == false) {
            loginDataModel.errorMessage = result.errorMessage ?? "Error Occurred"
            loginDataModel.isPresentingErorAlert = true
        }
        return true
    }
    
    func authenticateUID() {
        let loginRequest = LoginRequest(email: loginDataModel.userEmail, password: loginDataModel.userPassword)
        apiResource.uid_authenticate(loginREquest: loginRequest) { response in
            DispatchQueue.main.async {
               
                if(response?.message == "Success") {
                    self.loginDataModel.navigate = true
                    self.saveUserLoginData(
                        email: self.loginDataModel.userEmail,
                        uid: response?.uid ?? 0,
                        isLogin: response?.isLogin ?? false,
                        user_type: response?.userType ?? 0
                    )
                } else {
                    self.loginDataModel.errorMessage = response?.message ?? "error occured"
                    self.loginDataModel.isPresentingErorAlert = true
                }
                print(response?.message as Any)
                print("output is \(String(describing: response?.uid))")
            }
        }
    }
    func authenticateToken() {
        let loginRequest = LoginRequest(email: loginDataModel.userEmail, password: loginDataModel.userPassword)
        
        apiResource.token_authenticate(loginREquest: loginRequest) { response in
            DispatchQueue.main.async {
                if(response?.message == "Logged in successfully") {
                    self.loginDataModel.navigate = true
                    self.userDefaultsManager.setToken(response?.androidToken ?? "ok")
                    print(self.userDefaultsManager.getToken()!)
                    self.userDefaultsManager.setUserType(4)
                    self.userDefaultsManager.setEmail(self.loginDataModel.userEmail)
                    self.userDefaultsManager.setIsLoggedIn(true)
                    UserDefaults.standard.synchronize()
                } else {
                    self.loginDataModel.errorMessage = response?.message ?? "error occured"
                    self.loginDataModel.isPresentingErorAlert = true
                }
                print(response?.message as Any)
                print("output is \(String(describing: response?.androidToken))")
            }
        }
    }
    func saveUserLoginData(email : String ,uid : Int , isLogin : Bool , user_type : Int){
        userDefaultsManager.setEmail(email)
        userDefaultsManager.setUid(uid)
        userDefaultsManager.setUserType(user_type)
        userDefaultsManager.setIsLoggedIn(true)
    }
        
}
