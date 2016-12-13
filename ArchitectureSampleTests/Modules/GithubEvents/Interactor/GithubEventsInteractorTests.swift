//
//  GithubEventsGithubEventsInteractorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class GithubEventsInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchEmpty() {
        let sut = GithubEventsInteractor()
        let mockOutput = MockPresenter()
        sut.output = mockOutput
        
        sut.fetchEvents()
        XCTAssert(mockOutput.receivedEvents?.count == 0)
    }

    class MockPresenter: GithubEventsInteractorOutput {
        var receivedEvents: [Any]? = nil
    }
}
