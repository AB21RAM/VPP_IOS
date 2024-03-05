//
//  FacultyBasicMesssageResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation

struct FacultyBasicMesssageResponse: Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
