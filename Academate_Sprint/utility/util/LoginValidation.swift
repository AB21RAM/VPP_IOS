//
//  LoginValidation.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation

struct ValidatioResult {
    var success: Bool = false
    var errorMessage: String?
}

struct LoginValidation {
    
    // Validate user inputs
    func validateUserInputs(userEmail: String, userPassword: String) -> ValidatioResult {
        
        if(userEmail.isEmpty || userPassword.isEmpty) {
            return ValidatioResult(success: false, errorMessage: "Email and password cannot be empty")
        }
        
        if(isValidEmail(value: userEmail) == false) {
            return ValidatioResult(success: false, errorMessage: "Email is incorrect")
        }
        
        return ValidatioResult(success: true, errorMessage: nil)
    }
    
    // Validate Email id
    private func isValidEmail(value: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        return regex.firstMatch(in: value, range: NSRange(location: 0, length: value.count)) != nil
    }
}
