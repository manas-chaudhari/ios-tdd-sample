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
            it("tableView should be connected") {
                let sut = GithubEventsViewController()
                sut.output = MockGithubEventsViewOutput()
                _ = sut.view
                
                expect(sut.tableView).toNot(beNil())
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
