//
//  FacultyDetailsResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

// MARK: - FacultyDetailsResponse
struct FacultyDetailsResponse: Codable {
    var faculty: Faculty

    enum CodingKeys: String, CodingKey {
        case faculty = "Faculty"
    }
}

// MARK: - Faculty
struct Faculty: Codable {
    var facultyID, uid: Int
    var facultyClgID, name, contact: String
    var ftypeID: Int
    var role: String
    var departID : Int
    var previlage: Int?
    var joiningDate: String
    var shiftID: Int
    var gender, email: String

    enum CodingKeys: String, CodingKey {
        case facultyID = "faculty_id"
        case uid
        case facultyClgID = "faculty_clg_id"
        case name, contact
        case ftypeID = "ftype_id"
        case role
        case departID = "depart_id"
        case previlage
        case joiningDate = "joining_date"
        case shiftID = "shift_id"
        case gender, email
    }
}
