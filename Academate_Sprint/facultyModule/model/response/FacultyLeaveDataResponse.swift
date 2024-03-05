//
//  FacultyLeaveDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation
struct FacultyLeaveDataResponse : Decodable{
    let leave_list: [LeaveType]
    let facultylist: [FacultyNew]
}

struct LeaveType: Codable {
    let leave_id: Int
    let lname: String
}

struct FacultyNew: Codable {
    let faculty_id: Int
    let name: String
}

