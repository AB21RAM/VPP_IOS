//
//  AlumniProfileResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/03/24.
//

import Foundation
struct AlumniProfileResponse: Codable {
    let batch: String
    let branch: Int
    let collegeId: String
    let contact: String
    let email: String
    let id: Int
    let name: String
}
