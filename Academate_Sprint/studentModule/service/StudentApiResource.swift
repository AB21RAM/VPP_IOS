//
//  StudentApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import Foundation
struct StudentApiResource {
    
    let parent_url = "https://student.vppcoe.getflytechnologies.com/auth"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var token: String {
        return userDefaultsManager.getToken() ?? ""
    }
    func getStudentPersonalDetails(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/personalDetails"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
