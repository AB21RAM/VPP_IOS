//
//  PaymentDataRequest.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
// MARK: - PaymentDataRequest
struct PaymentDataRequest: Codable {
    let collegeID, id: String

    enum CodingKeys: String, CodingKey {
        case collegeID = "collegeId"
        case id
    }
}
