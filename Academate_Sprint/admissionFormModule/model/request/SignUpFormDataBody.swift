//
//  SignUpFormDataBody.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct SignUpFormDataBody: Codable {
    let branch: Int
    let clgId: String
    let confirmPassword: String
    let email: String
    let password: String
    let seatType: Int
    let selectedProgram: Int
}
