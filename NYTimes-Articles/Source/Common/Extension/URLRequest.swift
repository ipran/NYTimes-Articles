//
//  URLRequest.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

extension URLRequest {
    public var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
            
        }
        set {
            self.httpMethod = newValue?.rawValue
            
        }
        
    }
    
}
