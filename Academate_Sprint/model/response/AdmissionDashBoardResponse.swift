//
//  AdmissionDashBoardResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation
// MARK: - AdmissionDashBoardResponse
struct AdmissionDashBoardResponse: Decodable {
    var count1, count2, count3, count4: Int
    var count5, cs, it, aids: Int
    var extc: Int

    enum CodingKeys: String, CodingKey {
        case count1 = "count_1"
        case count2 = "count_2"
        case count3 = "count_3"
        case count4 = "count_4"
        case count5 = "count_5"
        case cs, it, aids, extc
    }
}
