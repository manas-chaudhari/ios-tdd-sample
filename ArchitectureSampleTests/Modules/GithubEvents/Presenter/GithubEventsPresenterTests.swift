//
//  GithubEventsGithubEventsPresenterTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble
@testable
import ArchitectureSample

class GithubEventsPresenterSpec: QuickSpec {

    class MockInteractor: GithubEventsInteractorInput {
        var fetchEventsCallCount = 0

        internal func fetchEvents() {
            fetchEventsCallCount += 1
        }

    }

    class MockRouter: GithubEventsRouterInput {
        var pushEventDetailsPageCallCount = 0
        var pushEventDetailsPageLastEvent: GithubEvent?

        func pushEventDetailsPage(for event: GithubEvent) {
            pushEventDetailsPageCallCount += 1
            pushEventDetailsPageLastEvent = event
        }
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

        var showLoaderCallCount = 0
        func showLoader() {
            showLoaderCallCount += 1
        }
    }

    override func spec() {
        var sut: GithubEventsPresenter!
        var mockView: MockViewController!
        var mockInteractor: MockInteractor!
        var mockRouter: MockRouter!

        beforeEach {
            sut = GithubEventsPresenter()
            mockView = MockViewController()
            mockInteractor = MockInteractor()
            mockRouter = MockRouter()

            sut.view = mockView
            sut.interactor = mockInteractor
            sut.router = mockRouter
        }

        context("when view is ready") {
            beforeEach {
                sut.viewIsReady()
            }

            it("should fetch events") {
                expect(mockInteractor.fetchEventsCallCount).to(equal(1))
            }

            it("should show loader") {
                expect(mockView.showLoaderCallCount).to(equal(1))
            }
        }

        context("after successful loading") {
            let dummyEvents = [GithubEvent(id: 1, type: "")]

            beforeEach {
                sut.foundEvents(events: dummyEvents)
            }

            it("should display events") {
                expect(mockView.showEventsCallCount).to(equal(1))
                expect(mockView.showEventsLastInput).to(equal(dummyEvents))
            }

            context("on row selection") {
                beforeEach {
                    sut.didSelectRow(at: 0)
                }

                it("should navigate to repository page") {
                    expect(mockRouter.pushEventDetailsPageCallCount).to(equal(1))
                    expect(mockRouter.pushEventDetailsPageLastEvent).to(equal(dummyEvents[0]))
                }
            }
        }

        context("on loading error") {
            it("should display error") {
                sut.errorInFetchEvents()

                expect(mockView.showErrorCallCount).to(equal(1))
            }
        }

        context("on retry") {
            beforeEach {
                sut.retryClicked()
            }

            it("should fetch events") {
                expect(mockInteractor.fetchEventsCallCount).to(equal(1))
            }

            it("should show loader") {
                expect(mockView.showLoaderCallCount).to(equal(1))
            }
        }
    }
}
