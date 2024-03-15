//
//  SimpleResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct SimpleResponse: Decodable {
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case message
    }
}
