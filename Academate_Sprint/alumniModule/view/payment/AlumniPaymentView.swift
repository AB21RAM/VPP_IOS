//
//  AlumniPaymentView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//


import SwiftUI
import Easebuzz
import Foundation
import CryptoKit

struct AlumniPaymentView: View {
    @StateObject private var paymentCoordinator = PaymentCoordinator()
    @StateObject private var paymentViewModel = PaymentViewModel()
    @State private var selectedItem: SingleFeeHeadItem?
    @State private var animationCount = 0
    
    let userDefaultsManager = UserDefaultsManager.shared
    
    @State private var collegeID: String = ""
    @State private var amount: Float = 0.0
    @State private var name: String = ""
    @State private var txnid: String = ""
    @State private var fh: String = ""
    @State private var email: String = ""
    @State private var contact: UInt64 = 1000000000
    @State private var hash: String = ""
    @State private var dataKey: String = ""
    @State private var showingAlert = false
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                LazyHStack(alignment: .top, spacing: 10) {
                    ForEach(paymentViewModel.paymentDataModel.sfhList, id: \.id) { item in
                        Button(action: {
                            selectedItem = item
                            showingAlert = true
                            Task {
                                await initiatePayment(id: String(item.sfhID))
//                                await initiatePaymentAction()
                            }
                            
                        }, label: {
                            VStack{
                                HStack{
                                    Text("\(item.headName)")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    //                                    Image(systemName: "indianrupeesign.square")
                                }
                                
                                Divider()
                                HStack{
                                    Image(systemName: "indianrupeesign")
                                    Text("\(item.amount)")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                }
                            }
                            .modifier(CardModifier(paddingValue: 10, backgroundColor: .white, cornerRadius: 15, foregroundColor: Color("toolbar"), font: .title2))
                        }).alert("Continue With Payment ?", isPresented: $showingAlert) {
                            Button("YES", role: .cancel) {
                                Task{
                                    await initiatePaymentAction()
                                }
                            }
                            Button("NO", role: .destructive) {}
                        }
                    }
                }
            }
        }.onAppear {
            // Set up the coordinator
            PayWithEasebuzz.setUp(pebCallback: paymentCoordinator)
        }
    }
    func initiatePaymentAction() async{
        // Your existing payment initiation logic
        let orderDetails = [
            "access_key": self.dataKey,
            "pay_mode": "production"
        ] as [String:String]
        
        let payment = Payment.init(customerData: orderDetails)
        let paymentValid = payment.isValid().validity
        
        if !paymentValid {
            print("Invalid records")
        } else {
            PayWithEasebuzz.invokePaymentOptionsView(paymentObj: payment, isFrom: self)
        }
    }
    private func initiatePayment(id : String) async{
        
        let paymentDataRequest = PaymentDataRequest(collegeID: userDefaultsManager.getCollegeID() ?? "", id: id)
        // MARK --- To do Add the Alumni API Here 
        StudentApiResource().getStudentPaymentData(paymentDataRequest: paymentDataRequest) { selfResponse in
            
            DispatchQueue.main.async {
                if let response = selfResponse, response.txnid != "null" {
                    self.amount = Float(response.amount) ?? 10.0
                    self.name = response.name
                    self.txnid = response.txnid
                    self.fh = response.fh
                    self.email = response.email
                    self.contact = UInt64(response.contact) ?? 100000000000
                    
                    print(self.amount)
                    
                    do {
                        let key = "ZHJ8U1ZHPB"
                        let hashString = "\(key)|\(self.txnid)|\(self.amount)|2024|\(self.name.components(separatedBy: " ").first ?? "")|\(self.email)|||||||||||39Z5CCABM0"
                        print(hashString)
                        let Hash = try self.encryptString(input: hashString)
                        print(Hash)
                        self.hash = Hash
                        
                        print("\(self.txnid)")
                        print("\(self.email)")
                        print("\(self.amount)")
                        print("\(self.contact)")
                        print("\(self.fh.components(separatedBy: " ").first ?? "")")
                        print("\(self.name.components(separatedBy: " ").first ?? "")")
                        
                        PaymentApiResource().postInitiatePaymentData(
                            amount: self.amount,
                            hash: self.hash,
                            txnid: self.txnid,
                            email: self.email,
                            name: self.name.components(separatedBy: " ").first ?? "Name",
                            phone: self.contact,
                            productinfo: "2024"
                        ) { response in
                            if response?.status == 1 {
                                self.dataKey = response?.data ?? ""
                                print("Important\(String(describing: response?.data))")
    //                            initiatePaymentAction()
    //                            completion()
                                
                            } else {
                                print("Important New\(String(describing: response?.data))")
                            }
                        }
                        
                    } catch {
                        print("Error generating hash or making payment request: \(error)")
                    }
                }
            }
        }
    }

    private func encryptString(input: String) throws -> String {
        let inputData = input.data(using: .utf8)!
        let hashedData = SHA512.hash(data: inputData)
        let hashString = hashedData.map { String(format: "%02hhx", $0) }.joined()
        return hashString
    }
}

#Preview {
    AlumniPaymentView()
}
