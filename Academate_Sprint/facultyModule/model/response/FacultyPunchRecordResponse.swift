//
//  FacultyPunchRecordResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

// MARK: - FacultyPunchRecordResponse
struct FacultyPunchRecordResponse: Codable {
    var punch: [Punch]
}

// MARK: - Punch
struct Punch: Codable {
    var attID: Int
    var facultyClgID, puchTime, dateD: String
    var punchTypeID: String?

    enum CodingKeys: String, CodingKey {
        case attID = "att_id"
        case facultyClgID = "faculty_clg_id"
        case puchTime = "puch_time"
        case dateD = "date_d"
        case punchTypeID = "punch_type_id"
    }
}
