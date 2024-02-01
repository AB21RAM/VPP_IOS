//
//  StudentDashboardResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
// MARK: - StudentDashboardResponse
struct StudentDashboardResponse: Codable {
    var data: [DataDB]
    var isEnt, isEdu, isAdd, isSem: Bool
    var isSubmmited: Bool
}

// MARK: - Datum
struct DataDB: Codable {
    var personalDetailsID, fatherID, docIDS, programmID: Int
    var finalSubmit: Int

    enum CodingKeys: String, CodingKey {
        case personalDetailsID = "personal_details_id"
        case fatherID = "father_id"
        case docIDS = "doc_ids"
        case programmID = "programm_id"
        case finalSubmit = "final_submit"
    }
}
