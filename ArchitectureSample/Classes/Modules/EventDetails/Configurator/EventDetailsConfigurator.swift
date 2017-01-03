//
//  EventDetailsEventDetailsConfigurator.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class EventDetailsModuleConfigurator {

    private let configuration: (EventDetailsModuleInput) -> Void

    init(event: GithubEvent) {
        configuration = { input in
            input.setup(event: event)
        }
    }

    func configure(viewController: EventDetailsViewController) {

        let router = EventDetailsRouter()

        let presenter = EventDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EventDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        configuration(presenter)
    }

}
