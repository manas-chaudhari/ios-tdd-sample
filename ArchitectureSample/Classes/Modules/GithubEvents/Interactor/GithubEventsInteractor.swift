//
//  GithubEventsGithubEventsInteractor.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

class GithubEventsInteractor: GithubEventsInteractorInput {

    weak var output: GithubEventsInteractorOutput!
    let githubService: GithubServiceType
    
    init(githubService: GithubServiceType) {
        self.githubService = githubService
    }

    internal func fetchEvents() {
        githubService.events { (result) in
            if case .success(let events) = result {
                output.foundEvents(events: events)
            }
        }
    }
}
