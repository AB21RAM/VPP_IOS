//
//  HttpUtility.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation


final class HttpUtility {
    
    static let shared = HttpUtility()
    private init(){}
    
    func postData<T: Decodable>(request: URLRequest, resultType: T.Type, completionHandler: @escaping (_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
    func getData<T: Decodable>(request: URLRequest, resultType: T.Type, completionHandler: @escaping (_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil, let data = data {
                let response = try? JSONDecoder().decode(resultType.self, from: data)
                _ = completionHandler(response)
            }
        }.resume()
    }

    /*
    func getDataAsync<T: Decodable>(request: URLRequest, resultType: T.Type) async -> T? {
        
        return await withCheckedContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil, let data = data {
                    let response = try? JSONDecoder().decode(resultType.self, from: data)
                    continuation.resume(returning: response)
                }
            }.resume()
        }
    }
    func postDataAsync<T: Decodable>(request: URLRequest, resultType: T.Type) async -> T? {
        
        return await withCheckedContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                if(error == nil && data != nil) {
                    let response = try? JSONDecoder().decode(resultType.self, from: data!)
                    continuation.resume(returning: response)
                }
            }.resume()
        }
    }
    */
}
