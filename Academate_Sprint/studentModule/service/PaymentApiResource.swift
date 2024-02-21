//
//  PaymentApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation


struct InitiatePaymentResponse: Codable {
    let status: Int
    let data: String
}
struct PaymentApiResource {
    func postInitiatePaymentData(amount: Float,
                                 hash: String,
                                 txnid: String,
                                 email: String,
                                 name: String,
                                 phone: Any?,
                                 productinfo: String,
                                 surl: String = "http://vppcoe-va.getflytechnologies.com/api/account/success_payment",
                                 furl: String = "http://vppcoe-va.getflytechnologies.com/api/account/failed_payment",
                                 key: String = "ZHJ8U1ZHPB",
                                 city: String = "",
                                 country: String = "",
                                 address1: String = "",
                                 address2: String = "",
                                 state: String = "",
                                 udf1: String = "",
                                 udf10: String = "",
                                 udf2: String = "",
                                 udf3: String = "",
                                 udf4: String = "",
                                 udf5: String = "",
                                 udf6: String = "",
                                 udf7: String = "",
                                 udf8: String = "",
                                 udf9: String = "",
                                 zipcode: String = "",
                                 completion: @escaping (_ result: InitiatePaymentResponse?) -> Void) {
        let urlString = "https://pay.easebuzz.in/payment/initiateLink"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Create form URL encoded data
        let formData = [
            "amount=\(amount)",
            "hash=\(hash)",
            "txnid=\(txnid)",
            "email=\(email)",
            "firstname=\(name)",
            "phone=\(phone ?? "")",
            "productinfo=\(productinfo)",
            "surl=\(surl)",
            "furl=\(furl)",
            "key=\(key)",
            "city=\(city)",
            "country=\(country)",
            "address1=\(address1)",
            "address2=\(address2)",
            "state=\(state)",
            "udf1=\(udf1)",
            "udf10=\(udf10)",
            "udf2=\(udf2)",
            "udf3=\(udf3)",
            "udf4=\(udf4)",
            "udf5=\(udf5)",
            "udf6=\(udf6)",
            "udf7=\(udf7)",
            "udf8=\(udf8)",
            "udf9=\(udf9)",
            "zipcode=\(zipcode)"
        ].joined(separator: "&")
        
        request.httpBody = formData.data(using: .utf8)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response here
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(InitiatePaymentResponse.self, from: data)
                    completion(responseModel)
                } catch let error {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
}

