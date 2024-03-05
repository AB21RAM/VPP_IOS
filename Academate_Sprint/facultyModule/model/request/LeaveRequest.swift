//
//  LeaveRequest.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

struct LeaveRequest: Encodable {
    let leave_id: Int
    let half_full_day: String
    let from_date: String
    let to_date: String
    let reason: String
    let no_of_date: Double
    let alternate: Int
    let uid: Int
    let doc: String
}

