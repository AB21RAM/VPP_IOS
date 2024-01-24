//
//  DashBoardViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation
import Combine

struct DashboardDataModel {
    var firstYear: String = String()
    var dSecondYear: String = String()
    var secondYear: String = String()
    var thirdYear: String = String()
    var fourthYear: String = String()
    var isError: Bool = false
    var isLoading : Bool = true
    var new_data : String = String()
}
class DashBoardViewModel: ObservableObject {
    @Published var dashboardDataModel: DashboardDataModel = DashboardDataModel()
    private let apiResource = AdmissionApiResource()
    
    
    
    @Published var documentURL: URL?
    @Published var downloadError: Error?
    //    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        // Call the function during initialization
        getDashBoardData()
//        getPendingBranchWise()
        
    }
    func getDashBoardData(){
        self.dashboardDataModel.isLoading = true
        apiResource.fetchDashBoardData() { response in
            
            DispatchQueue.main.async {
                self.dashboardDataModel.isLoading = false
                if response?.count1 != 0 {
                    self.dashboardDataModel.firstYear = String(response?.count1 ?? 0)
                    self.dashboardDataModel.secondYear = String(response?.count3 ?? 0)
                    self.dashboardDataModel.dSecondYear = String(response?.count2 ?? 0)
                    self.dashboardDataModel.thirdYear = String(response?.count4 ?? 0)
                    self.dashboardDataModel.fourthYear = String(response?.count5 ?? 0)
                }else{
                    self.dashboardDataModel.isError = true
                }
                
            }
        }
    }
    /*
    func getPendingBranchWise(){
        DownloadCSVFile(brach:1) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fileURL):
                    print("File downloaded successfully: \(fileURL)")
                    
                    // Now you can read the contents of the file or use it as needed
                    if let csvString = try? String(contentsOf: fileURL, encoding: .utf8) {
                        print("CSV contents:\n\(csvString)")
                        self.dashboardDataModel.new_data = csvString
                    }
                    
                case .failure(let error):
                    print("Error downloading file: \(error)")
                }
            }
        }
        //        apiResource.fetchPendingBranchWiseData(){ response in
        //            DispatchQueue.main.async {
        //
        //                print(response?.lowercased() ?? "some")
        //            }
        //        }
    }
    func downloadCSVFile(brach: Int) {
        DownloadCSVFile(brach: brach) { [weak self] result in
            switch result {
            case .success(let url):
                DispatchQueue.main.async {
                    print("File downloaded successfully: \(url)")
                    self?.documentURL = url
                    self?.downloadError = nil
                    if let csvString = try? String(contentsOf: url, encoding: .utf8) {
                        print("CSV contents:\n\(csvString)")
//                        self.dashboardDataModel.new_data = csvString
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.downloadError = error
                    self?.documentURL = nil
                }
            }
        }
    }
     */
}
