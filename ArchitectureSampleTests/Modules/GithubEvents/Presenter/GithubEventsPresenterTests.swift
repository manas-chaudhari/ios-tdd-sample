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
    }
    
    override func spec() {
        context("When view is ready") {
            
            it("should fetch events") {
                let sut = GithubEventsPresenter()
                let mockView = MockViewController()
                let mockInteractor = MockInteractor()
                
                sut.view = mockView
                sut.interactor = mockInteractor
                
                sut.viewIsReady()
                
                expect(mockInteractor.fetchEventsCallCount).to(equal(1))
            }
        }
    }
}
