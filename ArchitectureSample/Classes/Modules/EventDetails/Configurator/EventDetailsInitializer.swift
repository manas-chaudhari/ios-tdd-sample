//
//  EventDetailsEventDetailsInitializer.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class EventDetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var eventdetailsViewController: EventDetailsViewController!

    override func awakeFromNib() {

        let configurator = EventDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: eventdetailsViewController)
    }

}
