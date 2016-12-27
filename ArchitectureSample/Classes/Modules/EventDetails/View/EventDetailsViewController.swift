//
//  EventDetailsEventDetailsViewController.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController, EventDetailsViewInput {

    var output: EventDetailsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EventDetailsViewInput
    func setupInitialState() {
    }
}
