//
//  AllFacultyIDResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

// MARK: - AllFacultyIDResponse
struct AllFacultyIDResponse: Codable {
    var facultylist: [Facultylist]
}

// MARK: - Facultylist
struct Facultylist: Codable {
    var facultyID: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case facultyID = "faculty_id"
        case name
    }
}
