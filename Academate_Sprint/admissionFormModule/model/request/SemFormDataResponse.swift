//
//  SemFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct SemFormDataResponse: Codable {
    let aggregate: String
    let externalKt: String
    let grade: String
    let internalKt: String
    let sem: String
    let totalKt: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case aggregate
        case externalKt = "external_kt"
        case grade
        case internalKt = "internal_kt"
        case sem
        case totalKt = "total_kt"
        case uid
    }
}
