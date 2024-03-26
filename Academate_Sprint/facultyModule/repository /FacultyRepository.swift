//
//  FacultyRepository.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 02/03/24.
//

import Foundation
class FacultyRepository {
    private let apiResource = FacultyApiResource()
    private let userDefaultsManager = UserDefaultsManager.shared
    // MARK : Done
    func getFacultyDashboard(completion: @escaping (_ result: FacultyDashboardResponse?) -> Void) {
        apiResource.getFacultyDashboard(){ response in
            guard let response = response else {
                print("some error at repo ")
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    func getFacultyAlternateRequestList(completion :@escaping(_ result :[Alternate]?)-> Void){
        apiResource.getFacultyDashboard { result in
            guard let response = result else {
                print("some error at repo ")
                completion(nil)
                return
            }
            completion(response.alternate)
        }
    }
    
    // punch Record
    // MARK : Done
    func getFacultyPunchRecord(completion: @escaping (_ result:FacultyPunchRecordResponse?) -> Void) {
        apiResource.getFacultyPunchRecord(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    
    func getAllFacultyID(completion: @escaping (_ result:AllFacultyIDResponse?) -> Void) {
        apiResource.getAllFacultyID(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }

    func getFacultyMapping(completion: @escaping (_ result:FacultyMappingResponse?) -> Void) {
        apiResource.getFacultyMapping(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    
    func getFacultyDetails(id: Int?, completion: @escaping (_ result: FacultyDetailsResponse?) -> Void) {
        apiResource.getFacultyDetails(id: id){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    // Use to get the status of leave and depending get the desired list 
    func getFacultyLeaveHistory(completion: @escaping (_ result:FacultyLeaveHistoryResponse?) -> Void) {
        apiResource.getFacultyLeaveHistory(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    // apply leave 
    func getFacultyLeaveData(completion: @escaping (_ result:FacultyLeaveDataResponse?) -> Void) {
        apiResource.getFacultyLeaveData(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    
    func getFacultyLeaveCount(id: Int?, completion: @escaping (_ result: FacultyLeaveCountResponse?) -> Void) {
        apiResource.getFacultyLeaveCount(id : id){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }

    func getFacultyCancelledLeaves(completion: @escaping (_ result:FacultyCancelledLeavesResponse?) -> Void) {
        apiResource.getFacultyCancelledLeaves(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    
    func postTakeCharge(takechargeRequest : TakeChargeRequest,
                        completion : @escaping(_ result :String)-> Void){
        apiResource.postFacultyTakeCharge(takeChargeRequest: takechargeRequest) { result in
            if result?.message == "Success"{
                completion("Success")
            }else{
                completion("Error")
            }
        }
    }
    
    func postApplyLeave(leaveRequest : LeaveRequest,
                        completion : @escaping(_ result :String)-> Void){
        apiResource.postFacultyLeaveApplication(leaveRequest: leaveRequest) { result in
            if result?.message == "Success"{
                completion("Success")
            }else{
                completion("Error")
            }
        }
    }
}
