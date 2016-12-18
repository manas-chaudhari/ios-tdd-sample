//
//  GithubEventsGithubEventsPresenterTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble

class GithubEventsPresenterSpec: QuickSpec {

    class MockInteractor: GithubEventsInteractorInput {
        var fetchEventsCallCount = 0
        
        internal func fetchEvents() {
            fetchEventsCallCount += 1
        }


    }

    class MockRouter: GithubEventsRouterInput {

    }

    class MockViewController: GithubEventsViewInput {

        func setupInitialState() {

        }
        
        var showEventsCallCount = 0
        var showEventsLastInput: [GithubEvent]? = nil
        
        func showEvents(events: [GithubEvent]) {
            showEventsCallCount += 1
            showEventsLastInput = events
        }
        
        
        var showErrorCallCount = 0
        
        func showError() {
            showErrorCallCount += 1
        }
    }
    
    override func spec() {
        let sut = GithubEventsPresenter()
        let mockView = MockViewController()
        let mockInteractor = MockInteractor()
        
        sut.view = mockView
        sut.interactor = mockInteractor
        
        context("when view is ready") {
            it("should fetch events") {
                sut.viewIsReady()
                
                expect(mockInteractor.fetchEventsCallCount).to(equal(1))
            }
        }
        
        context("after successful loading") {
            it("should display events") {
                let dummyEvents = [GithubEvent(id: 1, type: "")]
                
                sut.foundEvents(events: dummyEvents)
                
                expect(mockView.showEventsCallCount).to(equal(1))
                expect(mockView.showEventsLastInput).to(equal(dummyEvents))
            }
        }
        
        context("on loading error") {
            it("should display error") {
                sut.errorInFetchEvents()
                
                expect(mockView.showErrorCallCount).to(equal(1))
            }
        }
    }
}
