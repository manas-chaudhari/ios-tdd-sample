//
//  GithubEventsGithubEventsPresenterTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class GithubEventsPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: GithubEventsInteractorInput {

    }

    class MockRouter: GithubEventsRouterInput {

    }

    class MockViewController: GithubEventsViewInput {

        func setupInitialState() {

        }
    }
}
