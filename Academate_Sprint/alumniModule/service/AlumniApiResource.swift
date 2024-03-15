//
//  AlumniApiService.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

// Tokenized Login


// ToBe --- > file uploading via  api

import Foundation
struct AlumniApiResource{
    let parent_url = "https://alumni.vppcoe.getflytechnologies.com/auth/"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var token: String {
        return userDefaultsManager.getToken() ?? ""
    }
    func postAlumniRegister(
        request: HODNoduesSignApplicationBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "register"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func postEmailCheck(
        request: HODNoduesSignApplicationBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "emailCheck"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func postLCFormSubmission(
        request: HODNoduesSignApplicationBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "FormSubmistion"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func postRemarkUpdateStatus(
        request: HODNoduesSignApplicationBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "updateRemark"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    
    
    func getFilledData(
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ) {
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "getAlumniData"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
//        urlRequest.httpBody = try? JSONEncoder().encode(request)// need to change the Request Data Type
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in // need to change the Request Data Type
            _ = completioHandler(response)
        }
    }
    
    func getLCStatus(
        completionHandler: @escaping (_ result: StudentDashboardResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "getLCStatus"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentDashboardResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getSingleFeeHeadAmount(
        completionHandler: @escaping (_ result: StudentDashboardResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "single_fee_amounts"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentDashboardResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getAlumniProfile(
        completionHandler: @escaping (_ result: StudentDashboardResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "profile"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentDashboardResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    /*
    func uploadImage(imageData: Data, completion: @escaping (Result<Data, Error>) -> Void) {
        // Define the URL
        guard let url = URL(string: "https://alumni.vppcoe.getflytechnologies.com/auth/uploadFile") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Create boundary string
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        // Create the body of the request
        var body = Data()
        
        // Append image data
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n")
        
        // Close the body
        body.append("--\(boundary)--\r\n")
        
        // Set the request body
        request.httpBody = body
        
        // Create URLSession
        let session = URLSession.shared
        
        // Perform the request
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        
        task.resume()
    }
     */
    /*
     @Multipart
            @POST("uploadFile")
            suspend fun postUploadImage(
                @Part file: MultipartBody.Part
            ): Response<UploadFileResponse>
     */
    
    
}
