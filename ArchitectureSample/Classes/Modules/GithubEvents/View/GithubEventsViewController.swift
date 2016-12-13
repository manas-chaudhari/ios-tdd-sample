//
//  GithubEventsGithubEventsViewController.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class GithubEventsViewController: UIViewController, GithubEventsViewInput {

    var output: GithubEventsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: GithubEventsViewInput
    func setupInitialState() {
    }
}
