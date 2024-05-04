//
//  EntranceDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct EntranceDetailsGetResponse: Codable {
    var entrance: [EntranceNew]
}

// MARK: - Entrance
struct EntranceNew: Codable {
    var entranceID, studID: Int
    var entranceName, rollNumber, appNumber, phyPer: String
    var chePer, mathsPer, overallPer: String

    enum CodingKeys: String, CodingKey {
        case entranceID = "entrance_id"
        case studID = "stud_id"
        case entranceName = "entrance_name"
        case rollNumber = "roll_number"
        case appNumber = "app_number"
        case phyPer = "phy_per"
        case chePer = "che_per"
        case mathsPer = "maths_per"
        case overallPer = "overall_per"
    }
}
