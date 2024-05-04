//
//  FetchFhGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct FeeStructureGetResponse: Codable {
    let finalSubmit: Int
    let found: Bool
    let result: [Result]
}

struct Result: Codable {
    let academicYear: Int
    let amount: Int
    let assoId: Int
    let catId: Int
    let fhId: Int
    let passingYear: String
    let programId: Int
}
