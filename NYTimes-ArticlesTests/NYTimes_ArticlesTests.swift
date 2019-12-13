//
//  NYTimes_ArticlesTests.swift
//  NYTimes-ArticlesTests
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import XCTest
@testable import NYTimes_Articles

class NYTimes_ArticlesTests: XCTestCase {
    var expectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - API Test
    func testHomeAPI() {
        self.expectation = XCTestExpectation(description: "Fetching home data...")
        let apiManager = NYTimesAPIManager()
        
        apiManager.fetchData { (response) in
            switch(response) {
            case let .failure(error):
                print(error.localizedDescription)
                XCTFail()
                break
            case let .success(result):
                XCTAssertNotNil(result.results, "Home API Failed")
                print(result.results.description)
                
            }
            self.expectation?.fulfill()
            
        }
        wait(for: [self.expectation!], timeout: 20)
        
    }
    
    // MARK: - KingFisher library test
    func testImageDownloaded() {
        let placeHolerImage = #imageLiteral(resourceName: "placeholder")
        let imageView = UIImageView()
        let url = URL(string: "https://image.flaticon.com/icons/png/512/40/40323.png")
        imageView.loadImageFrom(url!)
        print(imageView.image!)
        assert(placeHolerImage == imageView.image , "error")
        
    }
    
    // MARK: - TableViewCell Identifier test
    func testHomeTableViewCellIdentifier() {
        let tableViewCellIdentifier = HomeTableViewCell.identifier
        assert(tableViewCellIdentifier == "HomeTableViewCell", "Home tableview cell identifier test failed")
        
    }
    
    // MARK: - Localized Description Test
    func testLocalizedDescriptionForAPIError() {
        let errorString = "Sorry, couldn't communicate with the server. Please check your network connection."
        assert(errorString == APIError.requestFailed.localizedDescription, "localized description of request failed APIError value is wrong")
        
    }
    func testLocalizedDescriptionForNYTimesMessages() {
        let errorString = "Sorry, couldn't communicate with the server. Please check your network connection."
        assert(errorString == NYTimesMessages.requestFailed, "localized description of request failed APIError value is wrong")
        
    }
    func testLocalizedDescriptionForNYTimesConstant() {
        let errorString = "NYTimes-Articles"
        assert(errorString == NYTimesConstants.appName, "NYTimes-Articles")
        
    }
    func testLocalizedDescriptionForNYTimesStoryboard() {
        let errorString = "Main"
        assert(errorString == NYTimesStoryboard.main, "Main")
        
    }
    func testLocalizedDescriptionForNYTimesURLConstants() {
        let errorString = "http://api.nytimes.com"
        assert(errorString == NYTimesURLConstants.baseURL, "http://api.nytimes.com")
        
    }
    

}
