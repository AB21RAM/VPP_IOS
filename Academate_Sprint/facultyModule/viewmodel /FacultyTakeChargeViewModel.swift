//
//  FacultyTakeChargeViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/03/24.
//

import Foundation
struct FacultyTakeChargeDataModel{
    var leaves : [AlternateItem] = []
    var isLoading = false
    var error = false
    var status = Int()
    var appId = Int()
    var isShowCompletion : Bool = false
    var errorMessage : String = String()
    var isShowError : Bool = false
}

struct AlternateItem : Identifiable{
    var id = UUID()
    var fname = String()
    var reason = String()
    var fDate = String()
    var tDate = String()
    var nod = String()
    var fAppId = Int()
}
class FacultyTakeChargeViewModel : ObservableObject{
    let repository = FacultyRepository()
    @Published var dataModel = FacultyTakeChargeDataModel()
    func getList(){
        repository.getFacultyAlternateRequestList { result in
            if let result = result{
                DispatchQueue.main.async {
                    self.dataModel.isLoading = true
                    let data : [AlternateItem] = result.map { leave in
                        return AlternateItem(fname: leave.name,reason: leave.reason,fDate: self.dateFormatting(dateString: leave.fromDate),tDate: self.dateFormatting(dateString: leave.toDate),nod: String(leave.noOfDays),fAppId: leave.leaveAppID)
                    }
                    self.dataModel.leaves = data
                    self.dataModel.isLoading = false
                }
            }else{
                self.dataModel.isLoading = true
                self.dataModel.error = true
            }
        }
    }
    func postTakeCharge(){
        let alternateRequest = TakeChargeRequest(app_id: dataModel.appId, status: dataModel.status)
        print(alternateRequest)
        repository.postTakeCharge(takechargeRequest: alternateRequest) { result in
            DispatchQueue.main.async {
                print(" Result is \(result)")
                if result == "Success"{
                    self.dataModel.isShowCompletion = true
                }else{
                    self.dataModel.errorMessage = result
                    self.dataModel.isShowError = true
                }
            }
        }
    }
    func dateFormatting(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoDateFormatter.date(from: dateString) {
            let formattedDate = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
            return formattedDate
        } else {
            // Print the original date string for debugging
            print("Invalid date string: \(dateString)")
            return "" // or any default value you prefer
        }
    }
}
