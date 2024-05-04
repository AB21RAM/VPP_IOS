//
//  SendOTPResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct SendOTPResponse: Decodable {
    let message: String
    let otp: String
    
    private enum CodingKeys: String, CodingKey {
        case message
        case otp
    }
}
