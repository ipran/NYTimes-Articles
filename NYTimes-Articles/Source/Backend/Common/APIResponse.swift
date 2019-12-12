//
//  APIResponse.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

enum APIResponse <T,U> where U: Error {
    case success(T)
    case failure(U)
    
}

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return NYTimesMessages.requestFailed
        case .invalidData: return NYTimesMessages.invalidData
        case .responseUnsuccessful: return NYTimesMessages.responseUnsuccessful
        case .jsonParsingFailure: return NYTimesMessages.jsonParsingFailure
        case .jsonConversionFailure: return NYTimesMessages.jsonParsingFailure
            
        }
        
    }
    
}
