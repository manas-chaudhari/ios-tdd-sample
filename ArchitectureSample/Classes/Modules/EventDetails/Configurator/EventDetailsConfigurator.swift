//
//  EventDetailsEventDetailsConfigurator.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class EventDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EventDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EventDetailsViewController) {

        let router = EventDetailsRouter()

        let presenter = EventDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EventDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
