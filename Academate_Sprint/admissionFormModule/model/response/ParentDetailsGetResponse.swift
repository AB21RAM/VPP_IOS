//
//  ParentDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct ParentDetailsGetResponse: Codable {
    var radd: [RaddParent]
    var code: Int
}

// MARK: - Radd
struct RaddParent: Codable {
    var parentID: Int
    var fullname : String?
    var contact : String?
    var email : String?
    var occupation : String?
    var designation : String?
    var income: String?

    enum CodingKeys: String, CodingKey {
        case parentID = "parent_id"
        case fullname, contact, email, occupation, designation, income
    }
}
