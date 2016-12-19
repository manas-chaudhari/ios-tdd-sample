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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    
    var events: [GithubEvent]?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        output.viewIsReady()
    }


    // MARK: GithubEventsViewInput
    func setupInitialState() {
    }
    
    func showEvents(events: [GithubEvent]) {
        self.events = events
        tableView.reloadData()
        
        tableView.isHidden = false
        errorView.isHidden = true
        loaderView.isHidden = true
    }
    
    func showError() {
        tableView.isHidden = true
        errorView.isHidden = false
        loaderView.isHidden = true
    }
    
    func showLoader() {
        tableView.isHidden = true
        errorView.isHidden = true
        loaderView.isHidden = false
    }
    
    @IBAction func retryClicked(_ sender: Any) {
        output.retryClicked()
    }
}

extension GithubEventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event Cell", for: indexPath)
        if let event = events?[indexPath.row] {
            cell.textLabel?.text = event.type
        }
        return cell
    }
}
