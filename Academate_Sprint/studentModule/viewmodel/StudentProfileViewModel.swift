//
//  StudentProfileViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 17/02/24.
//

import Foundation
struct ProfileDataModel{
    var Name : String = String()
    var idNo : String = String()
    var email : String = String()
    var year : String = String()
    
    var ContactNumber : String = String()
    var isError: Bool = false
    var isLoadingPhoto: Bool = true
    var isLoadingPer : Bool = true
    var isLoadingCurr : Bool = true
    var photo : String = String()
}
class StudentProfileViewModel : ObservableObject{
    @Published var profileDataModel : ProfileDataModel = ProfileDataModel()
    @Published var isDataLoaded: Bool = false
    private let repository = StudentRepository()
    func getProfileData(){
        self.profileDataModel.isLoadingPer = true
        repository.getPersonalData{ data in
            DispatchQueue.main.async {
                if data != nil {
                    self.profileDataModel.isLoadingPer = false
                    self.profileDataModel.Name = data?.Name ?? "Name"
//                    self.profileDataModel.dob = data?.dob ?? "DOB"
                    self.profileDataModel.ContactNumber = data?.ContactNumber ?? "Contact"
                    } else {
                        self.profileDataModel.isError = true
                    }
            }
        }
        self.profileDataModel.isLoadingCurr = true
        repository.getCurrEduData{ data in
            DispatchQueue.main.async {
                if data != nil{
                    self.profileDataModel.isLoadingCurr = false
//                    self.homeDataModel.grNo = data?.gr ?? "GR"
//                    self.homeDataModel.caste = data?.caste ?? "Category"
                    self.profileDataModel.idNo  = data?.idNo ?? "ID"
//                    self.homeDataModel.acYear = data?.acYear ?? "AY"
//                    self.homeDataModel.department = data?.branch ?? "Department"
                    self.profileDataModel.year = data?.program ?? "Year"
                }else{
                    self.profileDataModel.isError = true
                }
            }
        }
        self.profileDataModel.isLoadingPhoto = true
        repository.getStudentPhoto{data in
            DispatchQueue.main.async{
                if data != nil{
                    self.profileDataModel.photo = data?.photoUrl ?? ""
                }
            }
        }
        
    }
}
