//
//  DepartMentViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 21/01/24.
//

import Foundation
struct CountDataModel {
    var COMPS: String = String()
    var AIDS: String = String()
    var EXTC: String = String()
    var IT: String = String()
    var pCOMPS: String = String()
    var pAIDS: String = String()
    var pEXTC: String = String()
    var pIT: String = String()
    var isPlaying : Bool = true
    var isCSVLoading : Bool = false
}
class DepartMentViewModel : ObservableObject {
    @Published var countDataModel: CountDataModel = CountDataModel()
    private let apiResource = AdmissionApiResource()
    @Published var documentURL: URL?
    @Published var downloadError: Error?
    init(){
        getTotalCount()
        getPendingCount()
    }
    func downloadPendingApp(brach: Int) {
        guard !self.countDataModel.isCSVLoading else {
                    print("Download is already in progress.")
                    return
                }
        self.countDataModel.isCSVLoading = true
        DownloadPendingCSVFile(brach: brach) { [weak self] result in
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
    func downloadYearBranchApp(brach: String, year: Int) {
        DownloadBranchYearCSVFile(year : year, brach: brach ) { [weak self] result in
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
    func downloadBranchApp(brach: String) {
        DownloadBranchCSVFile(brach: brach ) { [weak self] result in
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
    func getTotalCount(){
        apiResource.fetchDashBoardData() { response in
            DispatchQueue.main.async {
                if(response?.cs == nil){
                    self.countDataModel.isPlaying = true
                }else{
                    self.countDataModel.isPlaying = false
                    self.countDataModel.COMPS = String(response?.cs ?? 0)
                    self.countDataModel.AIDS = String(response?.aids ?? 0)
                    self.countDataModel.IT = String(response?.it ?? 0)
                    self.countDataModel.EXTC = String(response?.extc ?? 0)
                }
                
            }
        }
    }
    func getPendingCount(){
        apiResource.fetchPendingCount() {  [weak self] response in
            DispatchQueue.main.async {
                // Safely unwrap the response object
                guard let response = response, let firstElement = response.first else {
                    return
                }
//                var comp = String(Int(from: self?.countDataModel.COMPS ?? 0))
                // Update properties of countDataModel
                self?.countDataModel.pCOMPS = String(firstElement.pcs)
                self?.countDataModel.pAIDS = String(firstElement.paids)
                self?.countDataModel.pIT = String(firstElement.pit)
                self?.countDataModel.pEXTC = String(firstElement.pextc)
            }
        }
    }
}
