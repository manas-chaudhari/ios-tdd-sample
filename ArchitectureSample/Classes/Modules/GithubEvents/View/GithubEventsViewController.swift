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
    
    var events: [GithubEvent] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        tableView.dataSource = self
    }


    // MARK: GithubEventsViewInput
    func setupInitialState() {
    }
    
    func showEvents(events: [GithubEvent]) {
        show(tableView)
        self.events = events
        tableView.reloadData()
    }
    
    func showError() {
        show(errorView)
    }
    
    func showLoader() {
        show(loaderView)
    }
    
    private func show(_ view: UIView) {
        [tableView, errorView, loaderView].forEach { (candidateView) in
            candidateView?.isHidden = candidateView != view
        }
    }
    
    // MARK: Actions
    
    @IBAction func retryClicked() {
        output.retryClicked()
    }
}

extension GithubEventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Event Cell", for: indexPath)
            as! GithubEventCell
        
        cell.configure(forEvent: events[indexPath.row])
        
        return cell
    }
}
