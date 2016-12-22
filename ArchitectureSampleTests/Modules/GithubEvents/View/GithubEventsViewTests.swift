//
//  GithubEventsGithubEventsViewTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Quick
import Nimble

class GithubEventsViewTests: QuickSpec {
    override func spec() {
        describe("Outlets") {
            var sut: GithubEventsViewController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: GithubEventsViewController.self))
                sut = storyboard.instantiateViewController(withIdentifier: "GithubEventsViewController") as! GithubEventsViewController
                
                sut.output = MockGithubEventsViewOutput()
                _ = sut.view
            }
            
            it("tableView should be connected") {
                expect(sut.tableView).toNot(beNil())
            }
            
            it("errorView should be connected") {
                expect(sut.errorView).toNot(beNil())
            }
            
            it("loaderView should be connected") {
                expect(sut.loaderView).toNot(beNil())
            }
        }
    }
    
    class MockGithubEventsViewOutput: GithubEventsViewOutput {
        func viewIsReady() {
        }
        
        func retryClicked() {
        }
    }
}
