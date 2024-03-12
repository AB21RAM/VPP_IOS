//
//  HodApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//
// tokenized Login
import Foundation
struct HodApiResource{
    let parent_url = "https://hod.vppcoe.getflytechnologies.com/auth/"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var token: String {
        return userDefaultsManager.getToken() ?? ""
    }
    
    func getHODStudentListDetails(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "myStudents"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getHODFacultyListDetails(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getMyFaculties"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getHODPresentFacultyDetails(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "presentFaculty"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getHODApprovedLeavesDetails(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getApprovedLeaves"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getHODDepartmentId(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getDepartId"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getVisitorsList(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getVisitors"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getNoDuesApplications(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getAllNoDues"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getAllSignedNoDues(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getAllSignedNoDues"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getAllRemarkedNoDues(
        completionHandler: @escaping (_ result: StudentPersonalDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getAllRemarkedNoDues"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "Bearer \(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentPersonalDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    // Need to implement this
    /*
    @GET("viewDoc/{fileName}")
           suspend fun getAllRemarkedNoDues(
               @Path("fileName") fileName: String
           ): Response<HODGetRemarkedNoduesReponse>
    */
    
    func updateVisitorStatus(
        loginREquest: LoginRequest, // need to change the Request Data Type
        completioHandler: @escaping(_ result: LoginResponseUID?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "visitorStatus"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponseUID.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func postAddNoduesRemark(
        loginREquest: LoginRequest, // need to change the Request Data Type
        completioHandler: @escaping(_ result: LoginResponseUID?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "addRemark"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponseUID.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func postFormSignNodues(
        loginREquest: LoginRequest, // need to change the Request Data Type
        completioHandler: @escaping(_ result: LoginResponseUID?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "formSign"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginREquest)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponseUID.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
}
