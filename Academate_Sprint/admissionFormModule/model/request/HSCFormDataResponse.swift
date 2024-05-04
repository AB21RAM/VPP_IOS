//
//  HSCFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct HSCFormDataResponse: Codable {
    let bioMarks: String
    let cheMarks: String
    let hscBoardName: String
    let hscMarks: String
    let hscPass: String
    let hscPercentage: String
    let hscSeat: String
    let mathMarks: String
    let phyMarks: String
    let uid: String
    let vocationalMarks: String
    let vocationalSubject: String
    
    private enum CodingKeys: String, CodingKey {
        case bioMarks = "bio_marks"
        case cheMarks = "che_marks"
        case hscBoardName = "hsc_board_name"
        case hscMarks = "hsc_marks"
        case hscPass = "hsc_pass"
        case hscPercentage = "hsc_percentage"
        case hscSeat = "hsc_seat"
        case mathMarks = "math_marks"
        case phyMarks = "phy_marks"
        case uid
        case vocationalMarks = "vocational_marks"
        case vocationalSubject = "vocational_subject"
    }
}
