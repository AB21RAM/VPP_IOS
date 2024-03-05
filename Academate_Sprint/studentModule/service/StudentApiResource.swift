//
//  StudentApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import Foundation
import Alamofire
/// ToBe -- Entrance Details need to implement & Payment Option for the Large Payment -- Total Fee
struct StudentApiResource {
    
    let parent_url = "https://student.vppcoe.getflytechnologies.com/auth"
    
    let userDefaultsManager = UserDefaultsManager.shared
    var token: String {
        return userDefaultsManager.getToken() ?? ""
    }
    // MARK: - Personal Data
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
    func getStudentDashboard(
        completionHandler: @escaping (_ result: StudentDashboardResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/studentDashboard"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentDashboardResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    // MARK: - Doc Data
    func getStudentDocs(completionHandler: @escaping (_ result: StudentDocLinkResponse?) -> Void) {
        let baseURL = "\(parent_url)/upload"
        let headers: HTTPHeaders = ["Authorization": "\(token)"]
        
        AF.request(baseURL, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(StudentDocLinkResponse.self, from: data)
                    print(result )
                    completionHandler(result)
                } catch {
                    print("Error decoding response: \(error)")
                    completionHandler(nil)
                }
            case .failure(let error):
                print("Network request failed: \(error)")
                completionHandler(nil)
            }
        }
    }
    /*
    func getStudentDocs(
        completionHandler: @escaping (_ result: StudentDocLinkResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/upload"))!
        var urlRequest = URLRequest(url: baseURL)
        print("token is :: \(token)")
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentDocLinkResponse.self) { response in
            print(response ?? "API DATA")
            _ = completionHandler(response)
        }
    }
    */
    // MARK: - Payment Data
    func getStudentPaymentData(
        paymentDataRequest: PaymentDataRequest,
        completioHandler: @escaping(_ result: PaymentDataResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/initiate_payment"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
        
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(paymentDataRequest)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: PaymentDataResponse.self) { response in
            _ = completioHandler(response)
        }
    }
    
    func getStudentSingleFeeHeads(
        completionHandler: @escaping (_ result: SingleFeeHeadResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/single_fee_amounts"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: SingleFeeHeadResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    func getStudentFeeStructure(
        completionHandler: @escaping (_ result: StudentFeeStructureResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/feeStructureStud"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentFeeStructureResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    func getStudentBalanceFee(
        completionHandler: @escaping (_ result: StudentBalanceFeeResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/FetchBalanceFee_uid"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentBalanceFeeResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    // MARK: - Educational Data
    /*
    func getStudentCurrEduDetails(completionHandler: @escaping (_ result: StudentCurrEduDetailsResponse?) -> Void) {
        let baseURL = "\(parent_url)/currentEducation_per"
        let headers: HTTPHeaders = ["Authorization": token]
        
        // Check if cached response is available
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: URL(string: baseURL)!)) {
            // If cached response is available, decode and return it
            do {
                let data = cachedResponse.data
                let decodedResponse = try JSONDecoder().decode(StudentCurrEduDetailsResponse.self, from: data)
                completionHandler(decodedResponse)
                return
            } catch {
                print("Error decoding cached response: \(error)")
            }
        }
        
        // If cached response is not available or decoding fails, make network request
        AF.request(baseURL, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: StudentCurrEduDetailsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                    // Cache the response for future use
                    if let httpResponse = response.response {
                        let cachedResponse = CachedURLResponse(response: httpResponse, data: response.data!)
                        URLCache.shared.storeCachedResponse(cachedResponse, for: response.request!)
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    completionHandler(nil)
                }
            }
    }
*/

    
    func getStudentCurrEduDetails(completionHandler: @escaping (_ result: StudentCurrEduDetailsResponse?) -> Void) {
        let baseURL = "\(parent_url)/currentEducation_per"
        let headers: HTTPHeaders = ["Authorization": token]
        
        AF.request(baseURL, method: .get, headers: headers)
            .validate()
            .cacheResponse(using: ResponseCacher.cache)
            .responseDecodable(of: StudentCurrEduDetailsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    print("Error: \(error)")
                    completionHandler(nil)
                }
            }
    }
    
    /*
    func getStudentCurrEduDetails(
        completionHandler: @escaping (_ result: StudentCurrEduDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/currentEducation_per"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentCurrEduDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    */
    func getStudentSemDetails(
        completionHandler: @escaping (_ result: StudentSemDetailsResponse?) -> Void
    ) {
        let baseURL = URL(string:
                            String(parent_url + "/semDetails"))!
        var urlRequest = URLRequest(url: baseURL)
        let tokenString = "\(token)"
                urlRequest.setValue(tokenString, forHTTPHeaderField: "Authorization")
                
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentSemDetailsResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    
}
