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
import ObjectMapper
import Moya_ObjectMapper

protocol GithubServiceType {
    func events(completion: @escaping (Result<[GithubEvent], Moya.Error>) -> Void)
}

class GithubService: GithubServiceType {
    let provider: MoyaProvider<GithubApi>

    init(provider: MoyaProvider<GithubApi>) {
        self.provider = provider
    }

    func events(completion: @escaping (Result<[GithubEvent], Moya.Error>) -> Void) {
        provider.request(.events) { result in
            switch result {
            case .success(let response):
                if let events = try? response.mapArray(GithubEvent.self) {
                    completion(.success(events))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
}
