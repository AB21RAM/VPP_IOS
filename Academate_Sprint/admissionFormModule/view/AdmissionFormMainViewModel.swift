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
struct AdmissionParentDataModel {
    var fatherCont: String = String()
    var fatherDesignation: String = String()
    var fatherEmail: String = String()
    var fatherFullName: String = String()
    var fatherIncome: String = String()
    var fatherOccupation: String = String()
    
    var guardianCont: String = String()
    var guardianDesignation: String = String()
    var guardianEmail: String = String()
    var guardianFullname: String = String()
    var guardianIncome: String = String()
    var guardianOccupation: String = String()
    
    var motherCont: String = String()
    var motherDesignation: String = String()
    var motherEmail: String = String()
    var motherFullName: String = String()
    var motherIncome: String = String()
    var motherOccupation: String = String()
    
    var uid: String = String()
    var NavigateAddressDetails : Bool = false
    var error : Bool = false
    var isDataAvailable : Bool = false
    
    var OTP : String = String()
}
struct AdmissionAddressDataModel{
    var address: String = String()
    var checked: String = String()
    var pAddress: String = String()
    var uid: String = String()
    
    var NavigateEduDetails : Bool = false
    var error : Bool = false
    var isDataAvailable : Bool = false
}
struct AdmissionMainDataModel {
    var isFinalSubmit : Bool = Bool()
}
class AdmissionFormMainViewModel : ObservableObject {
    @Published var personalDataModel = PersonalDataModel()
    @Published var parentDataModel = AdmissionParentDataModel()
    @Published var addressDataModel = AdmissionAddressDataModel()
    @Published var mainDataModel = AdmissionMainDataModel()
    private let apiResource = AdmissionFormApiResource()
    func getIsFinalSubmit(){
        apiResource.getIsSubmitted { result in
            
                self.mainDataModel.isFinalSubmit = ((result?.isSubmmited) != nil)
            
           
        }
    }
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
    
    func postParentDetails(){
        let request = ParentFormDataResponse(
            fatherCont: self.parentDataModel.fatherCont,
            fatherDesignation: self.parentDataModel.fatherDesignation,
            fatherEmail: self.parentDataModel.fatherEmail,
            fatherFullName: self.parentDataModel.fatherFullName,
            fatherIncome: self.parentDataModel.fatherIncome,
            fatherOccupation: self.parentDataModel.fatherOccupation,
            
            guardianCont: self.parentDataModel.guardianCont,
            guardianDesignation: self.parentDataModel.guardianDesignation,
            guardianEmail: self.parentDataModel.guardianEmail,
            guardianFullname: self.parentDataModel.guardianFullname,
            guardianIncome: self.parentDataModel.guardianIncome,
            guardianOccupation: self.parentDataModel.guardianOccupation,
            
            motherCont: self.parentDataModel.motherCont,
            motherDesignation: self.parentDataModel.motherDesignation,
            motherEmail: self.parentDataModel.motherEmail,
            motherFullName: self.parentDataModel.motherFullName,
            motherIncome: self.parentDataModel.motherIncome,
            motherOccupation: self.parentDataModel.motherOccupation,
            
            uid: self.parentDataModel.uid
        )
        apiResource.postParentDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Parent Details Are saved!" || result?.message == "Parent Details Are Updated!"{
                    self.parentDataModel.NavigateAddressDetails = true
                }else{
                    print("Submitting parent Details \(result?.message)")
                    self.parentDataModel.error = true
                }
            }
        }

    }
    func getParentDetails(completion: @escaping (_ result: [RaddParent]?) -> Void) {
        apiResource.getParentDetails { result in
            DispatchQueue.main.async {
                if let result = result, result.code == 1 {
                    self.parentDataModel.isDataAvailable = true
//                    self.personalDataModel.NavigateParentDetails = true
                    completion(result.radd)
                } else {
                    completion(nil)
                }
            }
        }
    }
    func getOPTDetails(phone : String){
        apiResource.getOTPDetails(phone: phone) { result in
            DispatchQueue.main.async {
                if result?.message == "OTP Sent to the given Number!"{
                    self.parentDataModel.OTP = result?.otp ?? ""
                }
            }
        }
    }
    
    func postAddressDetails(){
        let request = AddressFormDataResponse(address: addressDataModel.address, checked: addressDataModel.checked, pAddress: addressDataModel.pAddress, uid: addressDataModel.uid)
        apiResource.postAddressDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Address Details Are saved!"{
                    self.addressDataModel.NavigateEduDetails = true
                    print("Address Message \(result?.message)")
                }else{
                    print("Address Message \(result?.message)")
                    self.addressDataModel.error = true
                }
            }
        }
    }
    
    func getAddressDetails(completion: @escaping (_ result: AddressDetailsGetResponse?) -> Void) {
        apiResource.getAddressDetails{ result in
            DispatchQueue.main.async {
                if let result = result, result.code == 1 {
                    self.addressDataModel.isDataAvailable = true
//                    self.personalDataModel.NavigateParentDetails = true
                    completion(result)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    
}
