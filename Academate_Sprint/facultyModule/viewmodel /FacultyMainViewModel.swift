//
//  MainViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 06/03/24.
//

import Foundation
class FacultyMainViewModel : ObservableObject{
    private let repository = FacultyRepository()
    func getDashboardData(){
        repository.getFacultyDashboard(){ response in
            DispatchQueue.main.async {
                print(response ?? "data not found")
            }
        }
    }
    func getPunchRecord(){
        repository.getFacultyPunchRecord(){response in
            DispatchQueue.main.async {
                print(response ?? "No Data for non Null too")
            }
        }
    }
}
