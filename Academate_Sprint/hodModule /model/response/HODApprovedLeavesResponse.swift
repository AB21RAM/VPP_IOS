//
//  HODApprovedLeavesResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//
import Foundation
struct HODApprovedLeavesResponse: Decodable {
    let approvedLeaves: [ApprovedLeave]
    
    private enum CodingKeys: String, CodingKey {
        case approvedLeaves
    }
}

struct ApprovedLeave: Decodable {
    let alternate: Int
    let alternateFacultyClgId: String
    let alternateFacultyName: String
    let appliedDate: CustomDataType  // You may want to replace Any? with the actual type if applicable
    let docLink: CustomDataType // You may want to replace Any? with the actual type if applicable
    let facultyId: Int
    let fromDate: String
    let halfFullDay: String
    let leaveAppId: Int
    let leaveId: Int
    let noOfDays: Double
    let primaryFacultyClgId: String
    let primaryFacultyName: String
    let reason: String
    let signedByHod: Int
    let signedByPrincipal: CustomDataType // You may want to replace Any? with the actual type if applicable
    let status: Int
    let statusAlternate: Int
    let toDate: String

    private enum CodingKeys: String, CodingKey {
        case alternate
        case alternateFacultyClgId = "alternate_faculty_clg_id"
        case alternateFacultyName = "alternate_faculty_name"
        case appliedDate = "applied_date"
        case docLink = "doc_link"
        case facultyId = "faculty_id"
        case fromDate = "from_date"
        case halfFullDay = "half_full_day"
        case leaveAppId = "leave_app_id"
        case leaveId = "leave_id"
        case noOfDays = "no_of_days"
        case primaryFacultyClgId = "primary_faculty_clg_id"
        case primaryFacultyName = "primary_faculty_name"
        case reason
        case signedByHod = "signed_by_hod"
        case signedByPrincipal = "signed_by_principal"
        case status
        case statusAlternate = "status_alternate"
        case toDate = "to_date"
    }
}


//enum CustomDataType : Decodable {
//    case string(String)
//    case integer(Int)
//    case double(Double)
//    case null
//
//    init(_ value: Any?) {
//        guard let value = value else {
//            self = .null
//            return
//        }
//
//        if let stringValue = value as? String {
//            self = .string(stringValue)
//        } else if let intValue = value as? Int {
//            self = .integer(intValue)
//        } else if let doubleValue = value as? Double {
//            self = .double(doubleValue)
//        } else {
//            // Handle other data types
//            self = .string("") // or any default value
//        }
//    }
//}
