//
//  LoginEndpoint.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 24/01/24.
//

import Foundation

struct LoginEndpoint{
    let uid_url = "https://vppcoe-va.getflytechnologies.com/api"
    let student_url = "https://student.vppcoe.getflytechnologies.com/auth"
    func uid_authenticate(
        loginREquest: LoginRequest,
        completioHandler: @escaping(_ result: LoginResponseUID?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(uid_url + "/login"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponseUID.self) { response in
            _ = completioHandler(response)
        }
    }
    func token_authenticate(
        loginREquest: LoginRequest,
        completioHandler: @escaping(_ result: LoginResponseToken?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(student_url + "/login"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponseToken.self) { response in
            _ = completioHandler(response)
        }
    }
}
