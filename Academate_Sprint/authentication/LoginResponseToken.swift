//
//  LoginResponseToken.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import Foundation
struct LoginResponseToken: Decodable {
    var message, token, androidToken: String
}
