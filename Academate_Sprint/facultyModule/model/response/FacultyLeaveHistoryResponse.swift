//
//  FacultyLeaveHistoryResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

// MARK: - FacultyLeaveHistoryResponse
struct FacultyLeaveHistoryResponse: Codable {
    var leave: [Leave]
}

// MARK: - Leave
struct Leave: Codable {
    var leaveAppID, facultyID, leaveID: Int
    var fromDate, toDate, reason: String
    var noOfDays: Double
    var docLink: String?
    var status, signedByHod: Int
    var signedByPrincipal: Int?
    var alternate, statusAlternate: Int
    var appliedDate: String?
    var halfFullDay: String?
    var lname: String

    enum CodingKeys: String, CodingKey {
        case leaveAppID = "leave_app_id"
        case facultyID = "faculty_id"
        case leaveID = "leave_id"
        case fromDate = "from_date"
        case toDate = "to_date"
        case reason
        case noOfDays = "no_of_days"
        case docLink = "doc_link"
        case status
        case signedByHod = "signed_by_hod"
        case signedByPrincipal = "signed_by_principal"
        case alternate
        case statusAlternate = "status_alternate"
        case appliedDate = "applied_date"
        case halfFullDay = "half_full_day"
        case lname
    }
}
