//
//  GithubService.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/15/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit
import Moya
import Result

protocol GithubServiceType {
    func events(completion: (Result<[GithubEvent], Moya.Error>) -> ())
}

struct GithubEvent {
    
}
