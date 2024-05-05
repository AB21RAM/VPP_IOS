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
    var programmID : String = String()
    var presentCourseDetailsList : [DatumPresent] = []
    var category : String = String()
}
struct PresentCourseDataModel{
    var studentID : String = String()
    var selectedProgram : String = String()
    var selectedBranch : String = String()
    var seatType : String = String()
    var grNumber : String = String()
    var category : String = String()
}
struct AdmissionPreviousCourseDataModel {
    // MARK: -SSC
    var boardName: String = String()
    var sscMarks: String = String()
    var sscPass: String = String()
    var sscPercentage: String = String()
    var sscSeat: String = String()
    var uid: String = String()
    // MARK: -HSC
    var bioMarks: String = String()
    var cheMarks: String = String()
    var hscBoardName: String = String()
    var hscMarks: String = String()
    var hscPass: String = String()
    var hscPercentage: String = String()
    var hscSeat: String = String()
    var mathMarks: String = String()
    var phyMarks: String = String()
    var vocationalMarks: String = String()
    var vocationalSubject: String = String()
//    let uid: String
    // MARK: -Diploma
    var dipBoard: String = String()
    var dipCgpi: String = String()
    var dipCollegeName: String = String()
    var dipMarks: String = String()
    var dipPass: String = String()
    var dipPercentage: String = String()
    var dipSeat: String = String()
//    let uid: String
    
    
    var SSCcompleted : Bool = false
    var HSCcompleted : Bool = false
    var DiplomaCompleted : Bool = false
    
    var isDataAvailable : Bool = false
    var error : Bool = false
}
struct AdmissionEntranceDataModel{
    var appNumber: String = String()
    var chePer: String = String()
    var entranceName: String = String()
    var mathsPer: String = String()
    var overallPer: String = String()
    var phyPer: String = String()
    var rollNumber: String = String()
    var uid: String = String()
    
    var EntranceDetailsAdded : Bool = false
    var error : Bool = false
    
    var EntranceDetailsList : [EntranceDetailModel] = []
}
struct EntranceDetailModel : Identifiable {
    var id = UUID()
    var entranceID, studID: Int
    var entranceName, rollNumber, appNumber, phyPer: String
    var chePer, mathsPer, overallPer: String
}
struct AdmissionSemDataModel{
    var aggregate: String = String()
    var externalKt: String = String()
    var grade: String = String()
    var internalKt: String = String()
    var sem: String = String()
    var totalKt: String = String()
    var uid: String = String()
    
    var semDataAdded : Bool = false
    var error : Bool = false
    
    var semDetailList : [SemDetailModel] = []
}
struct SemDetailModel : Identifiable{
    var id = UUID()
    var aggregatedScore: String
    var externalKt: Int
    var gradeObtained: String
    var internalKt: Int
    var semId: Int
    var semNumber: Int
    var studId: Int
    var totalKt: Int
}

struct AdmissionDashBoardDataModel{
    var data :  [Datum] = []
    var isEnt : Bool = Bool()
    var isEdu : Bool = Bool()
    var isAdd : Bool = Bool()
    var isSem : Bool = Bool()
    var isSubmmited : Bool = Bool()
    
}
//struct AdmissionPresentCourseDataModel{
//    
//}
class AdmissionFormMainViewModel : ObservableObject {
    @Published var personalDataModel = PersonalDataModel()
    @Published var parentDataModel = AdmissionParentDataModel()
    @Published var addressDataModel = AdmissionAddressDataModel()
    @Published var mainDataModel = AdmissionMainDataModel()
    @Published var previousCourseDataModel = AdmissionPreviousCourseDataModel()
    @Published var entranceDataModel = AdmissionEntranceDataModel()
    @Published var semDataModel = AdmissionSemDataModel()
    @Published var dashboardDataModel = AdmissionDashBoardDataModel()
    @Published var presentCourseDatamodel = PresentCourseDataModel()
    
    private let apiResource = AdmissionFormApiResource()
    func getIsFinalSubmit(){
        apiResource.getIsSubmitted { result in
            DispatchQueue.main.async {
                self.mainDataModel.isFinalSubmit = ((result?.isSubmmited) != nil)
            }
        }
    }
    func getStudentDashBoard() {
        apiResource.getStudentDashboard { result in
            DispatchQueue.main.async {
                print("Programm id Viewmodel \(String(result?.data.last?.programmID ?? 0))")
                self.mainDataModel.programmID = String(result?.data.last?.programmID ?? 0)
                self.dashboardDataModel.data = result?.data ?? []
                self.dashboardDataModel.isAdd = ((result?.isAdd) != nil)
                self.dashboardDataModel.isEdu = ((result?.isEdu) != nil)
                self.dashboardDataModel.isEnt = ((result?.isEnt) != nil)
                self.dashboardDataModel.isSem = ((result?.isSem) != nil)
            }
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
                    print("Submitting parent Details \(String(describing: result?.message))")
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
                    print("Address Message \(String(describing: result?.message))")
                }else{
                    print("Address Message \(String(describing: result?.message))")
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
    // MARK: ---------------------
    func getPreviousCourseDetails(completion: @escaping (_ result: DatumNew?) -> Void) {
        apiResource.getPreviousCourseDetails{ result in
            DispatchQueue.main.async {
                if let result = result, !result.data.isEmpty {
                    self.previousCourseDataModel.isDataAvailable = true
//                    self.personalDataModel.NavigateParentDetails = true
                    completion(result.data.last)
                } else {
                    completion(nil)
                }
            }
        }
    }
    func postSSCDetails(){
        let request = SCCFormDataResponse(boardName: previousCourseDataModel.boardName, sscMarks: previousCourseDataModel.sscMarks, sscPass: previousCourseDataModel.sscPass, sscPercentage: previousCourseDataModel.sscPercentage, sscSeat: previousCourseDataModel.sscSeat, uid: previousCourseDataModel.uid)
        apiResource.postSSCDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "SSC Details are updated!"{
                    self.previousCourseDataModel.SSCcompleted = true
                    print("SSC Message \(String(describing: result?.message))")
                }else{
                    print("SSC Message \(String(describing: result?.message))")
                    self.previousCourseDataModel.error = true
                }
            }
        }
    }
    func postHSCDetails(){
        let request = HSCFormDataResponse(bioMarks: previousCourseDataModel.bioMarks, cheMarks: previousCourseDataModel.cheMarks, hscBoardName: previousCourseDataModel.hscBoardName, hscMarks: previousCourseDataModel.hscMarks, hscPass: previousCourseDataModel.hscPass, hscPercentage: previousCourseDataModel.hscPercentage, hscSeat: previousCourseDataModel.hscSeat, mathMarks: previousCourseDataModel.mathMarks, phyMarks: previousCourseDataModel.phyMarks, uid: previousCourseDataModel.uid, vocationalMarks: previousCourseDataModel.vocationalMarks, vocationalSubject: previousCourseDataModel.vocationalSubject)
        apiResource.postHSCDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "HSC Details are updated!"{
                    self.previousCourseDataModel.HSCcompleted = true
                    print("HSC Message \(String(describing: result?.message))")
                }else{
                    print("HSC Message \(String(describing: result?.message))")
                    self.previousCourseDataModel.error = true
                }
            }
        }
    }
    func postDiplomaDetails(){
        let request = DiplomaFormDataResponse(dipBoard: previousCourseDataModel.dipBoard, dipCgpi: previousCourseDataModel.dipCgpi, dipCollegeName: previousCourseDataModel.dipCollegeName, dipMarks: previousCourseDataModel.dipMarks, dipPass: previousCourseDataModel.dipPass, dipPercentage: previousCourseDataModel.dipPercentage, dipSeat: previousCourseDataModel.dipSeat, uid: previousCourseDataModel.uid)
        apiResource.postDiplomaDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Diploma Details are updated!"{
                    self.previousCourseDataModel.DiplomaCompleted = true
                    print("Diploma Message \(String(describing: result?.message))")
                }else{
                    print("Diploma Message \(String(describing: result?.message))")
                    self.previousCourseDataModel.error = true
                }
            }
        }
    }
    func postEntranceDetails(){
        let request = EntranceFormDataResponse(appNumber: entranceDataModel.appNumber, chePer: entranceDataModel.chePer, entranceName: entranceDataModel.entranceName, mathsPer: entranceDataModel.mathsPer, overallPer: entranceDataModel.overallPer, phyPer: entranceDataModel.phyPer, rollNumber: entranceDataModel.rollNumber, uid: entranceDataModel.uid)
        apiResource.postEntranceDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Entrance Details Added!, You can add more details or can go to next page."{
                    self.entranceDataModel.EntranceDetailsAdded = true
                    print("Entrance Message \(String(describing: result?.message))")
                }else{
                    print("Entrance Message \(String(describing: result?.message))")
                    self.entranceDataModel.error = true
                }
            }
        }
    }
    func getEntranceData(){
        apiResource.getEntranceDetails { result in
            DispatchQueue.main.async {
                if let result = result, !result.entrance.isEmpty {
                    self.entranceDataModel.EntranceDetailsList = result.entrance.map { data in
                        EntranceDetailModel(
                            entranceID: data.entranceID,
                            studID: data.studID,
                            entranceName: data.entranceName,
                            rollNumber: data.rollNumber,
                            appNumber: data.appNumber,
                            phyPer: data.phyPer,
                            chePer: data.chePer,
                            mathsPer: data.mathsPer,
                            overallPer: data.overallPer
                        )
                    }
                }
            }
        }
    }

    
    func postSemDetails(){
        let request = SemFormDataResponse(aggregate: semDataModel.aggregate, externalKt: semDataModel.externalKt, grade: semDataModel.grade, internalKt: semDataModel.internalKt, sem: semDataModel.sem, totalKt: semDataModel.totalKt, uid: semDataModel.uid)
        apiResource.postSemDetails(request: request) { result in
            DispatchQueue.main.async {
                if result?.message == "Semester Details Added!, You can add more details or can go to next page."{
                    self.semDataModel.semDataAdded = true
                    print("sem Message \(String(describing: result?.message))")
                }else{
                    print("sem Message \(String(describing: result?.message))")
                    self.semDataModel.error = true
                }
            }
        }
    }
    func getSemData(){
        apiResource.getSemDetails { result in
            DispatchQueue.main.async {
                if !(result?.entrance.isEmpty ?? false){
                    self.semDataModel.semDetailList = result?.entrance.map({ data in
                        SemDetailModel(aggregatedScore: data.aggregatedScore, externalKt: data.externalKt, gradeObtained: data.gradeObtained, internalKt: data.internalKt, semId: data.semId, semNumber: data.semNumber, studId: data.studId, totalKt: data.totalKt)
                    }) ?? []
                }
            }
        }
    }
    
    func getPresentData(){
        apiResource.getPresentCourseDetails { result in
            DispatchQueue.main.async {
                if !(result?.data.isEmpty ?? false){
                    print("Present Data is \(String(describing: result?.data))")
                    let data = result?.data.last
//                    var studentID : String = String()
//                    var selectedProgram : String = String()
//                    var selectedBranch : String = String()
//                    var seatType : String = String()
//                    var grNumber : String = String()
//                    var category : String = String()
                    let reverseBranchIDMap: [Int: String] = [
                        1: "Computer Engineering",
                        2: "Artificial Intelligence And Data Science",
                        4: "Information technology"
                    ]
                    let reverseProgramIDMap: [Int: String] = [
                        1: "First Year (F.Y B.E)",
                        2: "Direct Second Year (D.S.Y. B.E.)",
                        3: "Second Year (S.Y. B.E.)",
                        4: "Third Year (T.Y. B.E.)",
                        5: "Final Year (B.E. Final Year)"
                    ]
                    let reverseSeatIDMap: [Int: String] = [
                        1: "CAP",
                        2: "Institute Level",
                        3: "Against CAP"
                    ]
                    self.presentCourseDatamodel.studentID = data?.studClgID ?? ""
                    self.presentCourseDatamodel.selectedBranch = reverseBranchIDMap[data?.branchID ?? 0] ?? ""
                    self.presentCourseDatamodel.selectedProgram = reverseProgramIDMap[data?.programmID ?? 0] ?? ""
                    self.presentCourseDatamodel.seatType = reverseSeatIDMap[data?.seatTypeID ?? 0] ?? ""
                    self.presentCourseDatamodel.grNumber = data?.grNumber ?? ""
                    self.presentCourseDatamodel.category = result?.category ?? ""
                }
            }
        }
    }
    
}
