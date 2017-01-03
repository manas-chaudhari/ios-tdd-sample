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
import Quick
import Nimble

class GithubEventsInteractorTests: QuickSpec {

    override func spec() {
        var sut: GithubEventsInteractor!
        var mockOutput: MockPresenter!
        var mockService: MockGithubService!

        beforeEach {
            mockService = MockGithubService()
            sut = GithubEventsInteractor(githubService: mockService)
            mockOutput = MockPresenter()
            sut.output = mockOutput
        }

        describe("while fetching events") {
            context("with service response of 2 events") {
                let dummyEvents = [GithubEvent(id: 1, type: "A"), GithubEvent(id: 2, type: "B")]

                beforeEach {
                    mockService.stubResult = .success(dummyEvents)

                    sut.fetchEvents()
                }

                it("outputs the same 2 events") {
                    expect(mockOutput.receivedEvents!).to(equal(dummyEvents))
                }

                it("does not output error") {
                    expect(mockOutput.receivedError).to(beFalsy())
                }
            }

            context("with service response of error") {
                beforeEach {
                    mockService.stubResult = .failure(.underlying(MockError.mock))

                    sut.fetchEvents()
                }

                it("outputs the error") {
                    expect(mockOutput.receivedError).to(beTruthy())
                }

                it("does not output any events") {
                    expect(mockOutput.receivedEvents).to(beNil())
                }
            }
        }

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

        func events(completion: @escaping (Result<[GithubEvent], Moya.Error>) -> Void) {
            completion(stubResult)
        }
    }

    enum MockError: Swift.Error {
        case mock
    }

}
