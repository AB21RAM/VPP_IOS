//
//  EntranceFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct EntranceFormDataResponse: Codable {
    let appNumber: String
    let chePer: String
    let entranceName: String
    let mathsPer: String
    let overallPer: String
    let phyPer: String
    let rollNumber: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case appNumber = "app_number"
        case chePer = "che_per"
        case entranceName = "entrance_name"
        case mathsPer = "maths_per"
        case overallPer = "overall_per"
        case phyPer = "phy_per"
        case rollNumber = "roll_number"
        case uid
    }
}
