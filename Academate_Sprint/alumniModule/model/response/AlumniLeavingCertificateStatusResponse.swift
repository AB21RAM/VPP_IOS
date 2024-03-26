//
//  AlumniLeavingCertificateStatusResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/03/24.
//

import Foundation

struct AlumniLeavingCertificateStatusResponse: Codable {
    let data: [DataStatus]
    let lcFlag: Int
}

struct DataStatus: Codable {
    let department: String
    let hod_id: Int
    let name: String
    let remarks: String?
    let sr_no: Int
    let status: Int
}
