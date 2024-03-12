//
//  NoduesAllApplicationResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct NoduesAllApplicationResponse: Decodable {
    let data: [DataAllNew]
    let lcFlag: Int
    
    private enum CodingKeys: String, CodingKey {
        case data
        case lcFlag
    }
}

struct DataAllNew: Decodable {
    let batch: String?
    let bname: String?
    let branch: Int
    let category: String?
    let collegeId: String?
    let contact: String?
    let email: String?
    let feeReceipt: String?
    let grno: String?
    let id: Int
    let idPhoto: String?
    let name: String?
    let offerAdmit: String?
    let password: String?
    let previousLc: String?
    let proofId: String?
    let remarks: CustomDataType?
    let rstatus: CustomDataType?
    
    private enum CodingKeys: String, CodingKey {
        case batch, bname, branch, category, collegeId, contact, email, feeReceipt, grno, id, idPhoto, name, offerAdmit, password, previousLc, proofId, remarks, rstatus
    }
}
