//
//  StudentSemDetailsResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
struct StudentSemDetailsResponse: Codable {
    var entrance: [Entrance]
}

// MARK: - Entrance
struct Entrance: Codable {
    var semID, studID: Int
    var gradeObtained: String
    var internalKt, externalKt, totalKt: Int
    var aggregatedScore: String
    var semNumber: Int

    enum CodingKeys: String, CodingKey {
        case semID = "sem_id"
        case studID = "stud_id"
        case gradeObtained = "grade_obtained"
        case internalKt = "internal_kt"
        case externalKt = "external_kt"
        case totalKt = "total_kt"
        case aggregatedScore = "aggregated_score"
        case semNumber = "sem_number"
    }
}
