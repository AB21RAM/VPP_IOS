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
    var totalAmount : String = String()
    var balanceAmount : String = String()
    var FeeStructure : [FeeStructureData]? = []
}
class PaymentViewModel : ObservableObject{
    @Published var paymentDataModel : PaymentDataModel = PaymentDataModel()
    private let apiResource = StudentApiResource()
    private let repository = StudentRepository()
    init() {
        getSingleFeeHeadData()
        getStudentFeeData()
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
    
    func getStudentFeeData(){
        repository.getStudentBalanceAmount { data in
            DispatchQueue.main.async{
                self.paymentDataModel.balanceAmount = data?.balanceAmount ?? ""
            }
        }
        
        repository.getStudentFeeStructure { data in
            DispatchQueue.main.async{
                self.paymentDataModel.totalAmount = data?.totalAmount ?? ""
                self.paymentDataModel.FeeStructure = data?.feeStructure
            }
        }
    }
    
}
