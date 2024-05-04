//
//  SemDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct SemDetailsGetResponse: Codable {
    let entrance: [EntranceSem]
}

struct EntranceSem: Codable {
    let aggregatedScore: String
    let externalKt: Int
    let gradeObtained: String
    let internalKt: Int
    let semId: Int
    let semNumber: Int
    let studId: Int
    let totalKt: Int
}
