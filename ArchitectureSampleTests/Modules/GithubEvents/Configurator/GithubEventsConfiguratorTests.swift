//
//  GithubEventsGithubEventsConfiguratorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class GithubEventsModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = GithubEventsViewControllerMock()
        let configurator = GithubEventsModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "GithubEventsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is GithubEventsPresenter, "output is not GithubEventsPresenter")

        let presenter: GithubEventsPresenter = viewController.output as! GithubEventsPresenter
        XCTAssertNotNil(presenter.view, "view in GithubEventsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in GithubEventsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is GithubEventsRouter, "router is not GithubEventsRouter")

        let interactor: GithubEventsInteractor = presenter.interactor as! GithubEventsInteractor
        XCTAssertNotNil(interactor.output, "output in GithubEventsInteractor is nil after configuration")
    }

    class GithubEventsViewControllerMock: GithubEventsViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
