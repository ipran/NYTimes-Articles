//
//  NYTimesConstants.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

struct NYTimesConstants {
    static let appName = "NYTimes-Articles"
    static let homeTableViewCellHeight = 127
    
}

// Hold storyboard name constants
struct NYTimesStoryboard {
    static let main = "Main"
    
}

struct NYTimesURLConstants {
    static let baseURL = "http://api.nytimes.com"
    static let mostPopulatArticles = "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
    static let queryParamAPIKeyName = "api-key"
    static let nyTimesAPIKey = "Cd2gTxTBjoAv1s7iLfzQLOqw0OiVlFHH"
    
}

struct NYTimesMessages {
    static let somethingWentWrong = "Something went wrong!"
    static let requestFailed = "Sorry, couldn't communicate with the server. Please check your network connection."
    static let invalidData = "The operation couldn't be completed. Invalid response"
    static let responseUnsuccessful = "Response Unsuccessful. There was an error connecting to the server"
    static let jsonParsingFailure = "Something's gone wrong with your request"
    
}

// Show/Hide log details
let logActivity = true

// Support Storyboards
enum NYStoryboard: String {
    case Main
    var name: String {
        return self.rawValue
        
    }
    
}
