//
//  PaymentCoordinator.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 30/01/24.
//

import Foundation
import SwiftUI
import Easebuzz
import CryptoKit
/*
struct PaymentCoordinatorDataModel{
    var collegeID : String = String()
    var id : String = String() // fhid from the click
    
    var name : String = String()
    var email : String = String()
    var contact : UInt64 = UInt64()
    var txnid : String = String()
    var amount : Float = Float()
    var fh : String = String()
    
    var hash : String = String()
    
    var dataKey : String = String()
}
*/
class PaymentCoordinator: NSObject, ObservableObject, PayWithEasebuzzCallback {
//    @Published var paymentCoordinatorDataModel :PaymentCoordinatorDataModel = PaymentCoordinatorDataModel()
    @Published var paymentCompleted = false
//    private let apiResource = StudentApiResource()
//    private let payApiResource = PaymentApiResource()
//    let userDefaultsManager = UserDefaultsManager.shared
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
    
    
    
    //    func getInitiatePaymentData(){
    //        self.paymentCoordinatorDataModel.collegeID = self.userDefaultsManager.getCollegeID() ?? ""
    //        let paymentDataRequest = PaymentDataRequest(collegeID: paymentCoordinatorDataModel.collegeID , id: paymentCoordinatorDataModel.id)
    //        apiResource.getStudentPaymentData(paymentDataRequest: paymentDataRequest){ response in
    //            DispatchQueue.main.async {
    //                if response?.txnid != "null" {
    //                    self.paymentCoordinatorDataModel.amount = response?.amount ?? "0"
    //                    self.paymentCoordinatorDataModel.name = response?.name ?? "0"
    //                    self.paymentCoordinatorDataModel.txnid = response?.txnid ?? "0"
    //                    self.paymentCoordinatorDataModel.fh = response?.fh ?? "0"
    //                    self.paymentCoordinatorDataModel.email = response?.email ?? "0"
    //                    self.paymentCoordinatorDataModel.contact = response?.contact ?? "0"
    //                }
    //            }
    //        }
    //    }
    //
    //    func generateHash(){
    //        let key = "ZHJ8U1ZHPB"
    //        let hashString = "\(key)|\(self.paymentCoordinatorDataModel.txnid)|\(self.paymentCoordinatorDataModel.amount.trimmingCharacters(in: .whitespaces))|\(self.paymentCoordinatorDataModel.fh)|\(self.paymentCoordinatorDataModel.name)|\(self.paymentCoordinatorDataModel.email)|||||||||||39Z5CCABM0"
    //        var Hash = encryptString(input: hashString)
    //        self.paymentCoordinatorDataModel.hash = Hash
    //    }
    //
    //    func encryptString(input: String) -> String {
    //        let inputData = input.data(using: .utf8)!
    //        let hashedData = SHA512.hash(data: inputData)
    //        let hashString = hashedData.map { String(format: "%02hhx", $0) }.joined()
    //        return hashString
    //    }
    //
    //    func getPaymentKeyData(){
    //        payApiResource.postInitiatePaymentData(amount: Float(self.paymentCoordinatorDataModel.amount) ?? 10.0, hash: self.paymentCoordinatorDataModel.hash, txnid: self.paymentCoordinatorDataModel.txnid, email: self.paymentCoordinatorDataModel.email, name: self.paymentCoordinatorDataModel.name, phone: self.paymentCoordinatorDataModel.contact, productinfo: self.paymentCoordinatorDataModel.fh){ response in
    //            if response?.status == 1{
    //                self.paymentCoordinatorDataModel.dataKey = response?.data ?? ""
    //            }
    //        }
    //    }
    /*
    func buttonClicked() {
        getInitiatePaymentData { result in
            switch result {
            case .success:
                // Continue with other UI updates or logic
                self.initiatePaymentAction()
                break
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
   
    private func getInitiatePaymentData(completion: @escaping (Result<Void, Error>) -> Void) {
        paymentCoordinatorDataModel.collegeID = self.userDefaultsManager.getCollegeID() ?? ""
        let paymentDataRequest = PaymentDataRequest(collegeID: "VU1F2122010", id: "1")
        
        apiResource.getStudentPaymentData(paymentDataRequest: paymentDataRequest) { [weak self] response in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if response?.txnid != "null" {
                    self.paymentCoordinatorDataModel.amount = Float(response?.amount ?? "10.0") ?? 10.0
                    self.paymentCoordinatorDataModel.name = response?.name ?? "0"
                    self.paymentCoordinatorDataModel.txnid = response?.txnid ?? "0"
                    self.paymentCoordinatorDataModel.fh = response?.fh ?? "0"
                    self.paymentCoordinatorDataModel.email = response?.email ?? "0"
                    self.paymentCoordinatorDataModel.contact = UInt64(response?.contact ?? "1000000000") ?? 1000000000
                    
                    print(self.paymentCoordinatorDataModel.amount)
                }
                
                do {
                    try self.generateHash(completion: completion)
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func generateHash(completion: @escaping (Result<Void, Error>) -> Void) throws {
        let key = "ZHJ8U1ZHPB"
        let hashString = "\(key)|\(self.paymentCoordinatorDataModel.txnid)|\(self.paymentCoordinatorDataModel.amount)|\(self.paymentCoordinatorDataModel.fh.components(separatedBy: " ").first)|\(self.paymentCoordinatorDataModel.name.components(separatedBy: " ").first)|\(self.paymentCoordinatorDataModel.email)|||||||||||39Z5CCABM0"
        let Hash = try encryptString(input: hashString)
        print(Hash)
        self.paymentCoordinatorDataModel.hash = Hash
        
        print("\(self.paymentCoordinatorDataModel.txnid)")
        print("\(self.paymentCoordinatorDataModel.email)")
        print("\(self.paymentCoordinatorDataModel.amount)")
        print("\(self.paymentCoordinatorDataModel.fh.components(separatedBy: " ").first)")
        print("\(self.paymentCoordinatorDataModel.name.components(separatedBy: " ").first)")
        do {
            try self.getPaymentKeyData(completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
    
    private func encryptString(input: String) throws -> String {
        let inputData = input.data(using: .utf8)!
        let hashedData = SHA512.hash(data: inputData)
        let hashString = hashedData.map { String(format: "%02hhx", $0) }.joined()
        return hashString
    }
    private func getPaymentKeyData(completion: @escaping (Result<Void, Error>) -> Void) throws {
        payApiResource.postInitiatePaymentData(
            amount: self.paymentCoordinatorDataModel.amount,
            hash: self.paymentCoordinatorDataModel.hash,
            txnid: self.paymentCoordinatorDataModel.txnid,
            email: self.paymentCoordinatorDataModel.email,
            name: self.paymentCoordinatorDataModel.name.components(separatedBy: " ").first ?? "Name",
            phone: self.paymentCoordinatorDataModel.contact,
            productinfo: self.paymentCoordinatorDataModel.fh.components(separatedBy: " ").first ?? "Info"
        ) { response in
            if response?.status == 1 {
                self.paymentCoordinatorDataModel.dataKey = response?.data ?? ""
                print("\(String(describing: response?.data))")
                completion(.success(()))
            } else {
                print("\(String(describing: response?.data))")
                let error = NSError(domain: "YourDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid response from the server"])
                completion(.failure(error))
            }
        }
    }
    func initiatePaymentAction() {
        let orderDetails = [
            "access_key": self.paymentCoordinatorDataModel.dataKey,
            "pay_mode": "production"  // Use the dataKey in your payment initiation logic
        ] as [String:String]
        
        let payment = Payment.init(customerData: orderDetails)
        let paymentValid = payment.isValid().validity
        
        if !paymentValid {
            print("Invalid records")
        } else {
            PayWithEasebuzz.invokePaymentOptionsView(paymentObj: payment, isFrom: self)
        }
    }
    // TODO : need to combine all this at one place
    func paymentCallback() {
        // Handle payment completion logic here
        paymentCompleted = true
    }
    */
}
