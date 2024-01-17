//
//  ApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation


struct ApiResource {
    
    let parent_url = "https://vppcoe-va.getflytechnologies.com/api"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
            return userDefaultsManager.getUid() ?? 0
        }
    func authenticate(
        loginREquest: LoginRequest,
        completioHandler: @escaping(_ result: LoginResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "/login"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponse.self) { response in
            _ = completioHandler(response)
        }
    }
    func fetchDashBoardData(
//        queryParameters: [String: String],
        completionHandler: @escaping (_ result: AdmissionDashBoardResponse?) -> Void
    ) {
        // Creating a base URL
        let baseURL = URL(string:
                            String(parent_url + "/admission/facultDashboard"))!
        
        // set the uid over here
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        // Adding query parameters to the base URL
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        
        // this is for multiple query items
//        queryParameters.map {
//            URLQueryItem(name: $0.key, value: $0.value )
//        }
        
        // Creating a URLRequest with the final URL
        var urlRequest = URLRequest(url: components.url!)
        
        // Setting the HTTP method to GET
        urlRequest.httpMethod = "GET"
        
        // Making a GET request using HttpUtility with the specified result type (YourResponseType)
        HttpUtility.shared.getData(request: urlRequest, resultType: AdmissionDashBoardResponse.self) { response in
            // Calling the completion handler with the response
            _ = completionHandler(response)
        }
    }

    func fetchPendingBranchWiseData(
//        queryParameters: [String: String],
        completionHandler: @escaping (_ result: String?) -> Void
    ) {
        // Creating a base URL
        let baseURL = URL(string:
                            String(parent_url + "/admission/pendingAppD"))!
        
        // set the uid over here
        let queryItem = URLQueryItem(name: "brach", value:"1")
        // Adding query parameters to the base URL
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        
        // this is for multiple query items
//        queryParameters.map {
//            URLQueryItem(name: $0.key, value: $0.value )
//        }
        
        // Creating a URLRequest with the final URL
        var urlRequest = URLRequest(url: components.url!)
        
        // Setting the HTTP method to GET
        urlRequest.httpMethod = "GET"
        
        // Making a GET request using HttpUtility with the specified result type (YourResponseType)
        HttpUtility.shared.getData(request: urlRequest, resultType: String.self) { response in
            // Calling the completion handler with the response
            _ = completionHandler(response)
        }
    }
    
    
}
