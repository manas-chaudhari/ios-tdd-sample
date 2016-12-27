//
//  GithubEventsGithubEventsConfiguratorTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble

class GithubEventsModuleConfiguratorTest: QuickSpec {
    
    override func spec() {
        describe("configure") {
            var viewController: GithubEventsViewController!
            var configurator: GithubEventsModuleConfigurator!
            
            beforeEach {
                viewController = GithubEventsViewController()
                configurator = GithubEventsModuleConfigurator()
                configurator.configure(viewController: viewController)
            }
            
            var presenter: GithubEventsPresenter? {
                return viewController.output as? GithubEventsPresenter
            }
            
            var router: GithubEventsRouter? {
                return presenter?.router as? GithubEventsRouter
            }
            
            var interactor: GithubEventsInteractor? {
                return presenter?.interactor as? GithubEventsInteractor
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
