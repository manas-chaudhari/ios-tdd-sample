//
//  EventDetailsEventDetailsConfiguratorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest

class EventDetailsModuleConfiguratorTests: XCTestCase {

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
        let viewController = EventDetailsViewControllerMock()
        let configurator = EventDetailsModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "EventDetailsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is EventDetailsPresenter, "output is not EventDetailsPresenter")

        let presenter: EventDetailsPresenter = viewController.output as! EventDetailsPresenter
        XCTAssertNotNil(presenter.view, "view in EventDetailsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in EventDetailsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is EventDetailsRouter, "router is not EventDetailsRouter")

        let interactor: EventDetailsInteractor = presenter.interactor as! EventDetailsInteractor
        XCTAssertNotNil(interactor.output, "output in EventDetailsInteractor is nil after configuration")
    }

    class EventDetailsViewControllerMock: EventDetailsViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
