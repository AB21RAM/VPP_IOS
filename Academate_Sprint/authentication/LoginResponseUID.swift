//
//  LoginResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation


struct LoginResponseUID: Decodable {
    var message: String
    var uid, userType: Int
    var isLogin: Bool

    enum CodingKeys: String, CodingKey {
        case message, uid
        case userType = "user_type"
        case isLogin
    }
}
