//
//  SingleFeeHeadResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
struct SingleFeeHeadResponseElement: Codable {
    let sfhID, fhID: Int
    let amount, headName: String

    enum CodingKeys: String, CodingKey {
        case sfhID = "sfh_id"
        case fhID = "fh_id"
        case amount
        case headName = "head_name"
    }
}

typealias SingleFeeHeadResponse = [SingleFeeHeadResponseElement]
