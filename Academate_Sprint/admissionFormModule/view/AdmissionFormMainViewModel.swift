//
//  AdmissionFormMainViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct PersonalDataModel {
    var aadharNumber: String = String()
    var bankAccountNumber: String = String()
    var bankName: String = String()
    var caste: String = String()
    var childNumber: Int = Int()
    var community: String = String()
    var contact: String = String()
    var dob: String = String()
    var fullName: String = String()
    var gender: Int = Int()
    var lastCollege: String = String()
    var minority: String = String()
    var nationality: String = String()
    var pob: String = String()
    var religion: String = String()
    var status: Int = Int()
    var subCaste: String = String()
    var uid: Int = Int()
    var NavigateParentDetails : Bool = false
    var error : Bool = false
    var isDataAvailable : Bool = false
}
class AdmissionFormMainViewModel : ObservableObject {
    @Published var personalDataModel = PersonalDataModel()
    private let apiResource = AdmissionFormApiResource()
    func postPersonalDetails(){
        let request = PersonalDetailsFormDataResponse(
            aadharNumber: personalDataModel.aadharNumber,
            bankAccountNumber: personalDataModel.bankAccountNumber,
            bankName: personalDataModel.bankName,
            caste: personalDataModel.caste,
            childNumber: personalDataModel.childNumber,
            community: personalDataModel.community,
            contact: personalDataModel.contact,
            dob: personalDataModel.dob,
            fullName: personalDataModel.fullName,
            gender: personalDataModel.gender,
            lastCollege: personalDataModel.lastCollege,
            minority: personalDataModel.minority,
            nationality: personalDataModel.nationality,
            pob: personalDataModel.pob,
            religion: personalDataModel.religion,
            status: personalDataModel.status,
            subCaste: personalDataModel.subCaste,
            uid: personalDataModel.uid
        )
        apiResource.postPersonalDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Personal Details Are Updated!" || result?.message == "Personal Details Are saved!"{
                    self.personalDataModel.NavigateParentDetails = true
                }else{
                    self.personalDataModel.error = true
                }
            }
        }
    }
    func getPersonalDetails(completion: @escaping (_ result: RaddNew?) -> Void) {
        apiResource.getPersonalDetails { result in
            DispatchQueue.main.async {
                if let result = result, result.code == 1 {
                    self.personalDataModel.isDataAvailable = true
//                    self.personalDataModel.NavigateParentDetails = true
                    completion(result.radd.first)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
