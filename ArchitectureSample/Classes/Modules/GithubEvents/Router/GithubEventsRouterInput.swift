//
//  GithubEventsGithubEventsRouterInput.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import Foundation

protocol GithubEventsRouterInput {
    func pushEventDetailsPage(for event: GithubEvent)
}
