//
//  CustomDataType.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation

enum CustomDataType : Decodable {
    case string(String)
    case integer(Int)
    case double(Double)
    case null

    init(_ value: Any?) {
        guard let value = value else {
            self = .null
            return
        }

        if let stringValue = value as? String {
            self = .string(stringValue)
        } else if let intValue = value as? Int {
            self = .integer(intValue)
        } else if let doubleValue = value as? Double {
            self = .double(doubleValue)
        } else {
            // Handle other data types
            self = .string("") // or any default value
        }
    }
}
