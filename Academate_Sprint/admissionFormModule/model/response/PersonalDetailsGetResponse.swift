//
//  PersonalDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct PersonalDetailsGetResponse: Codable {
    var radd: [RaddNew]
    var code: Int
}

// MARK: - Radd
struct RaddNew: Codable {
    var personalID, studID: Int
    var name: String
    var genderID: Int
    var dob, religion, communitee, minority: String
    var caste, subCaste, nationality: String
    var raddID, paddID: Int
    var placeOfBirth, childNumber: String
    var landlineNumber: String?
    var contact: String
    var bankAccountNumber: String?
    var bankName: String
    var email: String?
    var marriedStatus: String
    var guardianRelation: String?
    var aadharNumber, lastCollegeAttended: String
    var isParentHaveDomicile: Bool?

    enum CodingKeys: String, CodingKey {
        case personalID = "personal_id"
        case studID = "stud_id"
        case name
        case genderID = "gender_id"
        case dob, religion, communitee, minority, caste
        case subCaste = "sub_caste"
        case nationality
        case raddID = "radd_id"
        case paddID = "padd_id"
        case placeOfBirth = "place_of_birth"
        case childNumber = "child_number"
        case landlineNumber = "landline_number"
        case contact
        case bankAccountNumber = "bank_account_number"
        case bankName = "bank_name"
        case email
        case marriedStatus = "married_status"
        case guardianRelation = "guardian_relation"
        case aadharNumber = "aadhar_number"
        case lastCollegeAttended = "last_college_attended"
        case isParentHaveDomicile = "is_parent_have_domicile"
    }
}

