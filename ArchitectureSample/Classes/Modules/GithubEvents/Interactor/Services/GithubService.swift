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


struct GithubEvent: Equatable {
    let id: Int
    let type: String
        
    public static func ==(lhs: GithubEvent, rhs: GithubEvent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.type == rhs.type
    }
}

protocol GithubServiceType {
    func events(completion: (Result<[GithubEvent], Moya.Error>) -> ())
}

class GithubService: GithubServiceType {
    func events(completion: (Result<[GithubEvent], Moya.Error>) -> ()) {
    }
}
