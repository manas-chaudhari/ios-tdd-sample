//
//  GithubEventsGithubEventsPresenter.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

class GithubEventsPresenter: GithubEventsModuleInput, GithubEventsViewOutput, GithubEventsInteractorOutput {

    weak var view: GithubEventsViewInput!
    var interactor: GithubEventsInteractorInput!
    var router: GithubEventsRouterInput!

    var events: [GithubEvent]?

    func errorInFetchEvents() {
        view.showError()
    }

    func foundEvents(events: [GithubEvent]) {
        self.events = events
        view.showEvents(events: events)
    }

    func viewIsReady() {
        fetchData()
    }

    func retryClicked() {
        fetchData()
    }

    func didSelectRow(at position: Int) {
        if let event = events?[position] {
            router.pushEventDetailsPage(for: event)
        }
    }

    private func fetchData() {
        interactor.fetchEvents()
        view.showLoader()
    }
}
