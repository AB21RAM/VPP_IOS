//
//  AdmissionPendingResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 21/01/24.
//

import Foundation
 
struct AdmissionPendingResponseElement: Decodable {
    var pcs, pit, paids, pextc: Int
}

typealias AdmissionPendingResponse = [AdmissionPendingResponseElement]

