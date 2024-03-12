//
//  HODPresentFacultyCountResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODPresentFacultyCountResponse: Decodable {
    let presentCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case presentCount
    }
}

