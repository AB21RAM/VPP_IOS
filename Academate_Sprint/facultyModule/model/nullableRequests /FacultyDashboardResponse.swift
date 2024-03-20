//
//  FacultyDashboardResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

// MARK: - FacultyDashboardResponse
struct FacultyDashboardResponse: Codable {
    var leaveList: [LeaveList]
    var used: JSONNull? = nil
    var alternate: [Alternate]

    enum CodingKeys: String, CodingKey {
        case leaveList = "leave_list"
        case used
        case alternate
    }
    
}


// MARK: - Alternate
struct Alternate: Codable {
    var leaveAppID, facultyID, leaveID: Int
    var fromDate, toDate, reason: String
    var noOfDays: Double
    var docLink: String?
    var status, signedByHod: Int
    var signedByPrincipal: Int?
    var alternate, statusAlternate: Int
    var appliedDate: String?
    var halfFullDay: String?
    var name, lname: String

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
        case name, lname
    }
}

// MARK: - LeaveList
struct LeaveList: Codable , Hashable {
    var casualLeave: Double = 0.0
    var earnedLeave: Int = 0
    var medicalLeave: Int = 0
    var summerVacation: Int = 0
    var winterVacation: Int = 0
    var compensationLeave: Double = 0.0
    var specialLeave: Double = 0.0

    enum CodingKeys: String, CodingKey {
        case casualLeave = "Casual Leave"
        case earnedLeave = "Earned Leave"
        case medicalLeave = "Medical Leave"
        case summerVacation = "Summer Vacation"
        case winterVacation = "Winter Vacation"
        case compensationLeave = "Compensation Leave"
        case specialLeave = "Special Leave"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        casualLeave = try container.decode(Double.self, forKey: .casualLeave)
        earnedLeave = try container.decodeIfPresent(Int.self, forKey: .earnedLeave) ?? 0
        medicalLeave = try container.decodeIfPresent(Int.self, forKey: .medicalLeave) ?? 0
        summerVacation = try container.decodeIfPresent(Int.self, forKey: .summerVacation) ?? 0
        winterVacation = try container.decodeIfPresent(Int.self, forKey: .winterVacation) ?? 0
        compensationLeave = try container.decode(Double.self, forKey: .compensationLeave)
        specialLeave = try container.decode(Double.self, forKey: .specialLeave)
    }
}

