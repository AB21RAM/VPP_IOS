//
//  StudentAdmissionDashboardResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct StudentAdmissionDashboardResponse: Codable {
    var data: [Datum]
    var isEnt, isEdu, isAdd, isSem: Bool
    var isSubmmited: Bool
}

// MARK: - Datum
struct Datum: Codable {
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
