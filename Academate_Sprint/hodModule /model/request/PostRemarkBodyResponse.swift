//
//  PostRemarkBodyResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct PostRemarkBodyResponse: Encodable {
    let alumniId: Int
    let remark: String
    
    private enum CodingKeys: String, CodingKey {
        case alumniId = "alumni_id"
        case remark
    }
}
