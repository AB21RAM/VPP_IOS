//
//  PaymentsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/01/24.
//

import SwiftUI
import Easebuzz
struct PaymentsView: View {
    @StateObject private var paymentCoordinator = PaymentCoordinator()
    @StateObject private var paymentViewModel = PaymentViewModel()
    @State private var selectedItem: SingleFeeHeadItem?
    @State private var animationCount = 0
    
    var body: some View {
        VStack{
            Text("Payment")
            Divider()
            HStack{
                Text("Amount Paid:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("xxxxxx")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            Button {
                initiatePaymentAction()
            } label: {
                Text("Payment")
            }
//            Text("PaymentData")
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 10) {
                    ForEach(paymentViewModel.paymentDataModel.sfhList, id: \.id) { item in
                        Button(action: {
                            selectedItem = item
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
                        })
                    }
                }
            }
            
        }.onAppear {
            // Set up the coordinator
            PayWithEasebuzz.setUp(pebCallback: paymentCoordinator)
        }
    }
    func initiatePaymentAction() {
        // Your existing payment initiation logic
        let orderDetails = [
            "access_key": "Pass access key generated in Initiate Payment API",
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
}

#Preview {
    PaymentsView()
}
