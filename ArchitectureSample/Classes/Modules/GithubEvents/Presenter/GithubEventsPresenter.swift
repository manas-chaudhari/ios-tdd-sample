//
//  GithubEventsGithubEventsPresenter.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

class GithubEventsPresenter: GithubEventsModuleInput, GithubEventsViewOutput, GithubEventsInteractorOutput {
    internal func errorInFetchEvents() {
        view.showError()
    }
    
    internal func foundEvents(events: [GithubEvent]) {
        view.showEvents(events: events)
    }


    weak var view: GithubEventsViewInput!
    var interactor: GithubEventsInteractorInput!
    var router: GithubEventsRouterInput!

    func viewIsReady() {
        interactor.fetchEvents()
    }
    
    func retryClicked() {
        interactor.fetchEvents()
    }
}
