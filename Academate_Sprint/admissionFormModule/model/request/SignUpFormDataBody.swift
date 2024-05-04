//
//  SignUpFormDataBody.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct FormDataSignUp: Codable {
    let branch: Int
    let capApp: String
    let clgId: String
    let cnfpassword: String
    let email: String
    let grNumber: String
    let password: String
    let seatType: Int
    let selectedProgram: Int
    
    // Define CodingKeys if property names differ between Swift and Kotlin
    enum CodingKeys: String, CodingKey {
        case branch
        case capApp = "cap_app"
        case clgId = "clg_id"
        case cnfpassword
        case email
        case grNumber = "gr_number"
        case password
        case seatType = "seat_type"
        case selectedProgram = "selected_program"
    }
}

