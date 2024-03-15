//
//  VisitorsListResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct VisitorsListResponse: Decodable {
    let visitors: [Visitor]
    
    private enum CodingKeys: String, CodingKey {
        case visitors
    }
}

struct Visitor: Decodable {
    let departmentId: Int
    let facultyName: String
    let imageUrl: String
    let inTime: String
    let name: String
    let outTime: String
    let reason: String
    let status: Int
    let visitDate: String
    let visitorId: Int
    
    private enum CodingKeys: String, CodingKey {
        case departmentId = "department_id"
        case facultyName = "faculty_name"
        case imageUrl = "image_url"
        case inTime = "in_time"
        case name
        case outTime = "out_time"
        case reason
        case status
        case visitDate = "visit_date"
        case visitorId = "visitor_id"
    }
}
