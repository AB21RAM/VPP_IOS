//
//  FacultyLeaveHistoryViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 20/03/24.
//

import Foundation
struct FacultyLeaveHistoryDataModel{
    var data : [HistoryItem] = []
    var isLoading = false
    var error = false
}
struct HistoryItem : Identifiable{
    var id = UUID()
    var leaveAppID = String()
    var fromD = String()
    var toD = String()
    var reason = String()
    var status = Int()
    var statusAlternate  = Int()
    var statusHOD = Int()
    var name = String()
}
class FacultyLeaveHistoryViewModel : ObservableObject{
    let repository = FacultyRepository()
    @Published var dataModel = FacultyLeaveHistoryDataModel()
    func getLeaveHistory() {
            // Set isLoading to true before making the network call
            self.dataModel.isLoading = true

            repository.getFacultyLeaveHistory { result in
                DispatchQueue.main.async {
                    if let result = result {
                        let data: [HistoryItem] = result.leave.map { leave in
                            return HistoryItem(leaveAppID: String(leave.leaveAppID),
                                               fromD: leave.fromDate,
                                               toD: leave.toDate,
                                               reason: leave.reason,
                                               status: leave.status,
                                               statusAlternate: leave.statusAlternate,
                                               statusHOD: leave.signedByHod,
                                               name: leave.lname)
                        }
                        self.dataModel.data = data
                        self.dataModel.isLoading = false
                    } else {
                        // Handle network error
                        self.dataModel.error = true
                        // Reset isLoading when error occurs
                        self.dataModel.isLoading = false
                    }
                }
            }
        }
}
