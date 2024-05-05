//
//  PresentCourseDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct PresentCourseDetailsGetResponse: Codable {
    var data: [DatumPresent]
    var category: String = ""
}

// MARK: - Datum
struct DatumPresent: Codable {
    var sid: Int = 0
    var studClgID: String = ""
    var uid : Int = 0
    var programmID: Int = 0
    var catID: Int?  = 0
    var seatTypeID : Int = 0
    var branchID: Int = 0
    var grNumber: String = ""
    var personalDetailsID, fatherID, motherID, guardianID: Int
    var physicallyHandicap, defenceStatus, receivedScholership, detailsOfPrize: JSONNull?
    var speacialTalent: JSONNull?
    var docIDS: Int
    var academicYear: String
    var finalSubmit: Int
    var hDegree : String?
    var partPayment, ddID, neftID: Int?
    var cancelledApp: Int
    var cancelledAppDate, cancelledAppDocument: JSONNull?
    var rowNum: Int

    enum CodingKeys: String, CodingKey {
        case sid
        case studClgID = "stud_clg_id"
        case uid
        case programmID = "programm_id"
        case catID = "cat_id"
        case seatTypeID = "seat_type_id"
        case branchID = "branch_id"
        case grNumber = "gr_number"
        case personalDetailsID = "personal_details_id"
        case fatherID = "father_id"
        case motherID = "mother_id"
        case guardianID = "guardian_id"
        case physicallyHandicap = "physically_handicap"
        case defenceStatus = "defence_status"
        case receivedScholership = "received_scholership"
        case detailsOfPrize = "details_of_prize"
        case speacialTalent = "speacial_talent"
        case docIDS = "doc_ids"
        case academicYear = "academic_year"
        case finalSubmit = "final_submit"
        case hDegree = "HDegree"
        case partPayment = "part_payment"
        case ddID = "dd_id"
        case neftID = "neft_id"
        case cancelledApp = "cancelled_app"
        case cancelledAppDate = "cancelled_app_date"
        case cancelledAppDocument = "cancelled_app_document"
        case rowNum = "RowNum"
    }
}

