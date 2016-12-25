//
//  GithubEventsGithubEventsViewController.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class GithubEventsViewController: UIViewController, GithubEventsViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var retryButton: UIButton!

    var output: GithubEventsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: GithubEventsViewInput
    func setupInitialState() {
    }
    
    func showEvents(events: [GithubEvent]) {
    }
    
    func showError() {
    }
    
    func showLoader() {
    }
    
    // MARK: Actions
    
    @IBAction func retryClicked() {
        output.retryClicked()
    }
}
