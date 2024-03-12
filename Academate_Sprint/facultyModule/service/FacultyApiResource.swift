//
//  FacultyApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//

import Foundation
import Alamofire
struct FacultyApiResource{
    let parent_url = "https://vppcoe-va.getflytechnologies.com"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
            return userDefaultsManager.getUid() ?? 0
        }
    /*
    func getFacultyDashboard(completionHandler: @escaping (_ result: FacultyDashboardResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/dashboard")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyDashboardResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
     */
    
    // Profile --> Need to do conditional UI Based on the Availabel data 
    func getFacultyDashboard(completionHandler: @escaping (_ result: FacultyDashboardResponse?) -> Void) {
        let baseURL = parent_url + "/api/faculty/dashboard"
        let parameters: [String: Any] = ["uid": uid]
        
        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: FacultyDashboardResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print(data)
                    completionHandler(data)
                case .failure(let error):
                    print("Error: \(error)")
                    completionHandler(nil)
                }
            }
    }
    // Punch Record
    func getFacultyPunchRecord(completionHandler: @escaping (_ result:FacultyPunchRecordResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/fetchPunchRecord")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyPunchRecordResponse.self) { response in
            print(response ?? "")
            completionHandler(response)
        }
    }
        
    // TO get the roles of the individual faculty --> need to do lot of computation
    func getFacultyMapping(completionHandler: @escaping (_ result:FacultyMappingResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/hr/add_Faculty_get")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyMappingResponse.self) { response in
            completionHandler(response)
        }
    }

    // used for the main Content to get name corresponds to the ID -> For ID check Punch Record get ID from there
    func getAllFacultyID(completionHandler: @escaping (_ result:AllFacultyIDResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/hr/fetchAllFacultyIds")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: AllFacultyIDResponse.self) { response in
            completionHandler(response)
        }
    }
    // use above id and implement it in the this and get personal details
    func getFacultyDetails(id: Int?, completionHandler: @escaping (_ result: FacultyDetailsResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/hr/fetchFaculty")!
        let queryItem = URLQueryItem(name: "id", value: "\(id ?? 0)")
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyDetailsResponse.self) { response in
            completionHandler(response)
        }
    }

    // Leave History
    func getFacultyLeaveHistory(completionHandler: @escaping (_ result:FacultyLeaveHistoryResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/leave_hisotry")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyLeaveHistoryResponse.self) { response in
            completionHandler(response)
        }
    }
    
    // apply leave --> data
    func getFacultyLeaveData(completionHandler: @escaping (_ result:FacultyLeaveDataResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/get_allowed_leaves")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyLeaveDataResponse.self) { response in
            completionHandler(response)
        }
    }
    // Also used to check whether the leaves are available or not --> Apply Leave
    func getFacultyLeaveCount(id: Int?, completionHandler: @escaping (_ result: FacultyLeaveCountResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/getLeaveCount")!
        let idQueryItem = URLQueryItem(name: "id", value: "\(id ?? 0)")
        let uidQueryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [idQueryItem, uidQueryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyLeaveCountResponse.self) { response in
            completionHandler(response)
        }
    }

    
    func getFacultyCancelledLeaves(completionHandler: @escaping (_ result:FacultyCancelledLeavesResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/faculty_cancelled_leave")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FacultyCancelledLeavesResponse.self) { response in
            completionHandler(response)
        }
    }

    
    
    func postFacultyLeaveApplication(
        leaveRequest : LeaveRequest,
        completioHandler: @escaping(_ result: FacultyBasicMesssageResponse?) -> Void
    ){
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "/api/faculty/Apply_leave"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(leaveRequest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: FacultyBasicMesssageResponse.self) { response in
            _ = completioHandler(response)
        }
    }
    
    func postFacultyTakeCharge(
        takeChargeRequest : TakeChargeRequest,
        completioHandler: @escaping(_ result: FacultyBasicMesssageResponse?) -> Void
    ){
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "/api/faculty/takeCharge"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(takeChargeRequest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: FacultyBasicMesssageResponse.self) { response in
            _ = completioHandler(response)
        }
    }
    /*
    func postFacultyLeaveApplication(leaveId: Int,
                                     halfFullDay: String,
                                     fromDate: String,
                                     toDate: String,
                                     reason: String,
                                     noOfDays: Double,
                                     alternate: Int,
                                     uid: Int,
                                     doc: String,
                                     completionHandler: @escaping (FacultyBasicMesssageResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/Apply_leave")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "POST"
        let parameters: [String: Any] = [
            "leave_id": leaveId,
            "half_full_day": halfFullDay,
            "from_date": fromDate,
            "to_date": toDate,
            "reason": reason,
            "no_of_date": noOfDays,
            "alternate": alternate,
            "uid": uid,
            "doc": doc
        ]
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Handle the response here
            if let error = error {
                print("Error: \(error)")
                completionHandler(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completionHandler(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseModel = try decoder.decode(FacultyBasicMesssageResponse.self, from: data)
                completionHandler(responseModel)
            } catch {
                print("Error decoding JSON: \(error)")
                completionHandler(nil)
            }
        }
        
        task.resume()
    }


    func postFacultyTakeCharge(leaveAppId: Int,
                               status: Int,
                               completionHandler: @escaping (FacultyBasicMesssageResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "/api/faculty/takeCharge")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "POST"
        let parameters: [String: Any] = [
            "app_id": leaveAppId,
            "status": status
        ]
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Handle the response here
            if let error = error {
                print("Error: \(error)")
                completionHandler(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completionHandler(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseModel = try decoder.decode(FacultyBasicMesssageResponse.self, from: data)
                completionHandler(responseModel)
            } catch {
                print("Error decoding JSON: \(error)")
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
*/
}
