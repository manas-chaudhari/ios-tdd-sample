//
//  GithubEventsGithubEventsViewInput.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

protocol GithubEventsViewInput: class {

    /**
        @author Manas Chaudhari
        Setup initial state of the view
    */

    func setupInitialState()
    
    func showEvents(events: [GithubEvent])
    func showError()
}
