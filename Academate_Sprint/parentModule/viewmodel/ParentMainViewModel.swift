//
//  ParentMainViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct ParentDataModel{
    var attedance : [studentParentAttendanceListItem] = []
    var isLoading : Bool = true
    var isError : Bool = false
}
class ParentMainViewModel : ObservableObject{
    @Published var ParentMainScreenDataModel : ParentDataModel = ParentDataModel()
    private let repository = ParentRepository()
    func getGateAttendance(fromDate : String , toDate : String){
        self.ParentMainScreenDataModel.isLoading = true
        repository.getGateAttendance(fromdate: fromDate, toDate: toDate) { result in
            DispatchQueue.main.async {
                if !result.isEmpty {
                    self.ParentMainScreenDataModel.isLoading = false
                    self.ParentMainScreenDataModel.attedance = result
                }else{
                    // stoping the loading
                    self.ParentMainScreenDataModel.isLoading = false
                    self.ParentMainScreenDataModel.isError = true
                }
            }
        }
    }
}
