//
//  FetchFhGetAdmissionResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct FetchFhGetAdmissionResponse: Codable {
    let found: Bool
    let result: [ResultFh]
}

struct ResultFh: Codable {
    let fhId: Int
    let headName: String
}
