//
//  NYTimesAPIManager.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

class NYTimesAPIManager : BaseAPIManager {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        
    }
    convenience init() {
        self.init(configuration: .default)
        
    }
    /**
     Fetch data from server
     */
    func fetchData(completion: @escaping(APIResponse<NYModel,APIError>) -> Void) {
        let endPoint = NYTimesFeed.homeData
        var request = endPoint.request
        request.method = HTTPMethod.get
        fetch(with: request, decode: { json -> NYModel? in
            guard let result = json as? NYModel else { return nil }
            return result
            
        }, completion: completion)
        
    }
    
}
