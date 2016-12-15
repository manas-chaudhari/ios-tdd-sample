//
//  GithubServiceTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/15/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class GithubServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // TODO: Use nested tests using Quick for better structure
    func testGithubEventsWithDifferentIds_AreUnequal() {
        let sut1 = GithubEvent(id: 1)
        let sut2 = GithubEvent(id: 2)
        
        XCTAssert(sut1 != sut2)
    }
}
