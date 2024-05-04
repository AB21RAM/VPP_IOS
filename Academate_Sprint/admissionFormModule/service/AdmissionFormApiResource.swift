//
//  AdmissionFormApiResource.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 04/05/24.
//

import Foundation
struct AdmissionFormApiResource {
    let parent_url = "https://vppcoe-va.getflytechnologies.com/"
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    // MARK: - GET Request
    func getStudentDashboard(completionHandler: @escaping (_ result: StudentAdmissionDashboardResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/studentDashboard")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: StudentAdmissionDashboardResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    func getIsSubmitted(completionHandler: @escaping (_ result: SubmittedResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/isSubmitted")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: SubmittedResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getPersonalDetails(completionHandler: @escaping (_ result: PersonalDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/personalDetails")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: PersonalDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getParentDetails(completionHandler: @escaping (_ result: ParentDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/parentDetails")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: ParentDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getOTPDetails(phone: String, completionHandler: @escaping (_ result: SendOTPResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/sendOtp")!
        let queryItem = URLQueryItem(name: "phone", value: phone)
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: SendOTPResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getAddressDetails(uid: String, completionHandler: @escaping (_ result: AddressDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/addDetails")!
        let queryItem = URLQueryItem(name: "uid", value: uid)
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: AddressDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getPreviousCourseDetails(completionHandler: @escaping (_ result: PreviousCourseDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/currentEducation")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: PreviousCourseDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getPresentCourseDetails(completionHandler: @escaping (_ result: PresentCourseDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/currentEducation_per")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: PresentCourseDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    
    func getEntranceDetails(completionHandler: @escaping (_ result: EntranceDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/entrance")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: EntranceDetailsGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    func getSemDetails(completionHandler: @escaping (_ result: SemDetailsGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/sem")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        HttpUtility.shared.getData(request: urlRequest, resultType: SemDetailsGetResponse.self) { response in
            completionHandler(response)
        }
    }
    
    
    func getUploadDocs(completionHandler: @escaping (_ result: UploadDocGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/upload")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: UploadDocGetResponse.self) { response in
            print(response ?? "no data found")
            completionHandler(response)
        }
    }
    func getStudentFeeStructure(completionHandler: @escaping (_ result: FeeStructureGetResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/feeStructureStud")!
        let queryItem = URLQueryItem(name: "uid", value: String(uid))
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [queryItem]
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FeeStructureGetResponse.self) { response in
            completionHandler(response)
        }
    }
    
    func getAllFh(completionHandler: @escaping (_ result: FetchFhGetAdmissionResponse?) -> Void) {
        let baseURL = URL(string: parent_url + "api/admission/fetchAllFh")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "GET"
        
        HttpUtility.shared.getData(request: urlRequest, resultType: FetchFhGetAdmissionResponse.self) { response in
            completionHandler(response)
        }
    }
    
    // MARK: - POST REQUEST
    func postSignUp(
        request : FormDataSignUp,
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ){
        var urlRequest  = URLRequest(url: URL(string: String(parent_url + "api/admission/signup"))!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            _ = completioHandler(response)
        }
    }
    
    func postPersonalDetails(request: PersonalDetailsFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/personalDetails")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postParentDetails(request: ParentFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/parentDetails")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postAddressDetails(request: AddressFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/addDetails")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postSSCDetails(request: SCCFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/ssc")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postHSCDetails(request: HSCFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/hsc")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postDiplomaDetails(request: DiplomaFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/diploma")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postEntranceDetails(request: EntranceFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/entrance")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    
    func postSemDetails(request: SemFormDataResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/sem")!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
            completioHandler(response)
        }
    }
    //
    //    func postUploadDocs(request: UploadDocsBodyResponse, completioHandler: @escaping (_ result: SimpleResponse?) -> Void) {
    //        var urlRequest = URLRequest(url: URL(string: parent_url + "api/admission/upload")!)
    //        urlRequest.httpMethod = "POST"
    //        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    //        urlRequest.httpBody = try? JSONEncoder().encode(request)
    //
    //        HttpUtility.shared.postData(request: urlRequest, resultType: SimpleResponse.self) { response in
    //            completioHandler(response)
    //        }
    //    }
    
    //    func uploadDoc(file: MultipartBody.Part, completioHandler: @escaping (_ result: UploadFileResponse?) -> Void) {
    //        // Assuming MultipartBody.Part is a custom type representing a part of a multipart request
    //        // You may need to adjust this depending on your implementation
    //
    //        // Construct the URL request for the multipart request
    //        var urlRequest = URLRequest(url: URL(string: parent_url + "api/security/upload")!)
    //        urlRequest.httpMethod = "POST"
    //
    //        // Set the content type to multipart/form-data
    //        urlRequest.setValue("multipart/form-data; boundary=\(file.boundary)", forHTTPHeaderField: "Content-Type")
    //
    //        // Set the HTTP body to the data representation of the multipart request
    //        urlRequest.httpBody = file.data
    //
    //        // Perform the network request
    //        HttpUtility.shared.postData(request: urlRequest, resultType: UploadFileResponse.self) { response in
    //            completioHandler(response)
    //        }
    //    }
    
    
}
