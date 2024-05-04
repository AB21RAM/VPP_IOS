//
//  PersonalDetailsFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct PersonalDetailsFormDataResponse: Codable {
    var aadharNumber: String
    var bankAccountNumber: String
    var bankName: String
    var caste: String
    var childNumber: Int
    var community: String
    var contact: String
    var dob: String
    var fullName: String
    var gender: Int
    var lastCollege: String
    var minority: String
    var nationality: String
    var pob: String
    var religion: String
    var status: Int
    var subCaste: String
    var uid: Int
    
    private enum CodingKeys: String, CodingKey {
        case aadharNumber = "aadhar_number"
        case bankAccountNumber = "bank_account_number"
        case bankName = "bank_name"
        case caste
        case childNumber = "child_number"
        case community
        case contact
        case dob
        case fullName = "fullName"
        case gender
        case lastCollege = "last_college"
        case minority
        case nationality
        case pob
        case religion
        case status
        case subCaste = "sub_caste"
        case uid
    }
}
