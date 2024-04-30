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
//                        print("\nGroup data\(result.punch.first)")
                        let groupedByDate = Dictionary(grouping: result.punch , by: { $0.dateD })

//                        print("\nGroup data\(groupedByDate)")
                        for (dateKey, punches) in groupedByDate {
                            let sortedPunches = punches.sorted { $0.puchTime < $1.puchTime }
                            if let minPunchIn = sortedPunches.first, let maxPunchOut = sortedPunches.last {
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "HH:mm:ss" // Specify your date format
                                if let punchInTime = dateFormatter.date(from: minPunchIn.puchTime),
                                   let punchOutTime = dateFormatter.date(from: maxPunchOut.puchTime) {
                                    punchPairs[dateKey] = (minPunchIn.puchTime, maxPunchOut.puchTime)
                                }
                            }
                        }
                        
                        let sortedPairs = punchPairs.sorted(by: { $0.key > $1.key }) // Sort the dictionary by keys in decreasing order
                        // Code for the Date Sorting 
/*
                        // Define your start and end dates for the interval
                        let startDateString = "2024-01-01" // Example start date string
                        let endDateString = "2024-02-01" // Example end date string

                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"

                        if let startDate = dateFormatter.date(from: startDateString),
                           let endDate = dateFormatter.date(from: endDateString) {

                            // Filter the punchPairs dictionary based on the date interval
                            let filteredPairs = sortedPairs.filter { key, _ in
                                if let date = dateFormatter.date(from: key) {
                                    return date >= startDate && date <= endDate
                                }
                                return false
                            }

                            // Create the newList from the filteredPairs
                            let newList = filteredPairs.map { key, value in
                                return PunchItem(dateKey: key, data: value)
                            }

                            // Assign the newList to your data model
                            self.dataModel.punch = newList

                            // Print the new punch data
                            print("New Punch Data for the selected date interval is \(newList)")
                        }
 */
                        let newList = sortedPairs.map { key, value in
                            return PunchItem(dateKey: key, data: value)
                        }
                        print("")
                        self.dataModel.punch = newList
                        print("New Punch Da is \(newList)")
                        self.dataModel.isLoading = true
                    }
                } else {
                    // Handle error
                    self.dataModel.error = true
                }
            }
        }
}
