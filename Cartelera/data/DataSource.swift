//
//  DataSource.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import Foundation

typealias SuccessCompletionBlock = (_ object: AnyObject) -> Void
typealias FailureCompletionBlock = (_ error: Error) -> Void

enum HTTPMethod: String {
    case POST
    case GET
}

protocol DataSource {
    func executeRequest(with url: URL, httpMethod: HTTPMethod, headers: [String: String], success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock)
}

extension DataSource {
    
    func executeRequest(with url: URL, httpMethod: HTTPMethod, headers: [String: String], success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock) {
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        config.timeoutIntervalForResource = 20.0
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, _, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    failure(error)
                } else if let jsonData = responseData {
                    success(jsonData as AnyObject)
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    failure(error)
                }
            }
        }
        
        task.resume()
        
    }
}

extension URL {
    func downloadImage(completion: @escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: self) { data, _, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async { // execute on main thread
                completion(data)
            }
        }

        task.resume()
    }
}

