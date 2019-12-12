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

}
