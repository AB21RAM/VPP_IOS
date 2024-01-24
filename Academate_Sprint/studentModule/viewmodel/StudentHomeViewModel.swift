//
//  StudentHomeViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//
struct HomeDataModel{
    var Name : String = String()
    var ContactNumber : String = String()
    var isError: Bool = false
    var isLoading : Bool = true
}
import Foundation
class StudentHomeViewModel : ObservableObject{
    @Published var homeDataModel: HomeDataModel = HomeDataModel()
    private let apiResource = StudentApiResource()
    init() {
        getPersonalData()
    }
    func getPersonalData(){
        self.homeDataModel.isLoading = true
        apiResource.getStudentPersonalDetails() { response in
            
            DispatchQueue.main.async {
                self.homeDataModel.isLoading = false
                if response?.code != 0 {
                    self.homeDataModel.Name = response?.radd.first?.name ?? "Error"
                    self.homeDataModel.ContactNumber = response?.radd.first?.contact ?? "Error"
                }else{
                    self.homeDataModel.isError = true
                }
                
            }
        }
    }
}



    func getDashBoardData(){
       
    }
