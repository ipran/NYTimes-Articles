//
//  BaseAPIManager.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

protocol BaseAPIManager {
    var session: URLSession { get }
    func fetch<T: Codable>(with request: URLRequest, decode: @escaping(Codable) -> T?, completion: @escaping (APIResponse<T, APIError>) -> Void)
    
}

extension BaseAPIManager {
    
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func fetch<T: Codable>(with request: URLRequest, decode: @escaping(Codable) -> T?, completion: @escaping (APIResponse<T, APIError>) -> Void) {
        // Log only if logActivity is true
        if logActivity {
            Self.log(request: request)
            
        }
        // Call decodingTask func
        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
            //MARK: Change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(APIResponse.failure(error))
                        
                    }
                    else {
                        completion(APIResponse.failure(APIError.invalidData))
                        
                    }
                    return
                    
                }
                if let value = decode(json as! Codable) {
                    completion(APIResponse.success(value))
                    
                } else {
                    completion(APIResponse.failure(APIError.jsonParsingFailure))
                    
                }
                
            }
            
        }
        task.resume()
        
    }
    
    func decodingTask<T: Codable>(with request: URLRequest, decodingType: T.Type, completionHandler completion:@escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            // Log
            if logActivity {
                Self.log(data: data, response: response as? HTTPURLResponse, error: error)
                
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
                
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                        
                    }
                    catch _ {
                        completion(nil,.jsonConversionFailure)
                        
                    }
                    
                }
                else {
                    completion(nil, .invalidData)
                    
                }
                
            } else {
                completion(nil, .responseUnsuccessful)
                
            }
            
        }
        return task
        
    }
    
}

extension BaseAPIManager {
    
    static func log(request: URLRequest){
        let urlString = request.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"
        
        var requestLog = "\n---------- REQUEST ---------->\n"
        requestLog += "\(urlString)"
        requestLog += "\n\n"
        requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
        requestLog += "Host: \(host)\n"
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
            
        }
        if let body = request.httpBody{
            requestLog += "\n\(NSString(data: body, encoding: String.Encoding.utf8.rawValue)!)\n"
            
        }
        requestLog += "\n------------------------->\n";
        print(requestLog)
        
    }
    
    static func log(data: Data?, response: HTTPURLResponse?, error: Error?){
        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        
        var responseLog = "\n<---------- RESPONSE ----------\n"
        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
            
        }
        if let statusCode =  response?.statusCode{
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
            
        }
        if let host = components?.host{
            responseLog += "Host: \(host)\n"
            
        }
        for (key,value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
            
        }
        if let body = data{
            responseLog += "\n\(NSString(data: body, encoding: String.Encoding.utf8.rawValue)!)\n"
            
        }
        if error != nil{
            responseLog += "\nError: \(error!.localizedDescription)\n"
            
        }
        responseLog += "<------------------------\n";
        print(responseLog)
        
    }
    
}
