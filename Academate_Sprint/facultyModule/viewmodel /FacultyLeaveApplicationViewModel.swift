//
//  FacultyLeaveApplicationViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/03/24.
//

import Foundation
struct FacultyApplyLeaveDataModel{
    var leave_id: Int = Int()
    var half_full_day: String = String()
    var from_date: String = String()
    var to_date: String = String()
    var reason: String = String()
    var no_of_date: Double = Double()
    var alternate: Int = Int()
    var doc: String = String()
    var isLoading = false
    var isShowCompletion : Bool = false
    var errorMessage : String = String()
    var isShowError : Bool = false
    
    var alternateList : [FacultyNew] = []
    var altenateListName : [String] = []
    var leaveList : [LeaveType] = []
    var leaveListName : [String] = []
    
    
    var count : Int = 0
}
class FacultyLeaveApplicationViewModel : ObservableObject{
    let repository = FacultyRepository()
    let userDefaultsManager = UserDefaultsManager.shared
    @Published var dataModel = FacultyApplyLeaveDataModel()
    func postApplyLeave(){
        let leaveRequest = LeaveRequest(leave_id: dataModel.leave_id, half_full_day: dataModel.half_full_day, from_date: dataModel.from_date, to_date: dataModel.to_date, reason: dataModel.reason, no_of_date: dataModel.no_of_date, alternate: dataModel.alternate, uid: userDefaultsManager.getUid() ?? 0, doc: dataModel.doc)
        repository.postApplyLeave(leaveRequest: leaveRequest) { result in
            DispatchQueue.main.async {
                self.dataModel.isLoading = true
                if result == "Success"{
                    self.dataModel.isLoading = false
                    self.dataModel.isShowCompletion = true
                }else{
                    self.dataModel.errorMessage = result
                    self.dataModel.isShowError = true
                }
            }
        }
    }
    func getLeaveApplicationData(){
        repository.getFacultyLeaveData { result in
            if let result = result{
                DispatchQueue.main.async {
                    self.dataModel.isLoading = true
                    self.dataModel.alternateList = result.facultylist
                    self.dataModel.altenateListName = result.facultylist.map({ FacultyNew in
                        FacultyNew.name
                    })
                    self.dataModel.leaveList = result.leave_list
                    self.dataModel.leaveListName = result.leave_list.map({ LeaveType in
                        LeaveType.lname
                    })
                    self.dataModel.isLoading = false
                }
            }else{
                self.dataModel.errorMessage = "Some Error"
                self.dataModel.isShowError = true
            }
        }
    }
    func getFacultyAvailableLeaveCount(id : Int){
        repository.getFacultyLeaveCount(id: id) { result in
            if let result = result {
                DispatchQueue.main.async{
                    self.dataModel.count = result.ct
                }
            }
        }
    }

}
