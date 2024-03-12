//
//  HODNoduesRemarkResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODNoduesRemarkResponse: Decodable {
    let message: String
    let success: Int
    
    private enum CodingKeys: String, CodingKey {
        case message, success
    }
}
