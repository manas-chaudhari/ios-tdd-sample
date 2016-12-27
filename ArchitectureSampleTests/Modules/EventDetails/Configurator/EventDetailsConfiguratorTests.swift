//
//  EventDetailsEventDetailsConfiguratorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble

class EventDetailsModuleConfiguratorTests: QuickSpec {

    override func spec() {
        describe("configure") {
            var viewController: EventDetailsViewController!
            var configurator: EventDetailsModuleConfigurator!
            
            beforeEach {
                viewController = EventDetailsViewController()
                configurator = EventDetailsModuleConfigurator()
                configurator.configure(viewController: viewController)
            }
            
            var presenter: EventDetailsPresenter? {
                return viewController.output as? EventDetailsPresenter
            }
            
            var router: EventDetailsRouter? {
                return presenter?.router as? EventDetailsRouter
            }
            
            var interactor: EventDetailsInteractor? {
                return presenter?.interactor as? EventDetailsInteractor
            }
            
            it("should setup all dependencies") {
                expect(presenter).toNot(beNil())
                expect(presenter?.view).toNot(beNil())
                
                expect(router).toNot(beNil())
                
                expect(interactor).toNot(beNil())
                expect(interactor?.output).toNot(beNil())
            }
        }
    }
}
