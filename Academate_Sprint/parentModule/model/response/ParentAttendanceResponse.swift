//
//  ParentAttendanceResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct ParentAttendanceResponse: Decodable {
    let attendance: [Attendance]
}

struct Attendance: Decodable {
    let attDate: String
    let attId: Int
    let punchIn: String
    let punchOut: String
    let studClgId: String

    private enum CodingKeys: String, CodingKey {
        case attDate = "att_date"
        case attId = "att_id"
        case punchIn = "punch_in"
        case punchOut = "punch_out"
        case studClgId = "stud_clg_id"
    }
}
