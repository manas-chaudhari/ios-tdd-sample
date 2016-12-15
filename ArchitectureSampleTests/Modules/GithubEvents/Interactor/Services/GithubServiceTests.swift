//
//  GithubServiceTests.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/15/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import XCTest
import Quick
import Nimble

class GithubServiceSpec: QuickSpec {
    override func spec() {
        describe("GithubEvent") {
            it("is equal to another with same id") {
                expect(GithubEvent(id: 1) == GithubEvent(id: 1))
                    .to(beTruthy())
            }
            
            it("is not equal to another with different id") {
                expect(GithubEvent(id: 5) == GithubEvent(id: 10))
                    .toNot(beTruthy())
            }
        }
    }
}
