//
//  AlumniRegistrationBodyResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/03/24.
//

import Foundation
struct AlumniRegistrationBodyResponse: Codable {
    let batch: String
    let branch: String
    let collegeId: String
    let confirmPassword: String
    let contact: String
    let email: String
    let name: String
    let password: String
}
