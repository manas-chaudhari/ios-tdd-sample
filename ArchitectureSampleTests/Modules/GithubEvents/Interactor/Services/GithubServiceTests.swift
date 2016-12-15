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
            let T1 = "Type1"
            let T2 = "Type2"
            
            it("is equal to another with same values") {
                let equalPairs = [
                    (GithubEvent(id: 1, type: T1), GithubEvent(id: 1, type: T1)),
                    (GithubEvent(id: 3, type: T2), GithubEvent(id: 3, type: T2)),
                ]
                
                equalPairs.forEach { pair in
                    expect(pair.0 == pair.1).to(beTruthy())
                }
            }
            
            it("is not equal to another with different values") {
                let unEqualPairs = [
                    (GithubEvent(id: 1, type: T1), GithubEvent(id: 2, type: T1)),
                    (GithubEvent(id: 3, type: T1), GithubEvent(id: 3, type: T2)),
                    (GithubEvent(id: 5, type: T1), GithubEvent(id: 10, type: T2)),
                ]
                
                unEqualPairs.forEach { pair in
                    expect(pair.0 == pair.1).toNot(beTruthy())
                }
            }
        }
    }
}
