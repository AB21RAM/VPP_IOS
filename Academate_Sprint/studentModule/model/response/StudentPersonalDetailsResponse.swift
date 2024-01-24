//
//  StudentPersonalDetailsResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import Foundation
struct StudentPersonalDetailsResponse: Codable {
    var radd: [Radd]
    var code: Int
}

// MARK: - Radd
struct Radd: Codable {
    var personalID, studID: Int
    var name: String
    var genderID: Int
    var dob, religion, communitee, minority: String
    var caste, subCaste, nationality: String
    var raddID, paddID: Int
    var placeOfBirth, childNumber: String
    var landlineNumber: JSONNull?
    var contact, bankAccountNumber, bankName: String
    var email: JSONNull?
    var marriedStatus: String
    var guardianRelation: JSONNull?
    var aadharNumber, lastCollegeAttended: String
    var isParentHaveDomicile: JSONNull?
    
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
