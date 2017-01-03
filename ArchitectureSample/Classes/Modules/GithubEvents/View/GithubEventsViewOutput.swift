//
//  GithubEventsGithubEventsViewOutput.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

protocol GithubEventsViewOutput {

    /**
        @author Manas Chaudhari
        Notify presenter that view is ready
    */

    func viewIsReady()

    func retryClicked()

    func didSelectRow(at position: Int)
}
