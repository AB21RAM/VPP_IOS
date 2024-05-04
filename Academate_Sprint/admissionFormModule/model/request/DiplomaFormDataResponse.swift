//
//  DiplomaFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct DiplomaFormDataResponse: Codable {
    let dipBoard: String
    let dipCgpi: String
    let dipCollegeName: String
    let dipMarks: String
    let dipPass: String
    let dipPercentage: String
    let dipSeat: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case dipBoard = "dip_board"
        case dipCgpi = "dip_cgpi"
        case dipCollegeName = "dip_college_name"
        case dipMarks = "dip_marks"
        case dipPass = "dip_pass"
        case dipPercentage = "dip_percentage"
        case dipSeat = "dip_seat"
        case uid
    }
}
