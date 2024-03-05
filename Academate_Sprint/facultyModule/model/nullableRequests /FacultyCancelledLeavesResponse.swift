//
//  FacultyCancelledLeavesResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

// MARK: - FacultyCancelledLeavesResponse
struct FacultyCancelledLeavesResponse: Codable {
    var message: String
    var balanceLeave: [BalanceLeave]
}

// MARK: - BalanceLeave
struct BalanceLeave: Codable {
    var flaID, facultyID, casualLeave, earnedLeave: Int
    var specialLeave, summerVacation, winterVacation, compensationLeave: Int
    var medicalLeave: Int
    var usedEarnedLeaves: JSONNull?
    var remark: String?
    var maternityLeave: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case flaID = "fla_id"
        case facultyID = "faculty_id"
        case casualLeave = "Casual Leave"
        case earnedLeave = "Earned Leave"
        case specialLeave = "Special Leave"
        case summerVacation = "Summer Vacation"
        case winterVacation = "Winter Vacation"
        case compensationLeave = "Compensation Leave"
        case medicalLeave = "Medical Leave"
        case usedEarnedLeaves = "used_earned_leaves"
        case remark
        case maternityLeave = "Maternity Leave"
        case name
    }
}
