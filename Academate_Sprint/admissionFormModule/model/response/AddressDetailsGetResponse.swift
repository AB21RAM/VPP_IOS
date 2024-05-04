//
//  AddressDetailsGetResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct AddressDetailsGetResponse: Codable {
    let radd: AddressDetails
    let padd: AddressDetails
    let code: Int
}

struct AddressDetails: Codable {
    var saddID: Int
    var address: String
    var domicileNumber: Int?

    enum CodingKeys: String, CodingKey {
        case saddID = "sadd_id"
        case address
        case domicileNumber = "domicile_number"
    }
}
