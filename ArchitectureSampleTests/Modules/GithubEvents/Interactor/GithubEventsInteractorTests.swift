//
//  GithubEventsGithubEventsInteractorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest
import Moya
import Result

class GithubEventsInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchEvents() {
        let dummyEvents = [GithubEvent(id: 1), GithubEvent(id: 2)]
        let mockService = MockGithubService(stubResult: .success(dummyEvents))
        let sut = GithubEventsInteractor(githubService: mockService)
        let mockOutput = MockPresenter()
        sut.output = mockOutput
        
        sut.fetchEvents()
        XCTAssert(mockOutput.receivedEvents! == dummyEvents)
    }
    
    func testFetchEventsError() {
        // Refactoring required to mock error
    }

    class MockPresenter: GithubEventsInteractorOutput {
        var receivedEvents: [GithubEvent]? = nil
        
        func foundEvents(events: [GithubEvent]) {
            receivedEvents = events
        }
    }
    
    struct MockGithubService: GithubServiceType {
        let stubResult: Result<[GithubEvent], Moya.Error>
        
        func events(completion: (Result<[GithubEvent], Moya.Error>) -> ()) {
            completion(stubResult)
        }
    }
    
}
