//
//  StudentCurrEduDetailsResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
// MARK: - StudentCurrEduDetailsResponse
struct StudentCurrEduDetailsResponse: Codable {
    var data: [DataCurrEdu]
    var category: String
}

// MARK: - Datum
struct DataCurrEdu: Codable {
    var sid: Int
    var studClgID: String
    var uid, programmID: Int
    var catID: JSONNull?
    var seatTypeID, branchID: Int
    var grNumber: String
    var personalDetailsID, fatherID, motherID, guardianID: Int
    var physicallyHandicap, defenceStatus, receivedScholership, detailsOfPrize: JSONNull?
    var speacialTalent: JSONNull?
    var docIDS: Int
    var academicYear: String
    var finalSubmit: Int
    var hDegree: JSONNull?
    var partPayment, ddID: JSONNull?
    var neftID, cancelledApp: JSONNull?
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
