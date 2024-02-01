//
//  PaymentCoordinator.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
import SwiftUI
import Easebuzz

class PaymentCoordinator: NSObject, ObservableObject, PayWithEasebuzzCallback {
    @Published var paymentCompleted = false
    func PEBCallback(data: [String : AnyObject]) { // Handle Payment response_response key, it is a anyObject
        let payment_response = data["payment_response"]
        print(payment_response ?? "")
        if payment_response as? [String:Any] != nil {
            // payment_response is Json Response
            print("Json response")
        }else{
            print("String response")
            // payment_response is String
        }
        // Handle result Key : It should be in string
        let result = data["result"] as! String
    }
    

    func paymentCallback() {
        // Handle payment completion logic here
        paymentCompleted = true
    }
    
    
}
