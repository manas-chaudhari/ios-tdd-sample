//
//  EventDetailsEventDetailsPresenterTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class EventDetailsPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: EventDetailsInteractorInput {

    }

    class MockRouter: EventDetailsRouterInput {

    }

    class MockViewController: EventDetailsViewInput {

        func setupInitialState() {

        }
    }
}
