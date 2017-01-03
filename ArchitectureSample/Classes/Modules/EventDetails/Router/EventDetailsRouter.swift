//
//  EventDetailsEventDetailsRouter.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class EventDetailsRouter: EventDetailsRouterInput {

    class func pushDetailsPage(fromView: UINavigationController, for event: GithubEvent) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "EventDetails")
            as? EventDetailsViewController

        if let vc = vc {
            EventDetailsModuleConfigurator(event: event).configure(viewController: vc)
            fromView.pushViewController(vc, animated: true)
        }
    }
}
