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
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: GithubEventsViewController.self))
                let sut = storyboard.instantiateViewController(withIdentifier: "GithubEventsViewController") as! GithubEventsViewController
                
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
