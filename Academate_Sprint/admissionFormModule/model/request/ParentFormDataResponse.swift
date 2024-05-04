//
//  ParentFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct ParentFormDataResponse: Codable {
    let fatherCont: String
    let fatherDesignation: String
    let fatherEmail: String
    let fatherFullName: String
    let fatherIncome: String
    let fatherOccupation: String
    
    let guardianCont: String
    let guardianDesignation: String
    let guardianEmail: String
    let guardianFullname: String
    let guardianIncome: String
    let guardianOccupation: String
    
    let motherCont: String
    let motherDesignation: String
    let motherEmail: String
    let motherFullName: String
    let motherIncome: String
    let motherOccupation: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case fatherCont = "father_cont"
        case fatherDesignation = "father_designation"
        case fatherEmail = "father_email"
        case fatherFullName = "father_fullName"
        case fatherIncome = "father_income"
        case fatherOccupation = "father_occupation"
        case guardianCont = "guardian_cont"
        case guardianDesignation = "guardian_designation"
        case guardianEmail = "guardian_email"
        case guardianFullname = "guardian_fullname"
        case guardianIncome = "guardian_income"
        case guardianOccupation = "guardian_occupation"
        case motherCont = "mother_cont"
        case motherDesignation = "mother_designation"
        case motherEmail = "mother_email"
        case motherFullName = "mother_fullName"
        case motherIncome = "mother_income"
        case motherOccupation = "mother_occupation"
        case uid
    }
}
