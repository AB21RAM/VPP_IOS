//
//  UpdateLeaveStatusBody.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import Foundation
struct UpdateLeaveStatusBody: Encodable {
    let appId: Int
    let status: Int
    let leaveId: Int
    let facultyId: Int
    let noOfDays: Double
    let role: String?
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case status
        case leaveId = "leave_id"
        case facultyId = "faculty_id"
        case noOfDays = "no_of_days"
        case role
        case uid
    }
}
