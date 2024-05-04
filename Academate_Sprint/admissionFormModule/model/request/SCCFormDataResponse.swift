//
//  SCCFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct SCCFormDataResponse: Codable {
    let boardName: String
    let sscMarks: String
    let sscPass: String
    let sscPercentage: String
    let sscSeat: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case boardName = "board_name"
        case sscMarks = "ssc_marks"
        case sscPass = "ssc_pass"
        case sscPercentage = "ssc_percentage"
        case sscSeat = "ssc_seat"
        case uid
    }
}
