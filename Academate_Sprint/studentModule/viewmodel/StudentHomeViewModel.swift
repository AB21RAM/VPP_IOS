//
//  StudentHomeViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

struct semDataItem: Identifiable{
    var id = UUID()
    var semNumber: Int
    var aggregatedScore: String
}
struct HomeDataModel{
    var Name : String = String()
    var ContactNumber : String = String()
    
    var idNo : String = String()
    //    var email : String = String()
    
    var year : String = String()
    var department : String = String()
    
    var grNo : String = String()
    var dob : String = String()
    
    var acYear : String = String()
    var caste : String = String()
    
    var semData : [semDataItem] = []
    
    var isEnt : Bool = false
    var isSem : Bool = false
    
    var photo : String = String()
    
    var isError: Bool = false
    
    var isLoadingPer : Bool = true
    var isLoadingCurr : Bool = true
    
    var isLoadingPhoto: Bool = true
    
    var isLoadingSemData: Bool = true
}
import Foundation
class StudentHomeViewModel : ObservableObject{
    @Published var homeDataModel: HomeDataModel = HomeDataModel()
    private let apiResource = StudentApiResource()
    init() {
        getPersonalData()
        getCurrEduData()
        getStudentPhoto()
        getSemData()
        getStudentDashBoard()
    }
    func getPersonalData(){
        self.homeDataModel.isLoadingPer = true
        apiResource.getStudentPersonalDetails() { response in
            DispatchQueue.main.async {
                if response?.code != 0 {
                    self.homeDataModel.isLoadingPer = false
                    self.homeDataModel.Name = response?.radd.first?.name ?? "Name"
                    let dateString = response?.radd.first?.dob
                    let isoDateFormatter = ISO8601DateFormatter()
                    // Add support for milliseconds in the date format
                    isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    if let dateString = dateString, let date = isoDateFormatter.date(from: dateString) {
                        let formattedDate = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
                        let substring = String(formattedDate.prefix(11))
                        self.homeDataModel.dob = substring
                        print(substring)
                    } else {
                        // Print the original date string for debugging
                        print("Invalid date string: \(dateString ?? "nil")")
                    }
                    
                    self.homeDataModel.ContactNumber = response?.radd.first?.contact ?? "Error"
                }else{
                    self.homeDataModel.isError = true
                }
            }
        }
    }
    func getCurrEduData(){
        self.homeDataModel.isLoadingCurr = true
        apiResource.getStudentCurrEduDetails() { response in
            DispatchQueue.main.async {
                if response?.category != nil {
                    self.homeDataModel.isLoadingCurr = false
                    
                    self.homeDataModel.grNo = response?.data.first?.grNumber ?? "00"
                    self.homeDataModel.caste = response?.category ?? "Category"
                    self.homeDataModel.idNo = response?.data.first?.studClgID ?? "ID No."
                    self.homeDataModel.acYear = response?.data.first?.academicYear ?? "Academic Year"
                    if(response?.data.first?.branchID == 1){
                        self.homeDataModel.department = "Computer Engineering"
                    }
                    else if(response?.data.first?.branchID == 2){
                        self.homeDataModel.department = "AI & DS"
                    }
                    else if(response?.data.first?.branchID == 4){
                        self.homeDataModel.department = "Information Technology"
                    }
                    else {
                        self.homeDataModel.department = "Department"
                    }
                    if(response?.data.first?.programmID == 1){
                        self.homeDataModel.year = "F.Y. B.E"
                    }
                    else if(response?.data.first?.programmID == 2){
                        self.homeDataModel.year = "D.S.E"
                    }
                    else if(response?.data.first?.programmID == 3){
                        self.homeDataModel.year = "S.E"
                    }
                    else if(response?.data.first?.programmID == 4){
                        self.homeDataModel.year = "T.E"
                    }
                    else if(response?.data.first?.programmID == 5){
                        self.homeDataModel.year = "B.E"
                    }
                    else{
                        self.homeDataModel.year = "Year"
                    }
                }else{
                    self.homeDataModel.isError = true
                }
            }
        }
    }
    func getStudentPhoto(){
        self.homeDataModel.isLoadingPhoto = true
        apiResource.getStudentDocs(){ response in
            DispatchQueue.main.async{
                self.homeDataModel.isLoadingPhoto = false
                self.homeDataModel.photo = response?.docs.photo ?? "Error"
            }
        }
    }
    func getSemData(){
        self.homeDataModel.isLoadingSemData = true
        apiResource.getStudentSemDetails(){ response in
            DispatchQueue.main.async{
                if((response?.entrance.isEmpty) != nil){
                    self.homeDataModel.isLoadingSemData = false
    //                print("Response is \(String(describing: response))")
                    self.homeDataModel.semData = response?.entrance.map{item in
                        semDataItem(semNumber: item.semNumber, aggregatedScore: item.aggregatedScore)
                    } as! [semDataItem]
                    
                    print("\(self.homeDataModel.semData)")
                }
                else{
                    self.homeDataModel.isError = true
                }
                
            }
        }
    }
    func getStudentDashBoard(){
        apiResource.getStudentDashboard(){ response in
            DispatchQueue.main.async {
                self.homeDataModel.isSem = ((response?.isSem) != nil)
            }
        }
    }
}
