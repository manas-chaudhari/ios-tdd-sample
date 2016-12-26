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
        var sut: GithubEventsViewController!
        var mockOutput: MockGithubEventsViewOutput!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: GithubEventsViewController.self))
            sut = storyboard.instantiateViewController(withIdentifier: "GithubEventsViewController") as! GithubEventsViewController
            
            mockOutput = MockGithubEventsViewOutput()
            sut.output = mockOutput
            
            _ = sut.view
        }
        
        describe("Outlets") {
            
            it("tableView should be connected") {
                expect(sut.tableView).toNot(beNil())
            }
            
            it("errorView should be connected") {
                expect(sut.errorView).toNot(beNil())
            }
            
            it("loaderView should be connected") {
                expect(sut.loaderView).toNot(beNil())
            }
            
            it("retryButton should be connected") {
                expect(sut.retryButton).toNot(beNil())
            }
        }
        
        describe("View Output") {
            
            it("viewIsReady should be called") {
                expect(mockOutput.viewIsReadyCallCount).to(equal(1))
            }
            
            it("retryClicked should be called") {
                sut.retryButton.sendActions(for: .touchUpInside)
                
                expect(mockOutput.retryClickedCallCount).to(equal(1))
            }
            
            describe("didSelectRow") {
                let dummyEvents = [GithubEvent(id: 1, type: "T1"),
                                   GithubEvent(id: 2, type: "T2")]
                
                beforeEach {
                    sut.showEvents(events: dummyEvents)
                }
                
                it("should be called when tableview cell is selected") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    sut.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                    _ = sut.tableView.delegate?.tableView?(sut.tableView, willSelectRowAt: indexPath)
                    sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
                    
                    expect(mockOutput.didSelectRowCallCount).to(equal(1))
                    expect(mockOutput.didSelectRowLastPosition).to(equal(0))
                }
            }
        }
        
        describe("View Inputs") {
            it("error should be visible") {
                sut.showError()
                
                expect(sut.loaderView.isHidden).to(beTrue())
                expect(sut.errorView.isHidden).to(beFalse())
                expect(sut.tableView.isHidden).to(beTrue())
            }
            
            it("loader should be visible") {
                sut.showLoader()
                
                expect(sut.loaderView.isHidden).to(beFalse())
                expect(sut.errorView.isHidden).to(beTrue())
                expect(sut.tableView.isHidden).to(beTrue())
            }
            
            describe("showEvents") {
                let dummyEvents = [GithubEvent(id: 1, type: "T1"),
                                   GithubEvent(id: 2, type: "T2")]
                
                beforeEach {
                    sut.showEvents(events: dummyEvents)
                }
                
                it("table should be visible") {
                    expect(sut.loaderView.isHidden).to(beTrue())
                    expect(sut.errorView.isHidden).to(beTrue())
                    expect(sut.tableView.isHidden).to(beFalse())
                }
                
                describe("numberOfSections") {
                    it("should be 1") {
                        expect(sut.tableView.numberOfSections).to(equal(1))
                    }
                }
                
                describe("numberOfRows") {
                
                    it("should be equal to events count") {
                        expect(sut.tableView.numberOfRows(inSection: 0)).to(equal(2))
                    }
                    
                    it("should be equal to events count(0)") {
                        sut.showEvents(events: [])
                        
                        expect(sut.tableView.numberOfRows(inSection: 0)).to(equal(0))
                    }
                }
                
                describe("tableView cell") {
                    
                    it("should be of type GithubEventCell") {
                        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                        
                        expect(cell).to(beAnInstanceOf(GithubEventCell.self))
                    }
                    
                    describe("GithubEventCell") {
                        var cell: GithubEventCell!
                        
                        beforeEach {
                            cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                                as! GithubEventCell
                        }
                        
                        it("should display GithubEvent's type") {
                            expect(cell.typeLabel.text).to(equal("Type: T1"))
                        }
                    }
                }
            }
        }
    }
    
    class MockGithubEventsViewOutput: GithubEventsViewOutput {
        var viewIsReadyCallCount = 0
        func viewIsReady() {
            viewIsReadyCallCount += 1
        }
        
        var retryClickedCallCount = 0
        func retryClicked() {
            retryClickedCallCount += 1
        }
        
        var didSelectRowCallCount = 0
        var didSelectRowLastPosition: Int? = nil
        func didSelectRow(at position: Int) {
            didSelectRowCallCount += 1
            didSelectRowLastPosition = position
        }
    }
}
