//
//  GithubEventsGithubEventsInteractor.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

class GithubEventsInteractor: GithubEventsInteractorInput {
    internal func fetchEvents() {
        output.foundEvents(events: [])
    }


    weak var output: GithubEventsInteractorOutput!

}
