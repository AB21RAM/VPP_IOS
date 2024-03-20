//
//  ParentRepository.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct studentParentAttendanceListItem : Identifiable{
    var id = UUID()
    var attDate: String
    var attId: Int
    var punchIn: String
    var punchOut: String
    var studClgId: String
    
}
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
    
    func getGateAttendance(fromdate : String , toDate : String ,completionHandler: @escaping (_ result: [studentParentAttendanceListItem]) -> Void){
        var clgIDAct = ""
        self.getClgID { Id in
            clgIDAct = Id ?? "Error"
        }
        apiResource.getGateAttendance(clgID: clgIDAct, fromdate: fromdate, toDate: toDate) { result in
            if result?.attendance != nil {
                
                let data : [studentParentAttendanceListItem] = result?.attendance.compactMap { attendance in
                    
                    return studentParentAttendanceListItem(attDate: attendance.attDate, attId: attendance.attId, punchIn: attendance.punchIn, punchOut: attendance.punchIn, studClgId: attendance.studClgId)
                } ?? []
                completionHandler(data)

            }else{
                completionHandler([])
            }
            
        }
    }
    
}
