//
//  PaymentViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 31/01/24.
//

import Foundation
struct SingleFeeHeadItem : Identifiable{
    var id = UUID()
    var sfhID : Int
    var amount : String
    var headName : String
}
struct PaymentDataModel{
    var sfhList: [SingleFeeHeadItem] = []
}
class PaymentViewModel : ObservableObject{
    @Published var paymentDataModel : PaymentDataModel = PaymentDataModel()
    private let apiResource = StudentApiResource()
    init() {
        getSingleFeeHeadData()
    }
    func getSingleFeeHeadData() {
        apiResource.getStudentSingleFeeHeads { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let response = response {
                    self.paymentDataModel.sfhList = response.map { singleFeeHeadResponseElement in
                        SingleFeeHeadItem(
                            sfhID: singleFeeHeadResponseElement.sfhID,
                            amount: singleFeeHeadResponseElement.amount,
                            headName: singleFeeHeadResponseElement.headName
                        )
                    }
                    print("data is \(self.paymentDataModel.sfhList)")
                } else {
                    // Handle the case when the response is nil
                    print("Error: Unable to fetch SingleFeeHeadResponse")
                    // You may want to show an error message or perform other error-handling logic here
                }
            }
        }
    }


}
