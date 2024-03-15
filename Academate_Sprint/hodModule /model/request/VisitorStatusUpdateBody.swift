//
//  VisitorStatusUpdateBody.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct VisitorStatusUpdateBody: Encodable {
    let status: Int
    let visitorId: Int
    
    private enum CodingKeys: String, CodingKey {
        case status
        case visitorId = "visitorId"
    }
}
