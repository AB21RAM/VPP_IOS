//
//  StudentBalanceFeeResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
struct StudentBalanceFeeResponse: Codable {
    var success: Bool
    var result: [ResultBalance]
}

// MARK: - Result
struct ResultBalance: Codable {
    var receiptID, fhID, balanceAmount: Int

    enum CodingKeys: String, CodingKey {
        case receiptID = "receipt_id"
        case fhID = "fh_id"
        case balanceAmount = "balance_amount"
    }
}

