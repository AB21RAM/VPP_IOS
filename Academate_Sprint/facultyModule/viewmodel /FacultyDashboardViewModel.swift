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
                    var leaveItems: [LeaveItem] = [
                        LeaveItem(name: "Casual Leave",value: String(response.leaveList.first?.casualLeave ?? 0)),
                        LeaveItem(name: "Earned Leave",value: String(response.leaveList.first?.earnedLeave ?? 0)),
                        LeaveItem(name: "Medical Leave",value: String(response.leaveList.first?.medicalLeave ?? 0)),
                        LeaveItem(name: "Summer Vacation",value: String(response.leaveList.first?.summerVacation ?? 0)),
                        LeaveItem(name: "Winter Vacation",value: String(response.leaveList.first?.winterVacation ?? 0)),
                        LeaveItem(name: "Compensation Leave",value: String(response.leaveList.first?.compensationLeave ?? 0))
                    ]
                    /*
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
//                        if leave.specialLeave != 0 {
//                            leaveItems.append(LeaveItem(name: "Special Leave", value: "\(leave.specialLeave)"))
//                        }
                    }
                     */
                    print("DashBoard Data is : \(leaveItems)")
                    self.dataModel.leaves = leaveItems
                    self.dataModel.isLoading = false
                }
            } else {
                self.dataModel.error = true
            }
        }
    }

}

