//
//  AddressFormDataResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct AddressFormDataResponse: Codable {
    let address: String
    let checked: String
    let pAddress: String
    let uid: String
    
    private enum CodingKeys: String, CodingKey {
        case address = "Address"
        case checked
        case pAddress
        case uid
    }
}
