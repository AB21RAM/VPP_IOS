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
    let saddId: Int
    let address: String
    let domicileNumber: Int?
}
