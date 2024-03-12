//
//  HODMyStudentsListResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODMyStudentsListResponse: Decodable {
    let studentList: [Student]
    
    private enum CodingKeys: String, CodingKey {
        case studentList = "StudentList"
    }
}

struct Student: Decodable {
    let aadharCard: String
    let aadharNumber: String
    let academicYear: String
    let address: String
    let antiraggingForm: String
    let backPassbook: String
    let bankAccountNumber: String
    let bankName: String
    let bioMarks: String
    let bname: String
    let branchId: Int
    let cancelledApp: Int
    let cancelledAppDate: String
    let cancelledAppDocument: String
    let capAllotmentLetter: String
    let caste: String
    let casteCertificate: String
    let casteValidation: String
    let catId: Int
    let chemistryScoreInHsc: String
    let childNumber: String
    let collegeAdmissionLetter: String
    let communitee: String
    let contact: String
    let ddId: Int
    let depCgpi: String
    let depClgName: String
    let depMarks: String
    let depPassingYear: String
    let depPer: String
    let depSeat: String
    let dipBoard: String
    let dob: String
    let docId: Int
    let docIds: Int
    let domicile: String
    let eduId: Int
    let ewsPro: String
    let fatherId: Int
    let fcCenterVarification: String
    let feeReciept: String
    let finalSubmit: Int
    let gapCert: String
    let genderId: Int
    let grNumber: String
    let guardianId: Int
    let hDegree: String
    let hscMarks: String
    let hscMarksheet: String
    let hscNameOfBoard: String
    let hscPassingYear: String
    let hscPercentage: String
    let hscSeatYear: String
    let incomeCertificate: String
    let jeeScoreCard: String
    let lastCollegeAttended: String
    let lc: String
    let marriedStatus: String
    let mathsScoreHsc: String
    let mhtCetScoreCard: String
    let minority: String
    let motherId: Int
    let name: String
    let nationality: String
    let neftId: Int
    let nonCreamy: String
    let paddId: Int
    let parentSignature: String
    let partPayment: Int
    let personalDetailsId: Int
    let personalId: Int
    let photo: String
    let physicsScoreInHsc: String
    let placeOfBirth: String
    let programmId: Int
    let programmName: String
    let raddId: Int
    let rationCard: String
    let religion: String
    let rowNum: Int
    let saddId: Int
    let seatTypeId: Int
    let sid: Int
    let signature: String
    let sscMarks: String
    let sscMarksheet: String
    let sscNameOfBoard: String
    let sscPassingYear: String
    let sscPercentage: String
    let sscSeatNumber: String
    let studClgId: String
    let studId: Int
    let subCaste: String
    let uid: Int
    let vocationalSubject: String
    let vocationalTotalScoreHsc: String
    
    private enum CodingKeys: String, CodingKey {
        case aadharCard = "aadhar_card"
        case aadharNumber = "aadhar_number"
        case academicYear = "academic_year"
        case address, antiraggingForm, backPassbook, bankAccountNumber, bankName, bioMarks, bname, branchId = "branch_id", cancelledApp = "cancelled_app", cancelledAppDate = "cancelled_app_date", cancelledAppDocument = "cancelled_app_document", capAllotmentLetter = "cap_allotment_letter", caste, casteCertificate = "caste_certificate", casteValidation = "caste_validation", catId = "cat_id", chemistryScoreInHsc = "chemistry_score_in_hsc", childNumber = "child_number", collegeAdmissionLetter = "college_admission_letter", communitee, contact, ddId = "dd_id", depCgpi = "dep_cgpi", depClgName = "dep_clg_name", depMarks = "dep_marks", depPassingYear = "dep_passing_year", depPer = "dep_per", depSeat = "dep_seat", dipBoard = "dip_board", dob, docId = "doc_id", docIds = "doc_ids", domicile, eduId = "edu_id", ewsPro = "ews_pro", fatherId = "father_id", fcCenterVarification = "fc_center_varification", feeReciept = "fee_reciept", finalSubmit = "final_submit", gapCert = "gap_cert", genderId = "gender_id", grNumber = "gr_number", guardianId = "guardian_id", hDegree = "HDegree", hscMarks = "hsc_marks", hscMarksheet = "hsc_marksheet", hscNameOfBoard = "hsc_name_of_board", hscPassingYear = "hsc_passing_year", hscPercentage = "hsc_percentage", hscSeatYear = "hsc_seat_year", incomeCertificate = "income_certificate", jeeScoreCard = "jee_score_card", lastCollegeAttended = "last_college_attended", lc, marriedStatus = "married_status", mathsScoreHsc = "maths_score_hsc", mhtCetScoreCard = "mht_cet_score_card", minority, motherId = "mother_id", name, nationality, neftId = "neft_id", nonCreamy = "nonCreamy", paddId = "padd_id", parentSignature = "parentSignature", partPayment = "part_payment", personalDetailsId = "personal_details_id", personalId = "personal_id", photo, physicsScoreInHsc = "physics_score_in_hsc", placeOfBirth = "place_of_birth", programmId = "programm_id", programmName = "programm_name", raddId = "radd_id", rationCard = "ration_card", religion, rowNum = "RowNum", saddId = "sadd_id", seatTypeId = "seat_type_id", sid = "sid", signature, sscMarks = "ssc_marks", sscMarksheet = "ssc_marksheet", sscNameOfBoard = "ssc_name_of_board", sscPassingYear = "ssc_passing_year", sscPercentage = "ssc_percentage", sscSeatNumber = "ssc_seat_number", studClgId = "stud_clg_id", studId = "stud_id", subCaste = "sub_caste", uid = "uid", vocationalSubject = "vocational_subject", vocationalTotalScoreHsc = "vocational_total_score_hsc"
    }
}
