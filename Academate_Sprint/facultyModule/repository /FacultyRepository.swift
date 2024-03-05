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
    
    
    func getFacultyDashboard(completion: @escaping (_ result: FacultyDashboardResponse?) -> Void) {
        apiResource.getFacultyDashboard(){ response in
            guard let response = response else {
                completion(nil)
                return
            }
            // MARK : todo the necessary computation
            completion(response)
        }
    }
    
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
    // input required
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
    
}