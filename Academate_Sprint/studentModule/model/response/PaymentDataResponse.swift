//
//  PaymentDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
// MARK: - PaymentDataResponse
struct PaymentDataResponse: Codable {
    let name, email, contact, txnid: String
    let amount, fh, collegeID: String

    enum CodingKeys: String, CodingKey {
        case name, email, contact, txnid, amount
        case fh = "Fh"
        case collegeID = "collegeId"
    }
}
