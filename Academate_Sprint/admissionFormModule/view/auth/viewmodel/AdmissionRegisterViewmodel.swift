//
//  AdmissionRegisterViewmodel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct AdmissionFormDataModel{
    var branch: Int = Int()
    var capApp: String = String()
    var clgId: String = String()
    var cnfpassword: String = String()
    var email: String = String()
    var grNumber: String = String()
    var password: String = String()
    var seatType: Int = Int()
    var selectedProgram: Int = Int()
    var navigateToLogin : Bool = false
    var error : Bool = false
    var nonMatchingPassword : Bool = false
}
class AdmissionRegisterViewmodel : ObservableObject{
    @Published var datamodel = AdmissionFormDataModel()
    private let apiResource = AdmissionFormApiResource()
    func signup() {
        let request = FormDataSignUp(branch: datamodel.branch, capApp: datamodel.capApp, clgId: datamodel.clgId, cnfpassword: datamodel.cnfpassword, email: datamodel.email, grNumber: datamodel.grNumber, password: datamodel.password, seatType: datamodel.seatType, selectedProgram: datamodel.selectedProgram)
        apiResource.postSignUp(request: request) { result in
            DispatchQueue.main.async {
                print(result?.message ?? "Response")
                print("College ID \(self.datamodel.clgId)")
                print("branch ID \(self.datamodel.branch)")
                print("Seat Type ID \(self.datamodel.seatType)")
                if result?.message == "SignUp Done! Go to login page for the further process"{
                    self.datamodel.navigateToLogin = true
                }else if result?.message == "Password and confirm Password should be same"{
                    self.datamodel.nonMatchingPassword = true
                }else{
                    self.datamodel.error = true
                }
            }
        }
    }
}
