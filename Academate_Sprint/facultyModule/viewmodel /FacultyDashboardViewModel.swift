//
//  FacultyDashboardViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 20/03/24.
//

import Foundation
struct FacultyDashboardDataModel{
    var leaves : [LeaveItem] = []
    var isLoading = false
    var error = false
}

struct LeaveItem : Identifiable{
    var id = UUID()
    var name = String()
    var value = String()
}
class FacultyDashboardViewModel : ObservableObject{
    let repository = FacultyRepository()
    @Published var dataModel = FacultyDashboardDataModel()
    func getDashboardData() {
        repository.getFacultyDashboard { response in
            if let response = response {
                DispatchQueue.main.async {
                    self.dataModel.isLoading = true
                    var leaveItems: [LeaveItem] = []
                    for leave in response.leaveList {
                        if leave.casualLeave != 0 {
                            leaveItems.append(LeaveItem(name: "Casual Leave", value: "\(leave.casualLeave)"))
                        }
                        if leave.earnedLeave != 0 {
                            leaveItems.append(LeaveItem(name: "Earned Leave", value: "\(leave.earnedLeave)"))
                        }
                        if leave.medicalLeave != 0 {
                            leaveItems.append(LeaveItem(name: "Medical Leave", value: "\(leave.medicalLeave)"))
                        }
                        if leave.summerVacation != 0 {
                            leaveItems.append(LeaveItem(name: "Summer Vacation", value: "\(leave.summerVacation)"))
                        }
                        if leave.winterVacation != 0 {
                            leaveItems.append(LeaveItem(name: "Winter Vacation", value: "\(leave.winterVacation)"))
                        }
                        if leave.compensationLeave != 0 {
                            leaveItems.append(LeaveItem(name: "Compensation Leave", value: "\(leave.compensationLeave)"))
                        }
                        if leave.specialLeave != 0 {
                            leaveItems.append(LeaveItem(name: "Special Leave", value: "\(leave.specialLeave)"))
                        }
                    }
                    self.dataModel.leaves = leaveItems
                    self.dataModel.isLoading = false
                }
            } else {
                self.dataModel.error = true
            }
        }
    }

}

