//
//  ParentApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct ParentApiResource{
    let parent_url = "https://student.vppcoe.getflytechnologies.com/auth"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var token: String {
        return userDefaultsManager.getToken() ?? ""
    }

    
    func getGateAttendance(
        clgID : String,fromdate : String , toDate : String ,completionHandler: @escaping (_ result: ParentAttendanceResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/gateAttendance"))!
        let clgID = URLQueryItem(name: "studClgId", value: String(clgID)) // from the api
        let fromDate = URLQueryItem(name: "fromDate", value: String(fromdate)) // from UI
        let toDate  = URLQueryItem(name: "toDate", value: String(toDate)) // from UI
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [clgID,fromDate,toDate]
        var urlRequest = URLRequest(url: components.url!)
        let tokenString = "\(token)"
        urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: ParentAttendanceResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
//    yyyy-MM-dd
    func getStudentClgId(
        completionHandler: @escaping (_ result: StudentClgIDResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/getStudId"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentClgIDResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
