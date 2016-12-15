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


struct GithubEvent: Equatable {
    var id: Int!
    var type: String!
        
    public static func ==(lhs: GithubEvent, rhs: GithubEvent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.type == rhs.type
    }
}

extension GithubEvent: Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        type <- map["type"]
    }

    
}

protocol GithubServiceType {
    func events(completion: @escaping (Result<[GithubEvent], Moya.Error>) -> ())
}

class GithubService: GithubServiceType {
    func events(completion: @escaping (Result<[GithubEvent], Moya.Error>) -> ()) {
        let provider = MoyaProvider<GithubApi>(stubClosure: MoyaProvider.immediatelyStub)
        
        provider.request(.events) { result in
            switch result {
            case .success(let response):
                if let events = try? response.mapArray(GithubEvent.self) {
                    completion(.success(events))
                }
                
            default: break
            }
        }
        
    }
}
