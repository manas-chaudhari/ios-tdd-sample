//
//  GithubEventsGithubEventsConfigurator.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 13/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit
import Result
import Moya

class GithubEventsModuleConfigurator {

    // TODO: Remove this method and initialize app via router
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? GithubEventsViewController {
            configure(viewController: viewController)
        }
    }

    func configure(viewController: GithubEventsViewController) {

        let router = GithubEventsRouter()
        router.viewController = viewController

        let presenter = GithubEventsPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let provider = MoyaProvider<GithubApi>()

        let interactor = GithubEventsInteractor(githubService: GithubService(provider: provider))
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
