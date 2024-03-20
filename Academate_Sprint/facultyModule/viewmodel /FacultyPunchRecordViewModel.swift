//
//  FacultyPunchRecordViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 20/03/24.
//

import Foundation
struct FacultyPunchDataModel {
    var punch : [PunchItem] = []
    var isLoading = false
    var error = false
}
struct PunchItem : Identifiable{
    var id = UUID()
    var dateKey: String
    var data: (String, String)
}
class FacultyPunchRecordViewModel : ObservableObject{
    let repository = FacultyRepository()
    @Published var dataModel = FacultyPunchDataModel()
    func getPuchRecord() {
            repository.getFacultyPunchRecord { result in
                if let result = result {
                    DispatchQueue.main.async {
                        var punchPairs = [String: (String, String)]()

                        let groupedByDate = Dictionary(grouping: result.punch , by: { $0.dateD })

                        for (dateKey, punches) in groupedByDate {
                            let sortedPunches = punches.sorted { $0.puchTime < $1.puchTime }
                            
                            if let minPunchIn = sortedPunches.first, let maxPunchOut = sortedPunches.last {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "your date format here" // Specify your date format
                                
                                if let punchInTime = dateFormatter.date(from: minPunchIn.puchTime),
                                   let punchOutTime = dateFormatter.date(from: maxPunchOut.puchTime) {
                                    
                                    punchPairs[dateKey] = (minPunchIn.puchTime, maxPunchOut.puchTime)
                                }
                            }
                        }
                        let newList = punchPairs.map { key, value in
                            return PunchItem(dateKey: key, data: value)
                        }
                        self.dataModel.punch = newList
                        self.dataModel.isLoading = true
                    }
                } else {
                    // Handle error
                    self.dataModel.error = true
                }
            }
        }
}
