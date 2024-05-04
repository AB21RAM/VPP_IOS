//
//  UploadDocGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct UploadDocGetResponse: Codable {
    var docs: DocsForm
    var code: Int
}

// MARK: - Docs
struct DocsForm: Codable {
    var docID: Int
    var photo, signature, capAllotmentLetter, fcCenterVarification: String
    var sscMarksheet, hscMarksheet, lc, mhtCetScoreCard: String
    var casteCertificate, casteValidation, domicile, aadharCard: String
    var rationCard, backPassbook, incomeCertificate, feeReciept: String
    var collegeAdmissionLetter, jeeScoreCard, nonCreamy, ewsPro: String
    var parentSignature, antiraggingForm, gapCERT: String

    enum CodingKeys: String, CodingKey {
        case docID = "doc_id"
        case photo, signature
        case capAllotmentLetter = "cap_allotment_letter"
        case fcCenterVarification = "fc_center_varification"
        case sscMarksheet = "ssc_marksheet"
        case hscMarksheet = "hsc_marksheet"
        case lc
        case mhtCetScoreCard = "mht_cet_score_card"
        case casteCertificate = "caste_certificate"
        case casteValidation = "caste_validation"
        case domicile
        case aadharCard = "aadhar_card"
        case rationCard = "ration_card"
        case backPassbook = "back_passbook"
        case incomeCertificate = "income_certificate"
        case feeReciept = "fee_reciept"
        case collegeAdmissionLetter = "college_admission_letter"
        case jeeScoreCard = "jee_score_card"
        case nonCreamy
        case ewsPro = "ews_pro"
        case parentSignature
        case antiraggingForm = "antiragging_form"
        case gapCERT = "gap_cert"
    }
}
