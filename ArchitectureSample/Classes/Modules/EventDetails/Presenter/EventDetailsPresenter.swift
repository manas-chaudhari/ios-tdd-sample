//
//  EventDetailsEventDetailsPresenter.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 27/12/2016.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

class EventDetailsPresenter: EventDetailsModuleInput, EventDetailsViewOutput, EventDetailsInteractorOutput {

    weak var view: EventDetailsViewInput!
    var interactor: EventDetailsInteractorInput!
    var router: EventDetailsRouterInput!

    func viewIsReady() {

    }
}
