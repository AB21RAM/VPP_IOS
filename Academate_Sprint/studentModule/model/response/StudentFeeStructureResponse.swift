//
//  StudentFeeStructureResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
// MARK: - StudentFeeStructureResponse
struct StudentFeeStructureResponse: Decodable {
    let found: Bool
    let result: [ResultTotal]
    let finalSubmit: Int

    enum CodingKeys: String, CodingKey {
        case found, result
        case finalSubmit = "final_submit"
    }
}

// MARK: - Result
struct ResultTotal: Decodable {
    let assoID, catID, fhID, amount: Int
    let programID, academicYear: Int
    let passingYear: String

    enum CodingKeys: String, CodingKey {
        case assoID = "asso_id"
        case catID = "cat_id"
        case fhID = "fh_id"
        case amount
        case programID = "program_id"
        case academicYear = "academic_year"
        case passingYear = "passing_year"
    }
}
