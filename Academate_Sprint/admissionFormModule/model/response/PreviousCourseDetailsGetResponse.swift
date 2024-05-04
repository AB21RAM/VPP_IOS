//
//  PreviousCourseDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct PreviousCourseDetailsGetResponse: Codable {
    var data: [DatumNew]
}

// MARK: - Datum
struct DatumNew: Codable {
    var eduID: Int
    var depCgpi, depPer, depMarks, depSeat: String?
    var depPassingYear, depClgName: String?
    var physicsScoreInHsc, chemistryScoreInHsc, mathsScoreHsc, vocationalTotalScoreHsc: String
    var sscPassingYear, sscSeatNumber, sscNameOfBoard, sscMarks: String
    var sscPercentage, hscPassingYear, hscSeatYear, hscNameOfBoard: String
    var hscMarks, hscPercentage: String
    var studID: Int
    var dipBoard: String?
    var vocationalSubject, bioMarks: String

    enum CodingKeys: String, CodingKey {
        case eduID = "edu_id"
        case depCgpi = "dep_cgpi"
        case depPer = "dep_per"
        case depMarks = "dep_marks"
        case depSeat = "dep_seat"
        case depPassingYear = "dep_passing_year"
        case depClgName = "dep_clg_name"
        case physicsScoreInHsc = "physics_score_in_hsc"
        case chemistryScoreInHsc = "chemistry_score_in_hsc"
        case mathsScoreHsc = "maths_score_hsc"
        case vocationalTotalScoreHsc = "vocational_total_score_hsc"
        case sscPassingYear = "ssc_passing_year"
        case sscSeatNumber = "ssc_seat_number"
        case sscNameOfBoard = "ssc_name_of_board"
        case sscMarks = "ssc_marks"
        case sscPercentage = "ssc_percentage"
        case hscPassingYear = "hsc_passing_year"
        case hscSeatYear = "hsc_seat_year"
        case hscNameOfBoard = "hsc_name_of_board"
        case hscMarks = "hsc_marks"
        case hscPercentage = "hsc_percentage"
        case studID = "stud_id"
        case dipBoard = "dip_board"
        case vocationalSubject = "vocational_subject"
        case bioMarks = "bio_marks"
    }
}


