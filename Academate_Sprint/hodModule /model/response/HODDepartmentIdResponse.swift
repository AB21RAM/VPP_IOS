//
//  HODDepartmentIdResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODDepartmentIdResponse: Decodable {
    let departId: Int
    
    private enum CodingKeys: String, CodingKey {
        case departId = "depart_id"
    }
}
