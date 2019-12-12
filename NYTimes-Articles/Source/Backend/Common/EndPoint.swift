//
//  EndPoint.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

protocol EndPoint {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    
}

extension EndPoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
        
    }
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        
    }
    
}

enum NYTimesFeed {
    case homeData
    
}

extension NYTimesFeed: EndPoint {
    var base: String {
        return NYTimesURLConstants.baseURL
        
    }
    var path: String {
        switch self {
        case .homeData:
            return NYTimesURLConstants.mostPopulatArticles
            
        }
        
    }
    var method: HTTPMethod {
        return .get
        
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .homeData:
            return [URLQueryItem(name: NYTimesURLConstants.queryParamAPIKeyName, value: NYTimesURLConstants.nyTimesAPIKey)]
            
        }
        
    }
    
}
