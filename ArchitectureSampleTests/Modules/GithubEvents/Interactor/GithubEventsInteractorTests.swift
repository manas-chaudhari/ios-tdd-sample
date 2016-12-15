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
    var sut: GithubEventsInteractor!
    var mockOutput: MockPresenter!
    var mockService: MockGithubService!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockGithubService()
        sut = GithubEventsInteractor(githubService: mockService)
        mockOutput = MockPresenter()
        sut.output = mockOutput
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchEvents() {
        let dummyEvents = [GithubEvent(id: 1), GithubEvent(id: 2)]
        mockService.stubResult = .success(dummyEvents)
        
        sut.fetchEvents()
        
        XCTAssert(mockOutput.receivedEvents! == dummyEvents)
        XCTAssert(mockOutput.receivedError == false)
    }
    
    func testFetchEventsError() {
        mockService.stubResult = .failure(.underlying(MockError.mock))
        
        sut.fetchEvents()
        
        XCTAssert(mockOutput.receivedEvents == nil)
        XCTAssert(mockOutput.receivedError == true)
    }

    class MockPresenter: GithubEventsInteractorOutput {
        var receivedEvents: [GithubEvent]? = nil
        var receivedError: Bool = false
        
        func foundEvents(events: [GithubEvent]) {
            receivedEvents = events
        }
        
        func errorInFetchEvents() {
            receivedError = true
        }
    }
    
    class MockGithubService: GithubServiceType {
        var stubResult: Result<[GithubEvent], Moya.Error>!
        
        func events(completion: (Result<[GithubEvent], Moya.Error>) -> ()) {
            completion(stubResult)
        }
    }
    
    enum MockError: Swift.Error {
        case mock
    }
    
}
