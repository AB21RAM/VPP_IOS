//
//  ParentRepository.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
class ParentRepository{
    private let apiResource = ParentApiResource()
    
    func getClgID(completion: @escaping (String?) -> Void) {
        apiResource.getStudentClgId { result in
            // Addtional Error Handling If Required
            if let data = result{
                completion(data.clgId)
            }else{
                completion(nil)
            }
        }
    }
    
    func getGateAttendance(fromdate : String , toDate : String ,completionHandler: @escaping (_ result: [Attendance?]) -> Void){
        var clgIDAct = ""
        self.getClgID { Id in
            clgIDAct = Id ?? "Error"
        }
        apiResource.getGateAttendance(clgID: clgIDAct, fromdate: fromdate, toDate: toDate) { result in
            if result?.attendance != nil {
                completionHandler(result?.attendance ?? [])
            }else{
                completionHandler([])
            }
            
        }
    }
    
}
