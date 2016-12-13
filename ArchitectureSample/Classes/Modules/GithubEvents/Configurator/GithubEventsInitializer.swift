//
//  GithubEventsGithubEventsInitializer.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class GithubEventsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var githubeventsViewController: GithubEventsViewController!

    override func awakeFromNib() {

        let configurator = GithubEventsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: githubeventsViewController)
    }

}
