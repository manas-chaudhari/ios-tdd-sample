//
//  EventDetailsEventDetailsPresenterTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble
@testable
import ArchitectureSample

class EventDetailsPresenterTest: QuickSpec {

    class MockInteractor: EventDetailsInteractorInput {

    }

    class MockRouter: EventDetailsRouterInput {

    }

    class MockViewController: EventDetailsViewInput {

        func setupInitialState() {

        }
    }

    override func spec() {
        describe("setup") {
            it("should store event") {
                let sut = EventDetailsPresenter()
                let dummyEvent = GithubEvent(id: 1, type: "")

                sut.setup(event: dummyEvent)

                expect(sut.event).to(equal(dummyEvent))
            }
        }
    }
}
